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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection con=new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                string query = "select count(1) from UserInfo where UserName=@UserName AND Password=@Password";
                SqlCommand sqlcmd = new SqlCommand(query, con);
                sqlcmd.Parameters.AddWithValue("@UserName", TextBox1.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@Password", TextBox2.Text.Trim());
                int count = Convert.ToInt32(sqlcmd.ExecuteScalar());
                if(count==1)
                {
                    Session["UserName"] = TextBox1.Text;
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
                con.Close();
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("MembersList.aspx");
        }
    }
}