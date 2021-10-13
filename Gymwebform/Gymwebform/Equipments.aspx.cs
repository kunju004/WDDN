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
        Common fn = new Common();
		protected void Page_Load(object sender, EventArgs e)
		{
            if(!IsPostBack)
            {
                GetEquipment();
            }
		}

		private void GetEquipment()
        {
            DataTable dt = fn.Fetch("Select Row_NUMBER() over(Order by (Select 1)as [Sr.No],Name,Quantity,Muscle-focus,Weight-range,Picture from Equipments");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("Select * from Equipments where Name='"+TextBox1.Text.Trim()+"'");
                if(dt.Rows.Count==0)
                {
                    string query = "Insert into Equipents values()";
                }
                else
                {

                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}