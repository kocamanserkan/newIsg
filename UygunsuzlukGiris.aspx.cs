using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class UygunsuzlukGiris : System.Web.UI.Page
    {

        DataBase db = new DataBase();
        Kontrol kontrol = new Kontrol();



        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Request.Cookies["Username"] != null)
            //{
            //    ddlTespitEden.Text = Request.Cookies["Username"].Value.ToString();

            //}



            if (!Page.IsCallback && !Page.IsPostBack)
            {


                ddlTespitEden.Text = Request.Cookies["Username"].Value.ToString();
                db.personelListesi(ddlSorumlu);
                db.personelListesi(ddlTespitEden);
                //ddlTespitEden.Text = txtAD.Text;

                //kontrolDate.Value = DateTime.Now.

            }




        }

        protected void btnVazgec_Click(object sender, EventArgs e)
        {
            Server.Transfer("PersonelPaneli.aspx");
        }

        protected void btnUygunsuzlukSave_Click(object sender, EventArgs e)
        {

            if (kontrol.uygunsuzlukFormKontrol(dtpTespitTarih, txtUygnsuzDurum, txtAksiyon, dateTerminTarihi, ddlSorumlu, ddlTespitEden))
            {

                if (ddlTespitEden.Text != ddlSorumlu.Text)
                {

                    string SORGU = " insert into UYGUNSUZLUK (BIRIM,TESPIT_TARIH,UYGUNSUZ_DURUM,ONERI_AKSIYON,SORUMLU_AD,TESPIT_EDEN_AD,TERMIN_TARIH,TUR) values ( '" + ddlBirim.Text + "','" + dtpTespitTarih.Text + "', '" + txtUygnsuzDurum.Text + "','" + (txtAksiyon.Text) + "','" + ddlSorumlu.Text + "','" + ddlTespitEden.Text + "','" + dateTerminTarihi.Text + "','" + ddlTur.Text + "')";

                    db.uygunsuzlukEkle(SORGU);


                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + " Uygunsuzluk kaydedilmiştir " + "');", true);
                   

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + " Tespit eden ile Sorumlu aynı kişi olamaz." + "');", true);

                }


            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + " Formdaki gerekli yerleri doldurunuz." + "');", true);
            }




            

        }
    }
}