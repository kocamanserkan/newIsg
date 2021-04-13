using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class LOKASYON : System.Web.UI.Page
    {

        serkanISGEntities1 db = new serkanISGEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            grdLOKASYON.DataSource = db.LOKASYONN.ToList();
            ddlSehir.DataSource = db.ILLER.Select(i => i.name.ToUpper()).ToList();
            ddlSehir_Edit.DataSource = db.ILLER.Select(i => i.name.ToUpper()).ToList();
            
            if (!IsPostBack)
            {
                grdLOKASYON.DataBind();
                ddlSehir.DataBind();
                ddlSehir_Edit.DataBind();

            }


        }

        protected void btnLokasyonSave_Click(object sender, EventArgs e)
        {



           
            LOKASYONN newLocation = new LOKASYONN();
            newLocation.AD_LOKASYON = txtLOKASYON_AD.Text;
            newLocation.ACIKLAMA_LOKASYON = txtAciklama.Text;
            newLocation.SEHIR_LOKASYON = ddlSehir.Text;
            newLocation.KROKI_LOKASYON = imgKroki.FileName.ToString();

            db.LOKASYONN.Add(newLocation);

            db.SaveChanges();
            grdLOKASYON.DataBind();

            imgKroki.PostedFile.SaveAs(Server.MapPath("~/upload/") + imgKroki.FileName.ToString());

            Response.Write("<script>alert('Lokasyon Eklenmiştir..');window.location = 'LOKASYON.aspx';</script>");

        }


        protected void link_Click(object sender, EventArgs e)
        {
            LOKASYONN edit = new LOKASYONN();

            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
            int deleteID = Convert.ToInt32(linkbutton.CommandArgument);
            edit = db.LOKASYONN.FirstOrDefault(i => i.ID_LOKASYON == deleteID);
            txtEditID.Text = HttpUtility.HtmlDecode(row.Cells[1].Text.ToString());
            txtLokasyonAd_Edit.Text = HttpUtility.HtmlDecode(row.Cells[2].Text.ToString());  // get the first cell value of the row
            ddlSehir_Edit.Text = HttpUtility.HtmlDecode(row.Cells[3].Text.ToString());
            txt_Aciklama_Edit.Text = HttpUtility.HtmlDecode(row.Cells[4].Text.ToString());
            ass.ImageUrl = "~/Upload/" + edit.KROKI_LOKASYON.ToString();

            ScriptManager.RegisterStartupScript(this, GetType(), "serkan", "$('#myModal').modal()", true);//show the modal






        }

        protected void edit_Kaydet_Click(object sender, EventArgs e)
        {
            LOKASYONN edit_loca = new LOKASYONN();
            int locaId = Convert.ToInt32(txtEditID.Text);
            edit_loca = db.LOKASYONN.FirstOrDefault(i => i.ID_LOKASYON == locaId);

            if (db.LOKASYONN.FirstOrDefault(i => i.AD_LOKASYON.ToUpper() == txtLokasyonAd_Edit.Text.ToUpper()) != null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('İş Tanım güncellemesi yapılamamıştır. Güncellenen iş tanımı hali hazırda mevcut!');", true);
            }
            else
            {

                edit_loca.AD_LOKASYON = txtLokasyonAd_Edit.Text;
                edit_loca.ACIKLAMA_LOKASYON = txt_Aciklama_Edit.Text;
                edit_loca.SEHIR_LOKASYON = ddlSehir_Edit.Text;
                edit_loca.KROKI_LOKASYON = imgEdit.FileName.ToString();

            }

            if (db.SaveChanges() > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Güncelleme Gerçekleşmiştir!');", true);
                grdLOKASYON.DataBind();

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Hata!! Güncelleme sırasında hata oluştu!');", true);
                grdLOKASYON.DataBind();

            }




        }

        protected void btn_sil_Click(object sender, EventArgs e)
        {
            LOKASYONN deleteLoca = new LOKASYONN();

            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                                                                       // get the first cell value of the row
                                                                       // if you want to get controls in templatefield , just use row.FindControl
            int deleteID = Convert.ToInt32(linkbutton.CommandArgument);

            deleteLoca = db.LOKASYONN.FirstOrDefault(i => i.ID_LOKASYON == deleteID);
            db.LOKASYONN.Remove(deleteLoca);

            if (db.SaveChanges() > 0)
            {
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Lokasyon Silinmiştir');", true);
                grdLOKASYON.DataBind();


                Response.Write("<script>alert('Lokasyon Silindi');window.location = 'LOKASYON.aspx';</script>");


            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('iş Tanımı silme işlemi sırasında Hata oluştu');", true);
                grdLOKASYON.DataBind();
            }




         




        }

    }
}