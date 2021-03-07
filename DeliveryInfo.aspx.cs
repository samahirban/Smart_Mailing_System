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
    public partial class DeliveryInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["cid"] as string))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string PckgID = Request.QueryString["PckgID"].ToString();
                string CourID = Request.QueryString["CourID"].ToString();
                string RecID = Request.QueryString["RecID"].ToString();
                //retrive recipeint info
                string conn1 = ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(conn1);
                string sql1 = "Select * from [RECIPIENT] where RecipientID='" + RecID + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(sql1, con);
                SqlDataReader myreader = cmd.ExecuteReader();
                string Fname="", Lname="", phone="", RecEmail ="";
                while (myreader.Read())
                {
                    Fname = myreader.GetValue(1).ToString();
                    Lname = myreader.GetValue(3).ToString();
                    RecEmail = myreader.GetValue(4).ToString();
                    phone = myreader.GetValue(5).ToString();
                }
                con.Close();
                if (Fname.Equals("") || Lname.Equals("") || RecEmail.Equals("") || phone.Equals(""))
                {
                    //error
                }
                else
                {
                    RecNameBox.Text = Fname + " " + Lname;
                    RecPhoneBox.Text = phone;
                    RecEmailBox.Text = RecEmail;
                }
                //retrive courier info
                con = new SqlConnection(conn1);
                sql1 = "Select * from [COURIER] where CourierID='" + CourID + "'";
                con.Open();
                cmd = new SqlCommand(sql1, con);
                myreader = cmd.ExecuteReader();
                string CFname = "", CLname = "", Cphone = "";
                while (myreader.Read())
                {
                    CFname = myreader.GetValue(1).ToString();
                    CLname = myreader.GetValue(3).ToString();
                    Cphone = myreader.GetValue(4).ToString();
                }
                con.Close();
                if (CFname.Equals("") || CLname.Equals("") || Cphone.Equals(""))
                {
                    //error
                }
                else
                {
                    CourNameBox.Text = CFname + " " + CLname;
                    CourPhoneBox.Text = Cphone;
                }
                //retrive pckg info
                con = new SqlConnection(conn1);
                sql1 = "Select * from [PACKAGE] where PackageID='" + PckgID + "'";
                con.Open();
                cmd = new SqlCommand(sql1, con);
                myreader = cmd.ExecuteReader();
                string PWeight = "", PDate="", PTime="";
                while (myreader.Read())
                {
                    PWeight = myreader.GetValue(1).ToString();
                    PDate = myreader.GetValue(4).ToString();
                    PTime = myreader.GetValue(5).ToString();
                }
                con.Close();
                if (PWeight.Equals(""))
                {
                    //error
                }
                else
                {
                    PckgIDBox.Text = PckgID;
                    PckgWeightBox.Text = PWeight;
                    DelDateBox.Text = PDate;
                    DelTimeBox.Text = PTime;
                }
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

    }
}