using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class Kullanicilar : System.Web.UI.Page
    {
        serkanISGEntities1 db = new serkanISGEntities1();
        PERSONEL per = new PERSONEL();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsCallback && !IsPostBack)
            {
                ddllist.DataSource = db.PERSONEL.Where(i => i.Rol == null).Select(i => i.PERSONEL_AD.ToUpper() + " " + i.PERSONEL_SOYAD.ToUpper()).ToList();
                ddllist.DataBind();
                Bind();
                
            }
               

            //if (!IsCallback && !IsPostBack)
            //{

            //    grdKullanici.DataSource = db.PERSONEL.Where(i => i.Rol != null).ToList();
            //    grdKullanici.DataBind();
            //    ddlPersonel.DataSource = db.PERSONEL.Where(i => i.Rol == null).Select(i => i.PERSONEL_AD.ToUpper() + " " + i.PERSONEL_SOYAD.ToUpper()).ToList();
            //    ddlPersonel.DataBind();
            //    ckblBirim.DataSource = db.BIRIM.Select(i => i.AD_BIRIM).ToList();
            //    ckblBirim.DataBind();
            //    ddlLokasyon.DataSource = db.LOKASYONN.Select(i => i.AD_LOKASYON).ToList();
            //    ddlLokasyon.DataBind();
            //    ddlUnvan.DataSource = db.UNVAN.Select(i => i.AD_UNVAN).ToList();
            //    ddlUnvan.DataBind();
            //    ddlPersonel_Edit.DataSource = db.PERSONEL.Where(i => i.Rol != null).Select(i => i.PERSONEL_AD.ToUpper() + " " + i.PERSONEL_SOYAD.ToUpper()).ToList();
            //    ddlPersonel_Edit.DataBind();
            //    ddlUnvanEdit.DataSource = db.UNVAN.Select(i => i.AD_UNVAN).ToList();
            //    ddlUnvanEdit.DataBind();
            //    ckblBirimEdit.DataSource = db.BIRIM.Select(i => i.AD_BIRIM).ToList();
            //    ckblBirimEdit.DataBind();
            //    ddlLokasyonEdit.DataSource = db.LOKASYONN.Select(i => i.AD_LOKASYON).ToList();
            //    ddlLokasyonEdit.DataBind();

            //    for (int i = 0; i < ckblBirim.Items.Count; i++)
            //    {

            //        ckblBirim.Items[i].Attributes.Add("onclick", "MutExChkList(this)");



            //    }




            //}


        }

        private void Bind()
        {
            grdKullanici.DataSource = db.PERSONEL.Where(i => i.Rol != null).ToList();
            grdKullanici.DataBind();
            ddlPersonel.DataSource = db.PERSONEL.Where(i => i.Rol == null).OrderBy(i=>i.PERSONEL_AD).Select(i => i.PERSONEL_AD.ToUpper() + " " + i.PERSONEL_SOYAD.ToUpper()).ToList();
            ddlPersonel.DataBind();
            ckblBirim.DataSource = db.BIRIM.Select(i => i.AD_BIRIM).ToList();
            ckblBirim.DataBind();
            ddlLokasyon.DataSource = db.LOKASYONN.Select(i => i.AD_LOKASYON).ToList();
            ddlLokasyon.DataBind();
            ddlUnvan.DataSource = db.UNVAN.Select(i => i.AD_UNVAN).ToList();
            ddlUnvan.DataBind();
            ddlPersonel_Edit.DataSource = db.PERSONEL.Where(i => i.Rol != null).Select(i => i.PERSONEL_AD.ToUpper() + " " + i.PERSONEL_SOYAD.ToUpper()).ToList();
            ddlPersonel_Edit.DataBind();
            ddlUnvanEdit.DataSource = db.UNVAN.Select(i => i.AD_UNVAN).ToList();
            ddlUnvanEdit.DataBind();
            ckblBirimEdit.DataSource = db.BIRIM.Select(i => i.AD_BIRIM).ToList();
            ckblBirimEdit.DataBind();
            ddlLokasyonEdit.DataSource = db.LOKASYONN.Select(i => i.AD_LOKASYON).ToList();
            ddlLokasyonEdit.DataBind();

            for (int i = 0; i < ckblBirim.Items.Count; i++)
            {

                ckblBirim.Items[i].Attributes.Add("onclick", "MutExChkList(this)");


            }
        }

        protected void btnNewUser_Click(object sender, EventArgs e)
        {
            try
            {
                if (!db.PERSONEL.Any(i => i.KULLANICI_ADI == txtUsername.Text))
                {
                    string a = ddllist.Text;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('"+a+"');", true);
                    PERSONEL per = new PERSONEL();
                    per = db.PERSONEL.FirstOrDefault(i => i.PERSONEL_AD + " " + i.PERSONEL_SOYAD == ddlPersonel.Text);
                    per.KULLANICI_ADI = txtUsername.Text;
                    per.UNVAN_PERSONEL = ddlUnvan.Text;
                    per.Rol = ckblProfil.SelectedValue;
                    per.BIRIM_PERSONEL = ckblBirim.SelectedValue;
                    per.LOKASYON_PERSONEL = ddlLokasyon.Text;
                   
                    if (db.SaveChanges() > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Yeni Kullanıcı Eklendi!','succsess');", true);
                        Bind();
                        //grdKullanici.DataSource = db.PERSONEL.Where(i => i.Rol != null).ToList();
                        //grdKullanici.DataBind();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt esnasında bir hata oluştu.','fail');", true);

                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Bu kullanıcı adına sahip kullanıcı halihazırda mevcut.','fail');", true);


                }
            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi :( Beklenedik bir hata oluştu..','fail');", true);
            }
           






        }

        protected void link_Click(object sender, EventArgs e)
        {

            try
            {
                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton

               int linkID = Convert.ToInt32(linkbutton.CommandArgument);
                PERSONEL per = new PERSONEL();
                per = db.PERSONEL.FirstOrDefault(i => i.PERSONEL_ID == linkID);
                ddlPersonel_Edit.Text = per.PERSONEL_AD.ToUpper() + " " + per.PERSONEL_SOYAD.ToUpper();
                txtUserNameEdit.Text = per.KULLANICI_ADI;
                ddlUnvanEdit.Text = per.UNVAN_PERSONEL;
                ddlLokasyonEdit.Text = per.LOKASYON_PERSONEL;
                ckblProfilEdit.Items.FindByValue(per.Rol).Selected = true;
                ckblBirimEdit.Items.FindByValue(per.BIRIM_PERSONEL).Selected = true;

                ddlPersonel_Edit.Enabled = false;


                for (int i = 0; i < ckblBirimEdit.Items.Count; i++)
                {


                    ckblBirimEdit.Items[i].Attributes.Add("onclick", "MutExChkList(this)");

                }
                ScriptManager.RegisterStartupScript(this, GetType(), "serkan", "$('#myModal').modal()", true);//show the modal

            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }




        }

        protected void edit_Kaydet_Click(object sender, EventArgs e)
        {
            try
            {
                PERSONEL per = new PERSONEL();
                per = db.PERSONEL.FirstOrDefault(i => i.PERSONEL_AD.ToUpper() + " " + i.PERSONEL_SOYAD == ddlPersonel_Edit.Text.ToUpper());
           
                if(db.PERSONEL.FirstOrDefault(i=>i.KULLANICI_ADI == per.KULLANICI_ADI) != null)
                {
                    per.KULLANICI_ADI = txtUserNameEdit.Text;
                    per.UNVAN_PERSONEL = ddlUnvanEdit.Text;
                    per.Rol = ckblProfilEdit.SelectedValue;
                    per.BIRIM_PERSONEL = ckblBirimEdit.SelectedValue;
                    per.LOKASYON_PERSONEL = ddlLokasyonEdit.Text;


                    if (db.SaveChanges() > 0)
                    {
                        grdKullanici.DataSource = db.PERSONEL.Where(i => i.Rol != null).ToList();
                        grdKullanici.DataBind();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kullanıcı Güncellendi!','succsess');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Güncelleme Yapılamadı!','fail');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Güncellemeasdsadas Yapılamadı!','fail');", true);
                

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
                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton

                int deleteID = Convert.ToInt32(linkbutton.CommandArgument);
                PERSONEL per = new PERSONEL();
                per = db.PERSONEL.FirstOrDefault(i => i.PERSONEL_ID == deleteID);
                per.KULLANICI_ADI = null;
                per.BIRIM_PERSONEL = null;
                per.UNVAN_PERSONEL = null;
                per.LOKASYON_PERSONEL = null;
                per.Rol = null;

                db.SaveChanges();
                Bind();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kullanıcı Silindi!','succsess');", true);
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }
           






        }
    }
}