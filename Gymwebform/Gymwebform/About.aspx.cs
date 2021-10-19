using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Gymwebform
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("kunjpatel3103@gmail.com");
                mailMessage.To.Add("kunjpatel3103@gmail.com");
                mailMessage.Body = "<b>Sender Name:</b>" + txtName.Text + "<br/>" + "<b>Sender Email:</b>" + txtEmail.Text + "<br/>"
                    + "<b>Comments:</b>" + txtComment.Text;
                mailMessage.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("kunjpatel3103@gmail.com", "kpthegreat");
                smtpClient.Send(mailMessage);

                Label1.ForeColor = System.Drawing.Color.Aqua;
                Label1.Text = "Thanks for contacting us!";

                txtName.Enabled = false;
                txtEmail.Enabled = false;
                txtComment.Enabled = false;
                Button1.Enabled = false;
            }
            catch (Exception ex)
            {
                Label1.ForeColor = System.Drawing.Color.Aqua;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "There is an unknown problem. Please try Later";
            }
        }
    }
    }
