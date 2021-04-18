using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class Giris : System.Web.UI.Page
    {
        serkanISGEntities1 db2 = new serkanISGEntities1();
        Kontrol kontrol = new Kontrol();
        DataBase db = new DataBase();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {

            PERSONEL enter = new PERSONEL();

            enter = db2.PERSONEL.FirstOrDefault(i => i.KULLANICI_ADI == txtKULLANICIADI.Text);
            if (enter != null && enter.SIFRE == txtPAROLA.Text)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + " Giriş başarılı... Hoşgeldin Serkan Entities " + txtKULLANICIADI.Text + "');", true);
                Session["UserName"] = txtKULLANICIADI.Text;
                Session["FullName"] = enter.PERSONEL_AD + " " + enter.PERSONEL_SOYAD;
                Response.Redirect("PERSONEL/PersonelPaneli.aspx");






            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Yanlış Kullanıcı Adı veya Şifre" + "');", true);
            }

        }
    }
}