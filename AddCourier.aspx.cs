using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartMailingSystem
{
    public partial class AddCourier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["cid"] as string))
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void Enter_Click(object sender, EventArgs e)
        {
            //check for id if exist
            string id = "";
            string conn1 = ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(conn1);
            string sql = "Select * from [COURIER] where CourierID='" + CourIDBox.Text.Trim() + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader myReader1 = cmd.ExecuteReader();
            while (myReader1.Read())
            {
                id = myReader1.GetValue(0).ToString();
            }
            con.Close();
            if (id.Equals(""))
            {
                if (CourPhoneBox.Text.Length < 10 || CourPhoneBox.Text.Length > 10)
                {
                    Label1.Visible = true;
                    Label1.Text = "The phone number doesn't match the allowed length !!!";
                }
                else
                {
                    string phone = "";
                    con = new SqlConnection(conn1);
                    sql = "Select * from [COURIER] where CouPhone='" + CourPhoneBox.Text.Trim() + "'";
                    con.Open();
                    cmd = new SqlCommand(sql, con);
                    myReader1 = cmd.ExecuteReader();
                    while (myReader1.Read())
                    {
                        phone = myReader1.GetValue(4).ToString();
                    }
                    con.Close();
                    if (phone.Equals(""))
                    {
                        con = new SqlConnection(conn1); // to connect sql with our web
                        con.Open();
                        string query = "INSERT INTO COURIER(CourierID, CouFName, CouMName, CouLName, CouPhone, CouPassword)Values(@CourierID, @CouFName, @CouMName, @CouLName, @CouPhone, @CouPassword)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@CourierID", CourIDBox.Text);
                        cmd.Parameters.AddWithValue("@CouFName", CourFnameBox.Text);
                        cmd.Parameters.AddWithValue("@CouMName", CourMnameBox.Text);
                        cmd.Parameters.AddWithValue("@CouLName", CourLnameBox.Text);
                        cmd.Parameters.AddWithValue("@CouPhone", CourPhoneBox.Text);
                        cmd.Parameters.AddWithValue("@CouPassword", PSWDBox.Text);
                        cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        con.Close();
                        Label1.Visible = true;
                        Label1.Text = "The courier was added successfully";
                    }
                    else
                    {
                        Label1.Visible = true;
                        Label1.Text = "Courier phone is already exist !!!";
                    }
                }
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Courier ID is already exist !!!";
            }
        }
    }
}