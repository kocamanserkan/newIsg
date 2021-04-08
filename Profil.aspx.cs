using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class Profil : System.Web.UI.Page
    {
        DataBase db = new DataBase();


        
        protected void Page_Load(object sender, EventArgs e)
        {
            //lbl_Kullaniciad.Text = Request.Cookies["Kurabiye"]["kullanici_Adi"].ToString();

            if (!Page.IsPostBack && !Page.IsCallback)
            {
                db.personelBilgi(lbl_Kullaniciad, lbl_ad, lbl_tc, lbl_isbaslama, lbl_meslek, lbl_sicil, lbl_mail);
                db.isListesi(ddlMeslek);

                txtEmail.Text = lbl_mail.Text;
                txtKullaniciAd.Text = lbl_Kullaniciad.Text;
                txtSicil.Text = lbl_sicil.Text;
                txt_isim.Text = lbl_ad.Text;
                txt_tckn.Text = lbl_tc.Text;


              







            }


            //lbl_HeaderAd.Text = lbl_ad.Text;
            //lbl_HeaderAd.Text = Request.Cookies["Kurabiye"]["full_ad"].ToString();

            //if (!string.IsNullOrEmpty(Request.Cookies["Profil"].Value.ToString()))
            //{

              
            //}
            //else
            //{
            //    Response.Redirect("login.aspx");

            //}



        }
    }
}