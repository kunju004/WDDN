using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Gymwebform
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                string query = "insert into UserInfo(Id,UserName,Password)values(@Id,@UserName,@Password)";
                SqlCommand sqlcmd = new SqlCommand(query, con);
                sqlcmd.Parameters.AddWithValue("@Id","");
                sqlcmd.Parameters.AddWithValue("@UserName",TextBox1.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Password", TextBox2.Text.Trim());
                sqlcmd.ExecuteNonQuery();
                con.Close();
            }
            Response.Redirect("Login.aspx");
        }
    }
}