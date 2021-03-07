using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SmartMailingSystem
{
    public partial class CouriersList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["cid"] as string))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Label1.Text = AssignedCourierList.Rows.Count.ToString();
                Label4.Text = CourierList.Rows.Count.ToString();
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void newCourier_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCourier.aspx");
        }

        protected void CourierList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var dropdown = (DropDownList)e.Row.FindControl("DistrictList");
                makeDistrictDropDownList("DisName", dropdown);
            }
        }

        protected void saveAssigning_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in CourierList.Rows)
            {
                DropDownList temp = (row.Cells[0].FindControl("DistrictList") as DropDownList);
                int courID = Convert.ToInt32(row.Cells[5].Text);
                string valDis = temp.SelectedItem.Value.ToString();
                if (!valDis.Equals("0"))
                {
                    string conn1 = ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(conn1);
                    string sql1 = "Update COURIER set Distrect='" + valDis + "'  where CourierID="+courID;
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sql1, con);
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
                    if(i != 0)
                    {
                        Label2.Visible = true;
                        Label2.Text = "Data modifications saved successfully";
                        CourierList.DataBind();
                        AssignedCourierList.DataBind();
                        Label1.Text = AssignedCourierList.Rows.Count.ToString();
                        Label4.Text = CourierList.Rows.Count.ToString();
                        // Do assigning pckgs to courier:
                        // count
                        con = new SqlConnection(conn1);
                        sql1 = "Select Count (*) from [ADDRESS] where Street='" + valDis + "'";
                        con.Open();
                        cmd = new SqlCommand(sql1, con);
                        int countId = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                        int[] RecipIds;
                        if (countId < 20) //To determin the target of the delivered packages
                        {
                            RecipIds = new int[countId];
                            string status = "full";
                            sql1 = "Update District set Status='" + status + "'";
                            updateSQL(sql1, conn1);
                        }
                        else
                        {
                            RecipIds = new int[20];
                        }
                        // search for all recipientIDs
                        con = new SqlConnection(conn1);
                        sql1 = "Select distinct RecipientID from [ADDRESS] where Street='" + valDis + "'";
                        con.Open();
                        cmd = new SqlCommand(sql1, con);
                        SqlDataReader myreader = cmd.ExecuteReader();
                        int j = 0;
                        while (myreader.Read())
                        {
                            RecipIds[j] = Convert.ToInt32(myreader.GetValue(0).ToString());
                            j++;
                        }
                        con.Close();
                        // Do assigning pckgs to courier
                        for (int k = 0; k < RecipIds.Length; k++)
                        {
                            con = new SqlConnection(conn1);
                            sql1 = "Update PACKAGE set CourierID='" + courID + "'  where (RecipientID='" + RecipIds[k] + "' AND Status IS NULL AND CourierID IS NULL)";
                            con.Open();
                            cmd = new SqlCommand(sql1, con);
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                    else
                    {
                        Label2.Visible = true;
                        Label2.Text = "Data modifications are not saved";
                    }
                }
            }
        }

        protected void updateSQL(string query, string conn1)
        {
            SqlConnection con = new SqlConnection(conn1);
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void makeDistrictDropDownList(string value, DropDownList dropdown)
        {
            string conn1 = ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(conn1);
            string sql1 = "Select DisName from [District] where Status IS NULL";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql1, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            dropdown.DataSource = dt;
            dropdown.DataTextField = value;
            dropdown.DataValueField = value;
            dropdown.DataBind();
            dropdown.Items.Insert(0, new ListItem("--Select District--", "0"));
        }

        protected void saveChanges_Click(object sender, EventArgs e)
        {
            GridViewRow gr = AssignedCourierList.SelectedRow;
            int getId = Convert.ToInt32(gr.Cells[6].Text);
            UserIDBox.Text = getId+"";
            string valDis = DropDownList1.SelectedItem.Value.ToString();
            if (!valDis.Equals("0"))
            {
                string conn1 = ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(conn1);
                string sql1 = "Update COURIER set Distrect='" + valDis + "'  where CourierID=" + getId;
                con.Open();
                SqlCommand cmd = new SqlCommand(sql1, con);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i != 0)
                {
                    Label3.Visible = true;
                    Label3.Text = "Data modifications saved successfully";
                    AssignedCourierList.DataBind();
                    Label1.Text = AssignedCourierList.Rows.Count.ToString();
                    Label4.Text = CourierList.Rows.Count.ToString();
                    saveChanges.Visible = false;
                    CourID.Visible = false;
                    UserIDBox.Visible = false;
                    District.Visible = false;
                    DropDownList1.Visible = false;
                    // Do assigning pckgs to courier:
                    // count
                    con = new SqlConnection(conn1);
                    sql1 = "Select Count (*) from [ADDRESS] where Street='" + valDis + "'";
                    con.Open();
                    cmd = new SqlCommand(sql1, con);
                    int countId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                    int[] RecipIds;
                    if (countId < 20) //To determin the target of the delivered packages
                    {
                        RecipIds = new int[countId];
                        string status = "full";
                        sql1 = "Update District set Status='" + status + "'";
                        updateSQL(sql1, conn1);
                    }
                    else
                    {
                        RecipIds = new int[20];
                    }
                    // search for all recipientIDs
                    con = new SqlConnection(conn1);
                    sql1 = "Select distinct RecipientID from [ADDRESS] where Street='" + valDis + "'";
                    con.Open();
                    cmd = new SqlCommand(sql1, con);
                    SqlDataReader myreader = cmd.ExecuteReader();
                    int j = 0;
                    while (myreader.Read())
                    {
                        RecipIds[j] = Convert.ToInt32(myreader.GetValue(0).ToString());
                        j++;
                    }
                    con.Close();
                    // Do assigning pckgs to courier
                    for (int k = 0; k < RecipIds.Length; k++)
                    {
                        con = new SqlConnection(conn1);
                        sql1 = "Update PACKAGE set CourierID='" + getId + "'  where (RecipientID='" + RecipIds[k] + "' AND Status IS NULL AND CourierID IS NULL)";
                        con.Open();
                        cmd = new SqlCommand(sql1, con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                else
                {
                    Label3.Visible = true;
                    Label3.Text = "Data modifications are not saved";
                }
            }
            else
            {
                Label3.Visible = true;
                Label3.Text = "Please select a district";
            }
        }

        protected void AssignedCourierList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label3.Visible = false;
            saveChanges.Visible = true;
            CourID.Visible = true;
            UserIDBox.Visible = true;
            District.Visible = true;
            DropDownList1.Visible = true;
            GridViewRow gr = AssignedCourierList.SelectedRow;
            int getId = Convert.ToInt32(gr.Cells[6].Text);
            UserIDBox.Text = getId + "";
            string conn1 = ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conn1))
            {
                makeDistrictDropDownList("DisName", DropDownList1);
            }
        }
    }
}