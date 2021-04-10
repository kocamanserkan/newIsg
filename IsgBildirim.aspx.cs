using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class IsgBildirim : System.Web.UI.Page
    {

        serkanISGEntities1 db = new serkanISGEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            grdBILDIRIM.DataSource = db.BILDIRIMLVL1.ToList();
            if (!IsPostBack)
            {

                try
                {
                    grdBILDIRIM.DataBind();


                    ddlVardiya.DataSource = db.VARDIYA.Select(i => i.AD_VARDIYA).ToList();
                    ddlBildirimYapan.DataSource = db.PERSONEL.Select(i => i.PERSONEL_AD.ToUpper() + " " + i.PERSONEL_SOYAD.ToUpper()).ToList();
                    ddlBirim.DataSource = db.BIRIM.Select(i => i.AD_BIRIM).ToList();
                    ddlKategori.DataSource = db.KATEGORI.Where(i => i.DURUM == true).Select(i => i.AD_KATEGORI).ToList();
                    ddlLokasyon.DataSource = db.LOKASYONN.Select(i => i.AD_LOKASYON).ToList();
                    ddlMudahilPerson.DataSource = db.PERSONEL.Select(i => i.PERSONEL_AD.ToUpper() + " " + i.PERSONEL_SOYAD.ToUpper()).ToList();
                    ddlSorumluPersonel.DataSource = db.PERSONEL.Select(i => i.PERSONEL_AD.ToUpper() + " " + i.PERSONEL_SOYAD.ToUpper()).ToList();


                    ddlVardiya.DataBind();
                    ddlBildirimYapan.DataBind();
                    ddlBirim.DataBind();
                    ddlKategori.DataBind();
                    ddlLokasyon.DataBind();
                    ddlMudahilPerson.DataBind();
                    ddlSorumluPersonel.DataBind();

                    txtTarih.Text = DateTime.Now.ToString("yyyy-MM-dd");
                    txtSaat.Text = DateTime.Now.ToString("HH:mm");
                    txtTerminTarih.Text = DateTime.Now.ToString("yyyy-MM-dd");

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','succsess');", true);


                }
                catch (Exception)
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
                }

              

              
            }
        }

        protected void btnEKLE_Click(object sender, EventArgs e)
        {

            try
            {
                    BILDIRIMLVL1 yeniBildirim = new BILDIRIMLVL1();

                    string tarih = txtTarih.Text;
                    string saat = txtSaat.Text;
                    string Date = tarih + " " + saat;
                    yeniBildirim.TARIHSAAT = Date;
                    yeniBildirim.VARDIYA = ddlVardiya.Text;
                    yeniBildirim.PERSONEL_AD = ddlBildirimYapan.Text;
                    yeniBildirim.BIRIM = ddlBirim.Text;
                    yeniBildirim.KATEGORI = ddlKategori.Text;
                    yeniBildirim.LOKASYON = ddlLokasyon.Text;
                    yeniBildirim.ONLEMBOOL = ddlOnlemBool.Text;
                    yeniBildirim.ACIKLAMA = txtBildirimMetin.Text;
                    yeniBildirim.AKSIYON = txtAksiyon.Text;
                    yeniBildirim.GORSEL = imgBildirim.FileName.ToString();
                    yeniBildirim.MUDAHIL_PERSONEL = ddlMudahilPerson.Text;
                    yeniBildirim.DURUM = "Aktif";
                    yeniBildirim.BILDIRIM_DURUM = "Onay Bekliyor";

                    uygunsuzlukEkle(kontrol);


                    imgBildirim.PostedFile.SaveAs(Server.MapPath("~/upload/") + imgBildirim.FileName.ToString());

                    db.BILDIRIMLVL1.Add(yeniBildirim);
                    if (db.SaveChanges() > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Bildirim Kaydı Başarıyla Oluşturulmuştur','succsess');", true);
                        grdBILDIRIM.DataSource = db.BILDIRIMLVL1.ToList();
                        grdBILDIRIM.DataBind();

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction(Hay Aksi :('Bildirim Kaydı Oluşturulamadı'fail');", true);
                    }


              
              
            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction(Hay Aksi :(','fail');", true);
            }


        }


        public void uygunsuzlukEkle(CheckBox kontrol)
        {
            if (kontrol.Checked == true)
            {
                UYGUNSUZLUK yeniUygsunsuzluk = new UYGUNSUZLUK();
                yeniUygsunsuzluk.BIRIM = ddlBirim.Text;
                yeniUygsunsuzluk.AKTIFLIK = "1";
                yeniUygsunsuzluk.ONERI_AKSIYON = txtAksiyon.Text;
                yeniUygsunsuzluk.TERMIN_TARIH = Convert.ToDateTime(txtTerminTarih.Text);
                yeniUygsunsuzluk.TESPIT_EDEN_AD = ddlBildirimYapan.Text;
                yeniUygsunsuzluk.TESPIT_TARIH = Convert.ToDateTime(txtTarih.Text);
                yeniUygsunsuzluk.TUR = "Minör";
                yeniUygsunsuzluk.UYGUNSUZ_DURUM = txtUygunsuzDurum.Text;
                yeniUygsunsuzluk.SORUMLU_AD = ddlSorumluPersonel.Text;
                db.UYGUNSUZLUK.Add(yeniUygsunsuzluk);
               

            }
            else
            {
                return;
            }
        }

        protected void btn_sil_Click(object sender, EventArgs e)
        {
           
            BILDIRIMLVL1 deleteBILDIRIM = new BILDIRIMLVL1();
            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                                                                       // get the first cell value of the row
                                                                       // if you want to get controls in templatefield , just use row.FindControl
            int deleteID = Convert.ToInt32(linkbutton.CommandArgument);

            deleteBILDIRIM = db.BILDIRIMLVL1.FirstOrDefault(i => i.ID_BILDIRIM == deleteID);
            deleteBILDIRIM.DURUM = "Pasif"; 
       

            if (db.SaveChanges() > 0)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Bildirim silindi!','succsess');", true);
                grdBILDIRIM.DataSource = db.BILDIRIMLVL1.ToList();
                grdBILDIRIM.DataBind();


                //Response.Write("<script>MyFunction('İş Tanımı Silindi..','succsess');window.location = 'ISTANIMLARI.aspx';</script>");


            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Myfunction('iş Tanımı silme işlemi sırasında Hata oluştu','fail');", true);
                grdBILDIRIM.DataBind();
            }




        }
    }
}