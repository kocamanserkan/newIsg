using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG.AYARLAR
{
    public partial class MailAyarlari : System.Web.UI.Page
    {
        serkanISGEntities1 db = new serkanISGEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    grdMODULS.DataSource = db.MODUL_MAILAYAR.ToList();
                    grdMODULS.DataBind();
                   
                }
               
            }
            catch (Exception)
            {

                throw;
            }
           
            
        }

        protected void btn_edit_link_Click(object sender, EventArgs e)
        {
            try
            {
                MODUL_MAILAYAR mod = new MODUL_MAILAYAR();
                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                int modulID = Convert.ToInt32(linkbutton.CommandArgument);
                mod = db.MODUL_MAILAYAR.FirstOrDefault(i => i.ID_MODUL == modulID);

                lblModulID.Text = mod.AD_MODUL;

                ckbFill(modulID);
                ScriptManager.RegisterStartupScript(this, GetType(), "serkan", "$('#myyModal').modal()", true);//show the modal

            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }

           


        }



        private void ckbFill(int ModulID)
        {
            try
            {
                MODUL_MAILAYAR modulMail = new MODUL_MAILAYAR();
                modulMail = db.MODUL_MAILAYAR.FirstOrDefault(i => i.ID_MODUL == ModulID);

                switch (modulMail.YENI_KAYIT)
                {
                    case "Aktif":
                        ckbCreate.Checked = true;
                        break;
                    case "Pasif":
                        ckbCreate.Checked = false;
                        break;


                }
                switch (modulMail.GUNCELLEME_KAYIT)
                {


                    case "Aktif":
                        ckbUpdate.Checked = true;
                        break;
                    case "Pasif":
                        ckbUpdate.Checked = false;
                        break;



                }
                switch (modulMail.SILME_KAYIT)
                {


                    case "Aktif":
                        ckbDelete.Checked = true;
                        break;
                    case "Pasif":
                        ckbDelete.Checked = false;
                        break;


                }

            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }

         


        }

        protected void btnUPdate_Click(object sender, EventArgs e)
        {


            try
            {

                MODUL_MAILAYAR upt = new MODUL_MAILAYAR();

                upt = db.MODUL_MAILAYAR.FirstOrDefault(i => i.AD_MODUL == lblModulID.Text);


                switch (ckbCreate.Checked)
                {


                    case true:
                        upt.YENI_KAYIT = "Aktif";
                        break;
                    case false:
                        upt.YENI_KAYIT = "Pasif";
                        break;


                }

                switch (ckbUpdate.Checked)
                {

                    case true:
                        upt.GUNCELLEME_KAYIT = "Aktif";
                        break;
                    case false:
                        upt.GUNCELLEME_KAYIT = "Pasif";
                        break;


                }

                switch (ckbDelete.Checked)
                {

                    case true:
                        upt.SILME_KAYIT = "Aktif";
                        break;
                    case false:
                        upt.SILME_KAYIT = "Pasif";
                        break;


                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Mail Ayarları Güncellenmiştir !','succsess');", true);
                db.SaveChanges();
                grdMODULS.DataSource = db.MODUL_MAILAYAR.ToList();
                grdMODULS.DataBind();

            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }





        }
    }
}