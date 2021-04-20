using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace serkanISG
{
    public partial class KategoriTanim : System.Web.UI.Page
    {
        serkanISGEntities1 db = new serkanISGEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack && !IsCallback)
            {

                bind();


            }




        }

        private void bind()
        {
            try
            {
                if (ddlAktiflik.SelectedValue == "Pasif")
                {
                    grdKATEGORI.DataSource = db.KATEGORI.Where(i => i.DURUM == "Pasif").ToList();
                    grdKATEGORI.DataBind();

                }
                else
                {

                    grdKATEGORI.DataSource = db.KATEGORI.Where(i => i.DURUM == "Aktif").ToList();
                    grdKATEGORI.DataBind();
                }
            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }

          



        }



        protected void btnNewKategori_Click(object sender, EventArgs e)
        {
            try
            {
                KATEGORI newKategori = new KATEGORI();


                //ISTANIM IS = new ISTANIM();
                newKategori.AD_KATEGORI = txtKategoriAdi.Text.ToUpper();
                newKategori.DURUM = "Aktif";
                if (db.KATEGORI.Any(i => i.AD_KATEGORI == txtKategoriAdi.Text))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('" + txtKategoriAdi.Text.ToString().ToUpper() + " Kayıtlarda Var.. Ekleme işlemi başarısız. !','fail');", true);
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + txtISADI.Text.ToString().ToUpper() + " Kayıtlarda Var.. Ekleme işlemi başarısız.');", true);
                    txtKategoriAdi.Text = string.Empty;
                }
                else
                {

                    db.KATEGORI.Add(newKategori);


                    db.SaveChanges();
                    bind();


                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt Eklendi!','succsess');", true);

                    txtKategoriAdi.Text = string.Empty;

                }

            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }
            //ISTANIM1 IS = new ISTANIM1();
            




        }

        protected void link_Click(object sender, EventArgs e)
        {
            try
            {
                KATEGORI link = new KATEGORI();
                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer;
                int linkID = Convert.ToInt32(linkbutton.CommandArgument);
                // get the GridViewRow that contains the linkbutton
                link = db.KATEGORI.FirstOrDefault(i => i.ID_KATEGORI == linkID);
                txtKategoriAd_edit.Text = link.AD_KATEGORI;
                ddlDurumEdit.Text = link.DURUM;
                lbl_KategoriEdit.Text = Convert.ToString(linkID);

                /* txtKategoriAd_edit.Text = HttpUtility.HtmlDecode(row.Cells[2].Text.ToString()); */ // get the first cell value of the row
                                                                                                      // if you want to get controls in templatefield , just use row.FindControl

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
                KATEGORI editKategori = new KATEGORI();
                int editID = Convert.ToInt32(lbl_KategoriEdit.Text);

                editKategori = db.KATEGORI.FirstOrDefault(i => i.ID_KATEGORI == editID);


                editKategori.AD_KATEGORI = txtKategoriAd_edit.Text;
                editKategori.DURUM = ddlDurumEdit.SelectedValue;

                if (db.SaveChanges() > 0)
                {
                    bind();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt başarıyle güncellendi!','succsess');", true);

                }
                else
                {
                    bind();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Güncelleme sırasında hata oluştu!','fail');", true);

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
                KATEGORI deleteKategori = new KATEGORI();

                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                                                                           // get the first cell value of the row
                                                                           // if you want to get controls in templatefield , just use row.FindControl
                int deleteID = Convert.ToInt32(linkbutton.CommandArgument);

                deleteKategori = db.KATEGORI.FirstOrDefault(i => i.ID_KATEGORI == deleteID);

                deleteKategori.DURUM = "Pasif";


                if (db.SaveChanges() > 0)
                {


                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt silindi!','succsess');", true);

                    bind();




                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Myfunction('iş Tanımı silme işlemi sırasında Hata oluştu','fail');", true);
                    bind();
                }



            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }
            


        }

        protected void ddlAktiflik_SelectedIndexChanged(object sender, EventArgs e)
        {
            bind();
        }

        protected void reload_Click(object sender, EventArgs e)
        {
            try
            {
                KATEGORI deleteKategori = new KATEGORI();

                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                                                                           // get the first cell value of the row
                                                                           // if you want to get controls in templatefield , just use row.FindControl
                int deleteID = Convert.ToInt32(linkbutton.CommandArgument);

                deleteKategori = db.KATEGORI.FirstOrDefault(i => i.ID_KATEGORI == deleteID);
                deleteKategori.DURUM = "Aktif";
                db.SaveChanges();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt aktife alındı!','succsess');", true);
                bind();

            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }

        }
    }
}