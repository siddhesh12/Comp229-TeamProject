using System;
using System.Net.Mail;
using System.Web.Mail;

namespace PersonalLibraryProject_comp229.Pages
{
    public partial class ContactUs : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void emailSendButton(object sender, EventArgs e) //email send button
        {
            using (System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage())
            {
                message.From = new MailAddress("mymailid@domain.com");
                message.To.Add(new MailAddress("me@domain.com"));
                message.CC.Add(new MailAddress("copy@domain.com"));
                message.Subject = "Message via My Site from " + YourName.Text.ToString();
                message.Body = Comments.Text.ToString();
                SmtpClient SmtpClient = new SmtpClient();
                SmtpClient.Host = "mail.domain.com";
                SmtpClient.Port = 587;
                SmtpClient.EnableSsl = true;
                SmtpClient.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                SmtpClient.Timeout = 20000;
                SmtpClient.Send(message);
            }
        }


    }
}