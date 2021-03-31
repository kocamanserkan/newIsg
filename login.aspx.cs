using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{

    public partial class login : System.Web.UI.Page
    {

        Kontrol kontrol = new Kontrol();
        DataBase db = new DataBase();



        protected void Page_Load(object sender, EventArgs e)
        {









        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            if (kontrol.Giris(txtKULLANICIADI, txtPAROLA))
            {


                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + " Giriş başarılı... Hoşgeldin " + txtKULLANICIADI.Text + "');", true);



                HttpCookie cookie = new HttpCookie("Kurabiye");
                cookie.Expires = DateTime.Now.AddHours(3);
                cookie.Values.Add("kullanici_Adi", txtKULLANICIADI.Text);
                cookie.Values.Add("full_ad", db.fullAd(txtKULLANICIADI).Text);
              
                Response.Cookies.Add(cookie);
                Response.Redirect("PersonelPaneli.aspx");
                //Response.Redirect("Uygunsuzluk.aspx");
                //Response.Redirect("PersonelListesi.aspx");
                //Response.Redirect("Profil.aspx");
              
              

                //HttpCookie Cookie = new HttpCookie("Username");
                

                //Cookie.Value = db.fullAd(txtKULLANICIADI).Text;
             
                //Cookie.Expires = DateTime.Now.AddHours(3);
                //Response.Cookies.Add(Cookie);
                
                //Response.Redirect("PersonelPaneli.aspx");
                //Response.Redirect("Uygunsuzluk.aspx");
                //Response.Redirect("PersonelListesi.aspx");
                //Response.Redirect("Profil.aspx");

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Yanlış Kullanıcı Adı veya Şifre" + "');", true);
            }
        }


      

       




    }
}