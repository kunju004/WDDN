using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using static Gymwebform.Models.CommonFunction;
using System.Configuration;
using System.Data.SqlClient;

namespace Gymwebform
{
	public partial class Equipments1 : System.Web.UI.Page
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
            string query = "SELECT * FROM Equipments";
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
            string name = (row.FindControl("txtequipname") as TextBox).Text;
            string quantity = (row.FindControl("txtequipquantity") as TextBox).Text;
            string musclefocus = (row.FindControl("txtequipmusclefocus") as TextBox).Text;
            string weight = (row.FindControl("txtequipweight") as TextBox).Text;

            string query = "UPDATE Equipments SET Name=@name, Quantity=@quantity, MuscleFocus=@musclefocus, WeightRange=@weight WHERE Id=@Id";
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@quantity", quantity);
                    cmd.Parameters.AddWithValue("@musclefocus", musclefocus);
                    cmd.Parameters.AddWithValue("@weight", weight);
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
            string query = "DELETE FROM Equipments WHERE Id=@Id";
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
                (e.Row.Cells[4].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
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
                string query = "insert into Equipments(Name,Quantity,MuscleFocus,WeightRange)values(@name,@quantity,@musclefocus,@weightrange)";
                SqlCommand sqlcmd = new SqlCommand(query, con);

                sqlcmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@quantity", txtQuantity.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@musclefocus", ddlMuscle.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@weightrange", txtWeight.Text.Trim());
                sqlcmd.ExecuteNonQuery();
                con.Close();
            }
            BindGrid();
        }
    }
}