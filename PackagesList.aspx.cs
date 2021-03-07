using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartMailingSystem
{
    public partial class PackagesList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["cid"] as string))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Label1.Text = CourierList.Rows.Count.ToString();
                Label2.Text = PckgDelivered.Rows.Count.ToString();
                Label3.Text = GridView1.Rows.Count.ToString();
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void PckgDelivered_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = PckgDelivered.SelectedRow;
            Response.Redirect("DeliveryInfo.aspx?PckgID=" + gr.Cells[1].Text + "&CourID=" + gr.Cells[4].Text + "&RecID=" + gr.Cells[3].Text);
        }
    }
}