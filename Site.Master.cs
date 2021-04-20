using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class SiteMaster : MasterPage
    {
        serkanISGEntities1 db = new serkanISGEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string chldPage = Page.AppRelativeVirtualPath;
                if ((chldPage == "~/Uygunsuzluk.aspx"))
                {
                    Page.Title = "Uygunsuzluk";
                }
                if ((chldPage == "~/ISGBildirim.aspx"))
                {
                    Page.Title = "Seviye-1 ISG Bildirim";
                }
                if ((chldPage == "~/TANIM/Lokasyon.aspx"))
                {
                    Page.Title = "Lokasyon";
                }


                lblAd.Text = Session["FullName"].ToString();
                    string username = Session["UserName"].ToString();
                    PERSONEL rolUser = new PERSONEL();
                    rolUser = db.PERSONEL.FirstOrDefault(i => i.KULLANICI_ADI == username);


                    if (rolUser.Rol != "Admin")
                    {
                        panel.Visible = false;
                       
                    }
               


            }
            catch (Exception)
            {
                
           
                Response.Redirect("~/giris.aspx");
            }





        }
    }
}