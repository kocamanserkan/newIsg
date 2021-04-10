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
    public partial class mailDeneme : System.Web.UI.Page
    {
        MailSend hop = new MailSend();
        serkanISGEntities1 db = new serkanISGEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                mailListe.DataSource = db.PERSONEL.Select(i => i.PERSONEL_AD + " " + i.PERSONEL_SOYAD).ToList();
                mailListe.DataBind();
            }
            
        }

        protected void send_Click(object sender, EventArgs e)
        {
            PERSONEL per = new PERSONEL();
            string fullad = mailListe.Text;
            string[] parce = fullad.Split(' ');
            string ad = parce[0];

            per = db.PERSONEL.FirstOrDefault(i => i.PERSONEL_AD == ad);
            string a = per.EMAIL;


            MailMessage message = new MailMessage("kocaman.serkan98@gmail.com", "kocaman.serkan98@gmail.com");

            string mailbody = "In this article you will learn how to send a email using Asp.Net & C#";
            message.Subject = "Sending Email Using Asp.Net & C#";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential("kocaman.serkan98@gmail.com", "Serkank4160");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            }

            catch (Exception ex)
            {
                throw ex;
            }




            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Mail Gönderildi');", true);


        }
    }
}