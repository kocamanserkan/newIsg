using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Windows.Forms;

namespace serkanISG
{
    public partial class Uygunsuzluk : System.Web.UI.Page
    {
        
        serkanISGEntities1 db = new serkanISGEntities1();
      

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack && !IsCallback)
            {
                bind();

            }
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Uygunsuzluk Güncellendi','succsess');", true);
            

        }
        private void bind()
        {
            try
            {
                if (ddlAktiflik.SelectedValue == "Pasif")
                {
                    grdUygunsuz.DataSource = db.UYGUNSUZLUK.Where(i => i.AKTIFLIK == "Pasif").ToList();
                    grdUygunsuz.DataBind();
                   
                }
                else
                {
                    grdUygunsuz.DataSource = db.UYGUNSUZLUK.Where(i => i.AKTIFLIK == "Aktif").ToList();
                    grdUygunsuz.DataBind();


                }

                ddlBirim.DataSource = db.BIRIM.Select(i => i.AD_BIRIM.ToUpper()).ToList();
                ddlBirim.DataBind(); ;
                dtpTespitTarih.Text = DateTime.Now.ToString("yyyy-MM-dd");
                ddlSorumlu.DataSource = db.PERSONEL.Select(i => i.PERSONEL_AD.ToUpper() + " " + i.PERSONEL_SOYAD.ToUpper()).ToList();
                ddlTespitEden.DataSource = db.PERSONEL.Select(i => i.PERSONEL_AD.ToUpper() + " " + i.PERSONEL_SOYAD.ToUpper()).ToList();

                ddlSorumlu.DataBind();
                ddlTespitEden.DataBind();
                ddlTespitEden.Text = Session["FullName"].ToString().ToUpper();
                ddlBirim_edit.DataSource = db.BIRIM.Select(i => i.AD_BIRIM.ToUpper()).ToList();
                ddlBirim.DataBind();
                ddlTespiteden_edit.DataSource = db.PERSONEL.Select(i => i.PERSONEL_AD.ToUpper() + " " + i.PERSONEL_SOYAD.ToUpper()).ToList();
                ddlSorumlu_edit.DataSource = db.PERSONEL.Select(i => i.PERSONEL_AD.ToUpper() + " " + i.PERSONEL_SOYAD.ToUpper()).ToList();
                ddlTespiteden_edit.DataBind();
                ddlSorumlu_edit.DataBind();
                ddlBirim_edit.DataSource = db.BIRIM.Select(i => i.AD_BIRIM.ToUpper()).ToList();
                ddlBirim_edit.DataBind();
            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
                Response.Redirect("~/giris.aspx");
            }
          


        }

        protected void btnUygunsuzlukSave_Click(object sender, EventArgs e)
        {
            try
            {

                UYGUNSUZLUK yeniUyg = new UYGUNSUZLUK();
                yeniUyg.TUR = ddlTur.Text;
                yeniUyg.BIRIM = ddlBirim.SelectedValue;
                yeniUyg.TESPIT_TARIH = Convert.ToDateTime(dtpTespitTarih.Text);
                yeniUyg.UYGUNSUZ_DURUM = txtUygnsuzDurum.Text;
                yeniUyg.ONERI_AKSIYON = txtAksiyon.Text;
                yeniUyg.TESPIT_EDEN_AD = ddlTespitEden.SelectedValue;
                yeniUyg.SORUMLU_AD = ddlSorumlu.SelectedValue;
                yeniUyg.AKTIFLIK = "Aktif";
                yeniUyg.TERMIN_TARIH = Convert.ToDateTime(dateTerminTarihi.Text);
                db.UYGUNSUZLUK.Add(yeniUyg);
                if (db.SaveChanges() > 0)
                {
                    MODUL_MAILAYAR mailOnay = new MODUL_MAILAYAR();
                    mailOnay = db.MODUL_MAILAYAR.FirstOrDefault(i => i.ID_MODUL == 2);
                    MailSend ms = new MailSend();
                    PERSONEL per = new PERSONEL();
                    string fullad = ddlSorumlu.Text;
                    string[] parce = fullad.Split(' ');
                    string ad = parce[0];

                    per = db.PERSONEL.FirstOrDefault(i => i.PERSONEL_AD.ToUpper() == ad.ToUpper());
                    string MudahilMail = per.EMAIL;

                    string mail = "&lt;table width=&quot;100%&quot; border=&quot;0&quot; cellspacing=&quot;0&quot;&gt; &lt;tbody&gt; &lt;tr&gt; &lt;td align=&quot;center&quot; valign=&quot;top&quot; style=&quot;background-color: #f0f0f0; padding: 20px&quot;&gt; &lt;table width=&quot;100%&quot; border=&quot;0&quot; cellspacing=&quot;0&quot; style=&quot;box-sizing: border-box;&quot;&gt; &lt;tbody&gt; &lt;tr&gt; &lt;td style=&quot;background-color: #4791d2; border-bottom: 2px solid #367fbe; height: 6px;&quot;&gt;&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td style=&quot;background-color: #fff; text-align: left; padding: 20px;&quot;&gt; &lt;p style=&quot;font-family: Tahoma; font-size: 12px&quot;&gt; Sayın "+ddlSorumlu.SelectedValue+",&lt;br /&gt; &lt;br /&gt; Adınıza uygunsuzluk kaydı oluşturulmuştur. Aşağıdaki tablodan detayları inceleyebilirsiniz. &lt;/p&gt; &lt;table style=&quot;width: 100%; border-width: 1px; border-style: solid; border-collapse: collapse; font-size: 10pt; font-family: Tahoma;&quot; bordercolor=&quot;black&quot;&gt; &lt;tbody&gt; &lt;tr style=&quot;width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #FFFFFF;&quot;&gt; &lt;td style=&quot;width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;&quot;&gt;Tespit Tarihi&lt;/td&gt; &lt;td style=&quot;width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;&quot;&gt; "+dtpTespitTarih.Text+" &lt;/td&gt; &lt;/tr&gt; &lt;tr style=&quot;width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #FFFFFF;&quot;&gt; &lt;td style=&quot;width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;&quot;&gt;Termin Tarihi&lt;/td&gt; &lt;td style=&quot;width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;&quot;&gt;"+dateTerminTarihi.Text+" &lt;/td&gt; &lt;/tr&gt; &lt;tr style=&quot;width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #F7FBFF;&quot;&gt; &lt;td style=&quot;width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;&quot;&gt;Birim&lt;/td&gt; &lt;td style=&quot;width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;&quot;&gt; "+ddlBirim.SelectedValue+"&lt;/td&gt; &lt;/tr&gt; &lt;tr style=&quot;width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #FFFFFF;&quot;&gt; &lt;td style=&quot;width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;&quot;&gt;Uygunsuz Durum&lt;/td&gt; &lt;td style=&quot;width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;&quot;&gt; "+txtUygnsuzDurum.Text+" &lt;/td&gt; &lt;/tr&gt; &lt;tr style=&quot;width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #F7FBFF;&quot;&gt; &lt;td style=&quot;width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;&quot;&gt;&#214;nerilen Aksiyon &lt;/td&gt; &lt;td style=&quot;width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;&quot;&gt; "+txtAksiyon.Text+" &lt;/tr&gt; &lt;tr style=&quot;width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #FFFFFF;&quot;&gt; &lt;td style=&quot;width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;&quot;&gt;T&#252;r&lt;/td&gt; &lt;td style=&quot;width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;&quot;&gt;"+ddlTur.SelectedValue+" &lt;/td&gt; &lt;/tr&gt; &lt;tr style=&quot;width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #FFFFFF;&quot;&gt; &lt;td style=&quot;width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;&quot;&gt;Tespit Eden&lt;/td&gt; &lt;td style=&quot;width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;&quot;&gt;"+ddlTespitEden.SelectedValue+"&lt;/td&gt; &lt;/tr&gt; &lt;tr style=&quot;width: 100%; border: 1px solid black; border-collapse: collapse; background-color: #FFFFFF;&quot;&gt; &lt;td style=&quot;width: 20%; border: 1px solid black; border-collapse: collapse; text-align: left; font-weight: bold;&quot;&gt;Sorumlu&lt;/td&gt; &lt;td style=&quot;width: 80%; border: 1px solid black; border-collapse: collapse; text-align: left;&quot;&gt;"+ddlSorumlu.Text+"&lt;/td&gt; &lt;/tr&gt; &lt;/tbody&gt; &lt;/table&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td style=&quot;background-color: #4791d2; border-top: 2px solid #367fbe; height: 6px;&quot;&gt;&lt;/td&gt; &lt;/tr&gt; &lt;/tbody&gt; &lt;/table&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/tbody&gt; &lt;/table&gt;";


                    ms.MailGonder(mailOnay.YENI_KAYIT, MudahilMail, "Uygunsuzluk Bildirim Maili", HttpUtility.HtmlDecode(mail).ToString());
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Uygunsuzluk Eklendi','succsess');", true);

                    bind();
                    


                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Uygunsuzluk Kaydı Oluşturulamadı','fail');", true);
                }
      
                

            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }


        }

        protected void link_Click(object sender, EventArgs e)
        {
            try
            {
                UYGUNSUZLUK edit = new UYGUNSUZLUK();

                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton

                int editID = Convert.ToInt32(linkbutton.CommandArgument);
                edit = db.UYGUNSUZLUK.FirstOrDefault(i => i.ID_UYGUNSUZLUK == editID);

                label_ID.Text = Convert.ToString(edit.ID_UYGUNSUZLUK);
                ddlTur_edit.Text = edit.TUR;
                ddlDurum_Edit.Text = edit.AKTIFLIK;
                ddlBirim_edit.Text = edit.BIRIM;
                dtpTespitTarih_Edit.Text = Convert.ToDateTime(edit.TESPIT_TARIH).ToString("yyyy-MM-dd");
                txtUygnsuzDurum_Edit.Text = edit.UYGUNSUZ_DURUM;
                txtAksiyon_Edit.Text = edit.ONERI_AKSIYON;
                ddlTespiteden_edit.Text = edit.TESPIT_EDEN_AD.ToUpper();
                ddlSorumlu_edit.Text = edit.SORUMLU_AD.ToUpper();
                dtpTerminTarih_edit.Text = Convert.ToDateTime(edit.TERMIN_TARIH).ToString("yyyy-MM-dd");


                ScriptManager.RegisterStartupScript(this, GetType(), "serkan", "$('#edit_Modal').modal()", true);//show the modal
            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }
           



        }

        protected void Guncelle_Click(object sender, EventArgs e)
        {
            try
            {
                UYGUNSUZLUK upd = new UYGUNSUZLUK();
                int uptID = Convert.ToInt32(label_ID.Text);
                upd = db.UYGUNSUZLUK.FirstOrDefault(i => i.ID_UYGUNSUZLUK == uptID);

                upd.TUR = ddlTur_edit.SelectedValue;
                upd.AKTIFLIK = ddlDurum_Edit.SelectedValue;
                upd.BIRIM = ddlBirim_edit.SelectedValue;
                upd.TESPIT_TARIH = Convert.ToDateTime(dtpTespitTarih_Edit.Text);
                upd.UYGUNSUZ_DURUM = txtUygnsuzDurum_Edit.Text;
                upd.ONERI_AKSIYON = txtAksiyon_Edit.Text;
                upd.TESPIT_EDEN_AD = ddlTespiteden_edit.SelectedValue;
                upd.SORUMLU_AD = ddlSorumlu_edit.SelectedValue;
                upd.TERMIN_TARIH = Convert.ToDateTime(dtpTerminTarih_edit.Text);

                if (db.SaveChanges() > 0)
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Uygunsuzluk Güncellendi','succsess');", true);

                    bind();



                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Güncelleme işlemi başarısız','fail');", true);

                }
            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }
        }

        protected void btn_sil_Click(object sender, EventArgs e)
        {


            try
            {
                UYGUNSUZLUK delete = new UYGUNSUZLUK();

                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton

                int editID = Convert.ToInt32(linkbutton.CommandArgument);
                delete = db.UYGUNSUZLUK.FirstOrDefault(i => i.ID_UYGUNSUZLUK == editID);

                delete.AKTIFLIK = "Pasif";

                if (db.SaveChanges() > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Uygunsuzluk Silindi','succsess');", true);

                    bind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Silme işlemi başarısız','fail');", true);
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }
          


        }

        protected void ddlAktiflik_SelectedIndexChanged(object sender, EventArgs e)
        {
            bind();
        }

        protected void reload_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                UYGUNSUZLUK aktif = new UYGUNSUZLUK();

                int aktifID = Convert.ToInt32(linkbutton.CommandArgument);
                aktif = db.UYGUNSUZLUK.FirstOrDefault(i => i.ID_UYGUNSUZLUK == aktifID);
                aktif.AKTIFLIK = "Aktif";
                if (db.SaveChanges() > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt başarıyla aktife alındı','succsess');", true);
                    bind();
                }
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Myfunction('Aktife alma işlemi sırasında Hata oluştu','fail');", true);
                    bind();
                }

            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }
        }
    }
}