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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void IdTextBox(object sender, EventArgs e)
        {
        }

        protected void Enter_Click(object sender, EventArgs e)
        {
            string password = "";
            string conn1 = ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(conn1);
            string sql1 = "Select AdminPSWD from [Admin] where AdminId='" + UserIDBox.Text.Trim() + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql1, con);
            SqlDataReader myreader = cmd.ExecuteReader();
            while (myreader.Read())
            {
                password = myreader.GetValue(0).ToString();
            }
            con.Close();
            if (password.Equals(PSWDBox.Text))
            {
                Session["cid"] = UserIDBox.Text;
                Session.Add("cid", UserIDBox.Text);
                Response.Redirect("AdminMainPage.aspx");
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = " Invalid data ! Please try again";
            }

        }

        protected void ForgetPSWD_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgetPSWD.aspx");
        }
    }
}