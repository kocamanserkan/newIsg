using System;
using System.Collections.Generic;
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