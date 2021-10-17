using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Gymwebform.Models.CommonFunction;

namespace Gymwebform
{
	public partial class Equipments1 : System.Web.UI.Page
	{
        Commonfn fn = new Commonfn();
		protected void Page_Load(object sender, EventArgs e)
		{
            if(IsPostBack)
            {
                GetEquipments();
            }
		}

        private void GetEquipments()
        {
            DataTable dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY (SELECT 1)) as [SR.No], [Name], [Quantity], MuscleFocus, [WeightRange] 
                                    from Equipments");
            GridView1.DataSource = dt;
            GridView1.DataBind();
            
        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            try
            {
                if(ddlMuscle.SelectedValue!="0")
                {
                    string name = txtName.Text.Trim();
                    DataTable dt = fn.Fetch("Select * from Equipments where Name='" + name + "' ");
                    if(dt.Rows.Count==0)
                    {
                        string query = "Insert into Equipments values('" + txtName.Text.Trim() + "','" + txtQuantity.Text.Trim() + "','" +
                            ddlMuscle.Text.Trim() + "','" + txtWeight.Text.Trim() + "' ";
                        fn.Query(query);
                        Labelmsg.Text = "Inserted Successfully!";
                        Labelmsg.CssClass = "alert alert-success";
                        ddlMuscle.SelectedIndex = 0;
                        txtName.Text = string.Empty;
                       txtQuantity.Text = string.Empty;
                        ddlMuscle.Text = string.Empty;
                        txtWeight.Text = string.Empty;
                        GetEquipments();
                    }
                    else
                    {
                        Labelmsg.Text = "Entered<b>'" + name + "'already exists!";
                        Labelmsg.CssClass = "alert alert-danger";
                    }
                }
                else
                {

                    Labelmsg.Text = "Muscle Part is Required!";
                    Labelmsg.CssClass = "alert alert-danger";
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"');</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetEquipments();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetEquipments();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
              int eqid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string txtName = (row.FindControl("txtClassEdit") as TextBox).Text;
                fn.Query("Update Equipments set Name='" + txtName + "' where Name='" + eqid + "'");
                Labelmsg.Text = "Updated Successfully!";
                Labelmsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetEquipments();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}