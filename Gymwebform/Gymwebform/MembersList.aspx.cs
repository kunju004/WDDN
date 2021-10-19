using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Gymwebform
{
    public partial class MembersList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        //protected void ButtonSearch_Click(object sender, EventArgs e)
        //{
        //    BindGridView(TextBoxSearch.Text);
        //    //    GridView1.Style.Add("display", "none");

        //}
        //private void BindGridView(string searchVal)
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        //    {
        //        DataTable dt = new DataTable();
        //        string query = "select * from MemberInfo where MemberName like '%" + searchVal + "%';";
        //        SqlDataAdapter sda = new SqlDataAdapter(query, con);
        //        con.Open();
        //        sda.Fill(dt);
        //        con.Close();
        //        if (dt.Rows.Count > 0)
        //        {
        //            GridView3.DataSource = dt;
        //            GridView3.DataBind();
        //        }
        //    }
        //}

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT * FROM MemberInfo";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView3.DataSource = dt;
                        GridView3.DataBind();
                    }
                }
            }
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView3.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }
        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView3.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView3.Rows[e.RowIndex];
            int Id = Convert.ToInt32(GridView3.DataKeys[e.RowIndex].Values[0]);
            string membername = (row.FindControl("txtmembername") as TextBox).Text;
            string gender = (row.FindControl("txtgender") as TextBox).Text;
            string dob = (row.FindControl("txtdob") as TextBox).Text;
            string email = (row.FindControl("txtemail") as TextBox).Text;
            string address = (row.FindControl("txtaddress") as TextBox).Text;
            string mobile = (row.FindControl("txtmobile") as TextBox).Text;
            string joindate = (row.FindControl("txtjoindate") as TextBox).Text;
            string gymtime = (row.FindControl("txtgymtime") as TextBox).Text;
            string timeperiod = (row.FindControl("txttimeperiod") as TextBox).Text;
            string price = (row.FindControl("txtprice") as TextBox).Text;

            string query = "UPDATE MemberInfo SET MemberName=@membername, Gender=@gender,DOB=@dob, Email=@email, Address=@address, Mobile=@mobile, JoinDate=@joindate, GymTime=@gymtime, TimePeriod=@timeperiod, Price=@price WHERE Id=@Id";
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@membername", membername);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@dob", dob);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@address", address);
                    cmd.Parameters.AddWithValue("@mobile", mobile);
                    cmd.Parameters.AddWithValue("@joindate", joindate);
                    cmd.Parameters.AddWithValue("@gymtime", gymtime);
                    cmd.Parameters.AddWithValue("@timeperiod", timeperiod);
                    cmd.Parameters.AddWithValue("@price", price);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView3.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Id = Convert.ToInt32(GridView3.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM MemberInfo WHERE Id=@Id";
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.BindGrid();
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView3.EditIndex)
            {
                (e.Row.Cells[10].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView3.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }


        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                string query = "insert into MemberInfo(MemberName,Gender,DOB,Email,Address,Mobile,JoinDate,GymTime,TimePeriod,Price)values(@MemberName,@Gender,@DOB,@Email,@Address,@Mobile,@JoinDate,@GymTime,@TimePeriod,@Price)";
                SqlCommand sqlcmd = new SqlCommand(query, con);

                sqlcmd.Parameters.AddWithValue("@MemberName", txtMemberName.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Gender", txtGender.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@DOB", txtDOB.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Mobile", txtMobileNumber.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@JoinDate", txtJoinDate.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@GymTime", txtGymTime.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@TimePeriod", txtTimePeriod.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Price", txtPrice.Text.Trim());
                sqlcmd.ExecuteNonQuery();
                con.Close();
            }
            BindGrid();
        }
    }
}
