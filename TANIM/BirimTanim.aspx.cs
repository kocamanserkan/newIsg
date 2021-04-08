using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class BirimTanim : System.Web.UI.Page
    {
        serkanISGEntities1 db = new serkanISGEntities1();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            grdBIRIM.DataSource = db.BIRIM.ToList();

            if (!IsPostBack)
            {
                grdBIRIM.DataBind();
            }

        }
       
        protected void btnEKLE_Click(object sender, EventArgs e)
        {
            BIRIM newBirim = new BIRIM();
            

            if (db.BIRIM.Any(i => i.AD_BIRIM.ToUpper() == txtBirimAd.Text.ToUpper()))
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('" + txtBirimAd.Text.ToUpper() + " Kayıtlarda Var.. Ekleme işlemi başarısız. !','fail');", true);

            }
            else{
                
              
                try
                {
                    newBirim.AD_BIRIM = txtBirimAd.Text.ToUpper(); ;
                    db.BIRIM.Add(newBirim);

                    db.SaveChanges();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('" + txtBirimAd.Text.ToUpper() + " eklendi !','succsess');", true);
                    txtBirimAd.Text = string.Empty;
                    grdBIRIM.DataSource = db.BIRIM.ToList();
                    grdBIRIM.DataBind();

                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
                    txtBirimAd.Text = string.Empty;
                }

            }
         

        }
        protected void btn_edit_link_Click(object sender, EventArgs e)
        {

            try
            {
                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                txtBirimAdi_edit.Text = HttpUtility.HtmlDecode(row.Cells[2].Text.ToString());  // get the first cell value of the row
                                                                                         // if you want to get controls in templatefield , just use row.FindControl
                lblBirimEditID.Text = linkbutton.CommandArgument;
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
                BIRIM edit_birim = new BIRIM();
                int editID = Convert.ToInt32(lblBirimEditID.Text);
                edit_birim = db.BIRIM.FirstOrDefault(i => i.ID_BIRIM == editID);

                if (db.BIRIM.Any(i => i.AD_BIRIM.ToUpper() == txtBirimAdi_edit.Text.ToUpper()))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('" + txtBirimAdi_edit.Text.ToUpper() + " Kayıtlarda Var.. Ekleme işlemi başarısız. !','fail');", true);

                }
                else
                {

                    edit_birim.AD_BIRIM = txtBirimAdi_edit.Text.ToUpper();
                    
                    if (db.SaveChanges()>0)
                    {
                        grdBIRIM.DataSource = db.BIRIM.ToList();
                        grdBIRIM.DataBind();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('" + lblBirimEditID.Text.ToUpper() + " kodlu birim güncellendi!','succsess');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Güncelleme işlemi başarısız. !','fail');", true);
                    }



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
                BIRIM deleteBirim = new BIRIM();


                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                txtBirimAdi_edit.Text = HttpUtility.HtmlDecode(row.Cells[2].Text.ToString());  // get the first cell value of the row
                                                                                               // if you want to get controls in templatefield , just use row.FindControl
                int deleteID = Convert.ToInt32(linkbutton.CommandArgument);
                deleteBirim = db.BIRIM.FirstOrDefault(i => i.ID_BIRIM == deleteID);

                db.BIRIM.Remove(deleteBirim);
                db.SaveChanges();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt başarı ile silindi!','succsess');", true);
                grdBIRIM.DataSource = db.BIRIM.ToList();
                grdBIRIM.DataBind();


            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }



        }

       
    }
}