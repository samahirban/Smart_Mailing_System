using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartMailingSystem
{
    public partial class ForgetPSWD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Enter_Click(object sender, EventArgs e)
        {
            string adminInfo = "";
            string conn1 = ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(conn1);
            string sql1 = "Select AdminPSWD from [Admin] where AdminEmail='" + UserIDBox.Text.Trim() + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql1, con);
            SqlDataReader myreader = cmd.ExecuteReader();
            while (myreader.Read())
            {
                adminInfo = myreader.GetValue(0).ToString();
            }
            con.Close();
            if (adminInfo.Equals(""))
            {
                Label1.Visible = true;
                Label1.Text = "This e-mail is not registered in this system";
            }
            else
            {
                MailMessage sendMsg = new MailMessage("smaherbantan382@gmail.com", UserIDBox.Text);
                sendMsg.Subject = "Your Password";
                sendMsg.Body = string.Format("Hello!! Your password is ", adminInfo);
                sendMsg.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential nc = new NetworkCredential();
                nc.UserName = "smaherbantan382@gmail.com";
                nc.Password = "ilyofa77";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = nc;
                smtp.Port = 587;
                smtp.Send(sendMsg);
                Label1.Visible = true;
                Label1.Text = "Your password has been sent";
            }    
        }
    }
}