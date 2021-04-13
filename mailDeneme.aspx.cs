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
            MailSend ms = new MailSend();
            PERSONEL per = new PERSONEL();
            string fullad = mailListe.Text;
            string[] parce = fullad.Split(' ');
            string ad = parce[0];

            per = db.PERSONEL.FirstOrDefault(i => i.PERSONEL_AD == ad);
            string a = per.EMAIL;

            string c = "<table>" +
                "<colgroup span='4'>" + "</colgroup>" +
                "<tr>" +
                  "<th>Tarih ve Saat</th>" +
                  "<th>Birim</th>" +
                  "<th>Kategori</th>" +
                   "<th>Lokasyon</th>" +
                   "<th>Vardiya</th>" +
                   "<th>Önlem Gereksinimi</th>" +
                    "<th>Bildirimi Yapan</th>" +
                "</tr>" +
                "<tr>" +
                  "<td>" + "Date" + "</td>" +
                  "<td>" + "ddlBirim.Text" + "</td>" +
                  "<td>" + "ddlKategori.Text" + "</td>" +
                   "<td>" + "ddlLokasyon.Text" + "</td>" +
                   "<td>" + "ddlLokasyon.Text" + "</td>" +
                   "<td>" + "ddlVardiya.Text" + "</td>" +
                   "<td>" + "ddlOnlemBool.Text" + "</td>" +
                   "<td>" + "ddlBildirimYapan.Text" + "</td>" +
                "</tr>" +
               "</table>" + "Bildirim Metni:" + " " + "txtBildirimMetin.Text";
        



            var z = "&lt;table width=&quot;100%&quot; border=&quot;0&quot; cellspacing=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td align=&quot;center&quot; valign=&quot;top&quot; style=&quot;background-color: #f0f0f0; padding:20px&quot;&gt;&lt;table width=&quot;100%&quot; border=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;box-sizing: border-box;&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td style=&quot;background-color: #4791d2; border-bottom:2px solid #367fbe; height: 6px;&quot;&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;background-color:#fff;text-align:left; padding: 20px;&quot;&gt;&lt;p style=&quot;font-family:Tahoma; font-size:12px&quot;&gt;Sayın ilgili,&lt;br /&gt;Aşağıda bilgileri verilen ekibe atandınız.&lt;/p&gt;  &lt;table style=&quot;width: 100%; border-width: 1px; border-style: solid; border-collapse: collapse; font-size: 10pt; font-family: Tahoma;&quot; bordercolor=&quot;black&quot;&gt;   &lt;tbody&gt;&lt;tr style=&quot;width:100%; border: 1px solid black; border-collapse:collapse;background-color:#FFFFFF;&quot;&gt;    &lt;td style=&quot;width:20%; border: 1px solid black; border-collapse:collapse; text-align:left; font-weight:bold;&quot;&gt;Acil Durum Ekip T&#252;r&#252;&lt;/td&gt;    &lt;td style=&quot;width:80%; border: 1px solid black; border-collapse:collapse; text-align:left;&quot;&gt;Maden Kurtarma Ekibi (MAKUT)&lt;/td&gt;   &lt;/tr&gt;   &lt;tr style=&quot;width:100%; border: 1px solid black; border-collapse:collapse;background-color:#F7FBFF;&quot;&gt;    &lt;td style=&quot;width:20%; border: 1px solid black; border-collapse:collapse; text-align:left; font-weight:bold;&quot;&gt;Ekip Adı&lt;/td&gt;    &lt;td style=&quot;width:80%; border: 1px solid black; border-collapse:collapse; text-align:left;&quot;&gt;TEST1&lt;/td&gt;   &lt;/tr&gt;   &lt;tr style=&quot;width:100%; border: 1px solid black; border-collapse:collapse;background-color:#FFFFFF;&quot;&gt;    &lt;td style=&quot;width:20%; border: 1px solid black; border-collapse:collapse; text-align:left; font-weight:bold;&quot;&gt;Şirket&lt;/td&gt;    &lt;td style=&quot;width:80%; border: 1px solid black; border-collapse:collapse; text-align:left;&quot;&gt;DR. NEJAT F. ECZACIBAŞI VAKFI&lt;/td&gt;   &lt;/tr&gt;   &lt;tr style=&quot;width:100%; border: 1px solid black; border-collapse:collapse;background-color:#F7FBFF;&quot;&gt;    &lt;td style=&quot;width:20%; border: 1px solid black; border-collapse:collapse; text-align:left; font-weight:bold;&quot;&gt;Lokasyon&lt;/td&gt;    &lt;td style=&quot;width:80%; border: 1px solid black; border-collapse:collapse; text-align:left;&quot;&gt;Lokasyon 002&lt;/td&gt;   &lt;/tr&gt;   &lt;tr style=&quot;width:100%; border: 1px solid black; border-collapse:collapse;background-color:#FFFFFF;&quot;&gt;    &lt;td style=&quot;width:20%; border: 1px solid black; border-collapse:collapse; text-align:left; font-weight:bold;&quot;&gt;G&#246;rev Alanı&lt;/td&gt;    &lt;td style=&quot;width:80%; border: 1px solid black; border-collapse:collapse; text-align:left;&quot;&gt;&lt;/td&gt;   &lt;/tr&gt;   &lt;tr style=&quot;width:100%; border: 1px solid black; border-collapse:collapse;background-color:#FFFFFF;&quot;&gt;    &lt;td style=&quot;width:20%; border: 1px solid black; border-collapse:collapse; text-align:left; font-weight:bold;&quot;&gt;G&#246;revi&lt;/td&gt;    &lt;td style=&quot;width:80%; border: 1px solid black; border-collapse:collapse; text-align:left;&quot;&gt;Ekip Lideri&lt;/td&gt;   &lt;/tr&gt;  &lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;background-color: #4791d2; border-top:2px solid #367fbe; height: 6px;&quot;&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;";


            //ms.MailGonder("kocaman.serkan98@gmail.com", "htmlTable", HttpUtility.HtmlDecode(z).ToString());




            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Mail Gönderildi');", true);


        }
    }
}