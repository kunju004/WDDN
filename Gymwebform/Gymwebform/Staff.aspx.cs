using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gymwebform
{
    public partial class Staff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                
                this.BindGrid();
            }
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT * FROM Staff";
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
            string mobile = (row.FindControl("txtnum") as TextBox).Text;
            string name = (row.FindControl("txtname") as TextBox).Text;
            string age = (row.FindControl("txtAge") as TextBox).Text;
            string experience = (row.FindControl("txtExp") as TextBox).Text;
            string expertise = (row.FindControl("txtSkill") as TextBox).Text;

            string query = "UPDATE Staff SET Mobile=@mobile, Name=@name, Age=@age, Experience=@experience, Expertise=@expertise WHERE Id=@Id";
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@mobile", mobile);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@age", age);
                    cmd.Parameters.AddWithValue("@experience", experience);
                    cmd.Parameters.AddWithValue("@expertise", expertise);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
                GridView3.EditIndex = -1;
                this.BindGrid();
            }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Id = Convert.ToInt32(GridView3.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM Staff WHERE Id=@Id";
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
                (e.Row.Cells[5].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
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
                string query = "insert into Staff(Mobile,Name,Age,Experience,Expertise)values(@Mobile,@Name,@Age,@Experience,@Expertise)";
                SqlCommand sqlcmd = new SqlCommand(query, con);

                sqlcmd.Parameters.AddWithValue("@Mobile", txtNum.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Age", txtAge.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Experience", txtExp.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Expertise", txtSkill.Text.Trim());
                sqlcmd.ExecuteNonQuery();
                con.Close();
            }
            BindGrid();
        }
    }
}