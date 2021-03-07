using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartMailingSystem
{
    public partial class AdminMainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["cid"] as string))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string conn1 = ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(conn1);
                con = new SqlConnection(conn1);
                //Finds how many district 
                string sql1 = "Select Count (*) from [District]";
                con.Open();
                SqlCommand cmd = new SqlCommand(sql1, con);
                int DistNum = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
                string[] DistName = new string[DistNum];
                //Save districts names
                sql1 = "Select DisName from [District]";
                con.Open();
                cmd = new SqlCommand(sql1, con);
                SqlDataReader myreader = cmd.ExecuteReader();
                int i = 0;
                while (myreader.Read())
                {
                    DistName[i] = myreader.GetValue(0).ToString();
                    i++;
                }
                con.Close();
                //Define how many recipient in a specific district
                for (int j = 0; j < DistName.Length; j++)
                {
                    //Finds how many recipient in each district
                    sql1 = "Select COUNT (DISTINCT RecipientID) from [ADDRESS] where Street='" + DistName[j] + "'";
                    con.Open();
                    cmd = new SqlCommand(sql1, con);
                    int RecNum = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                    //List them
                    sql1 = "Select DISTINCT RecipientID from [ADDRESS] where Street='"+ DistName[j]+ "'";
                    int[] RecID = new int[RecNum];
                    con.Open();
                    cmd = new SqlCommand(sql1, con);
                    myreader = cmd.ExecuteReader();
                    int k = 0;
                    while (myreader.Read())
                    {
                        RecID[k] = Convert.ToInt32(myreader.GetValue(0).ToString());
                        k++;
                    }
                    con.Close();
                    //Find how many recipient of them have pckgs need to assign a courier and to diliver
                    int RecNotDelivered = 0;
                    for (int l = 0; l < RecID.Length; l++)
                    {
                        sql1 = "Select COUNT (*) from [PACKAGE] where CourierID IS NULL AND RecipientID='" + RecID[l] + "'";
                        con.Open();
                        cmd = new SqlCommand(sql1, con);
                        RecNotDelivered += Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                    if (RecNotDelivered!=0)
                    {
                        con = new SqlConnection(conn1);
                        sql1 = "Update District set Status='"+null+"' where DisName='"+ DistName[j] + "'";
                        con.Open();
                        cmd = new SqlCommand(sql1, con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    else
                    {
                        con = new SqlConnection(conn1);
                        sql1 = "Update District set Status='" + "full" + "' where DisName='" + DistName[j] + "'";
                        con.Open();
                        cmd = new SqlCommand(sql1, con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }

        protected void Courier_Click(object sender, EventArgs e)
        {
            Response.Redirect("CouriersList.aspx");
        }

        protected void Packages_Click(object sender, EventArgs e)
        {
            Response.Redirect("PackagesList.aspx");
        }
    }
}