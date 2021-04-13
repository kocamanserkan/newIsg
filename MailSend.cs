using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace serkanISG
{
    public class MailSend
    {

        public bool MailGonder(string mailOnay,string to,string Subject,string Body)
        {
            if(mailOnay == "Aktif")
            {

                MailMessage message = new MailMessage("hissebotu41@gmailcom", to);
                message.Subject = Subject;
                message.Body = Body;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
                System.Net.NetworkCredential basicCredential1 = new
                System.Net.NetworkCredential("hissebotu41@gmail.com", "ditsxjvaibhddvwd");
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = basicCredential1;
                try
                {
                    client.Send(message);
                    return true;
                }

                catch (Exception)
                {
                    return false;
                }
            }
            else
            {
                return false;
            }



        }





    }




}