using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class ISTANIMLARI : System.Web.UI.Page
    {
        serkanISGEntities1 db = new serkanISGEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (!IsPostBack && !IsCallback )
            {
                bind();
            }
            



        }

        private void bind()
        {
            if (ddlAktiflik.SelectedValue == "Pasif")
            {
                grdISTANIM.DataSource = db.TANIMIS.Where(i => i.DURUM_IS == "Pasif").ToList();
                grdISTANIM.DataBind();

            }
            else
            {

                grdISTANIM.DataSource = db.TANIMIS.Where(i => i.DURUM_IS == "Aktif").ToList();
                grdISTANIM.DataBind();
            }

        }
        protected void btn_Click(object sender, EventArgs e)
        {
 
            TANIMIS IS = new TANIMIS();
                 
            if (db.TANIMIS.Any(i => i.AD_IS.ToUpper() == txtISADI.Text.ToUpper()))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('"+ txtISADI.Text.ToString().ToUpper() + " Kayıtlarda Var.. Ekleme işlemi başarısız. !','fail');", true);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + txtISADI.Text.ToString().ToUpper() + " Kayıtlarda Var.. Ekleme işlemi başarısız.');", true);
                txtISADI.Text = string.Empty;
            }
            else
            {
                IS.AD_IS = txtISADI.Text.ToUpper();
                IS.DURUM_IS = "Aktif";
                
                 db.TANIMIS.Add(IS);


                db.SaveChanges();
                bind();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt Eklendi!','succsess');", true);

                txtISADI.Text = string.Empty;

            }





        }

        protected void link_Click(object sender, EventArgs e)
        {

            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
            TANIMIS edit = new TANIMIS();


            int editID = Convert.ToInt32(linkbutton.CommandArgument);
            edit = db.TANIMIS.FirstOrDefault(i => i.ID_IS == editID);


            txtIsAdi_edit.Text = edit.AD_IS;  // get the first cell value of the row
            Durum_edit.Text = edit.DURUM_IS;
            // if you want to get controls in templatefield , just use row.FindControl
            lblISid_edit.Text = linkbutton.CommandArgument;
            ScriptManager.RegisterStartupScript(this, GetType(), "serkan", "$('#myModal').modal()", true);//show the modal
           

        }

        protected void edit_Kaydet_Click(object sender, EventArgs e)
        {
            try
            {
                //ISTANIM editIS = new ISTANIM();
                TANIMIS editIS = new TANIMIS();
                int newID = Convert.ToInt32(lblISid_edit.Text);


                editIS = db.TANIMIS.FirstOrDefault(i => i.ID_IS == newID);

                editIS.AD_IS = txtIsAdi_edit.Text.ToUpper();
                editIS.DURUM_IS = Durum_edit.SelectedValue;


                if (db.SaveChanges() > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt başarıyle güncellendi!','succsess');", true);
                    bind();

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Güncelleme sırasında hata oluştu!','fail');", true);
                    bind();
                }


            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }

          


        

        }

        protected void btn_sil_Click(object sender, EventArgs e)
        {
            //ISTANIM deleteIS = new ISTANIM();
            TANIMIS deleteIS = new TANIMIS();
            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                                                                       // get the first cell value of the row
                                                                       // if you want to get controls in templatefield , just use row.FindControl
            int deleteID = Convert.ToInt32(linkbutton.CommandArgument);

            deleteIS = db.TANIMIS.FirstOrDefault(i => i.ID_IS == deleteID);

            deleteIS.DURUM_IS = "Pasif";

      

            if (db.SaveChanges() > 0)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt sss silindi!','succsess');", true);
                bind();

                //Response.Write("<script>MyFunction('İş Tanımı Silindi..','succsess');window.location = 'ISTANIMLARI.aspx';</script>");


            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Myfunction('iş Tanımı silme işlemi sırasında Hata oluştu','fail');", true);
                bind();
            }




        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('serkan','succsess');", true);
        }

        protected void ddlAktiflik_SelectedIndexChanged(object sender, EventArgs e)
        {


            if (ddlAktiflik.SelectedValue == "Pasif")
            {
                grdISTANIM.DataSource = db.TANIMIS.Where(i => i.DURUM_IS == "Pasif").ToList();
                bind();

            }
            else
            {

                grdISTANIM.DataSource = db.TANIMIS.Where(i => i.DURUM_IS == "Aktif").ToList();
                bind();




            }


        }

        protected void reload_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                TANIMIS aktif = new TANIMIS();

                int aktifID = Convert.ToInt32(linkbutton.CommandArgument);
                aktif = db.TANIMIS.FirstOrDefault(i => i.ID_IS == aktifID);
                aktif.DURUM_IS = "Aktif";
                if (db.SaveChanges() > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt başarıyla aktife alındı','succsess');", true);
                    bind();
                }
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Myfunction('Aktife alma işlemi sırasında Hata oluştu','fail');", true);
                    bind();
                }

            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }
           
        }
    }
}