using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class Register : System.Web.UI.Page
    {

        DataBase db = new DataBase();
        Kontrol cntrl = new Kontrol();

        public Register()
        {
           
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                db.isListesi(ddlIS);


               



            }






        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            



            Random rdn = new Random();

            int a = rdn.Next(30, 50);
            string suggest = Convert.ToString(a);

            if (cntrl.formKontrol(txtKULLANICI_ADI, txtPAROLA, txtAD, txtEMAIL, txtSOYAD, txtPAROLA_Kontrol, txtTCKN, txtSICIL_NO, ddlIS)) //Form Doluluk kontrolü
            {
                if (cntrl.KULLANICI_AD_Kontrol(txtKULLANICI_ADI)) //kullanııcı adı kontrol
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + txtKULLANICI_ADI.Text + " hali hazırda kullanımda " + txtKULLANICI_ADI.Text + suggest + " i deneyebilirsiniz " + "');", true);
                    txtKULLANICI_ADI.Text = string.Empty;
                }
                else
                {

                    if (txtPAROLA.Text==txtPAROLA_Kontrol.Text) // parola kontrol 
                    {

                        string SORGU = " insert into PERSONEL (PERSONEL_AD,PERSONEL_SOYAD,TCKN,SICIL_NO,YAPTIGI_IS,KULLANICI_ADI,SIFRE,EMAIL,IS_BASLANGIC_TARIH ) values ( '" + txtAD.Text + "','" + txtSOYAD.Text + "', '" + txtTCKN.Text + "','" + Convert.ToInt32(txtSICIL_NO.Text) + "','" + ddlIS.Text + "','" + txtKULLANICI_ADI.Text + "','" + txtPAROLA.Text + "','" + txtEMAIL.Text + "','" + dtpIS_BASLANGIC_TARIH.Text + "')";

                        db.personelEKle(SORGU);
                        
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + " Kayıt başarılı.. " + txtKULLANICI_ADI.Text + " kullanıcı adı ile sisteme ile giriş yapabilirsiniz "+"');", true);
                        //Response.Redirect("YourPage.aspx");
                        //or

                        Thread.Sleep(2000);

                        Response.Redirect("login.aspx");
                    }
                    else
                    {
                        txtPAROLA.Text = string.Empty;
                        txtPAROLA_Kontrol.Text = string.Empty;
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + " Şifreler uyuşmuyor, Lütfen şifrenizi gözden geçirin " + "');", true);
                    }

                }

            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + " Formdaki gerekli yerleri doldurunuz." + "');", true);

            }

        }

        protected void btnLoginEkran_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
            //or
            //Server.Transfer("YourPage.aspx");

            //TimeSpan fark = new TimeSpan();
            //fark = Convert.ToDateTime(dtpIS_BASLANGIC_TARIH.Text).Subtract(DateTime.Now);

            //if (fark.Days < 0)
            //{
            //    CustomValidator1.ErrorMessage = "amkkkk";


            //}
            //else
            //{
            //    CustomValidator1.ErrorMessage = "ohhh";

            //}



        }
    }
}