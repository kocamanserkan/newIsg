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
            grdKATEGORI.DataSource = db.KATEGORI.Where(i => i.DURUM == true).ToList();
            if (!IsPostBack)
            {
               
                grdKATEGORI.DataBind();

            }




        }

        protected void btnNewKategori_Click(object sender, EventArgs e)
        {
            //ISTANIM1 IS = new ISTANIM1();
            KATEGORI newKategori = new KATEGORI();


            //ISTANIM IS = new ISTANIM();
            newKategori.AD_KATEGORI = txtKategoriAdi.Text.ToUpper();
            newKategori.DURUM = true;
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
                grdKATEGORI.DataSource = db.KATEGORI.Where(i => i.DURUM == true).ToList();
                grdKATEGORI.DataBind();


                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt Eklendi!','succsess');", true);

                txtKategoriAdi.Text = string.Empty;

            }





        }

        protected void link_Click(object sender, EventArgs e)
        {

            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
            txtKategoriAd_edit.Text = HttpUtility.HtmlDecode(row.Cells[2].Text.ToString());  // get the first cell value of the row
                                                                                             // if you want to get controls in templatefield , just use row.FindControl
            lbl_KategoriEdit.Text = linkbutton.CommandArgument;
            ScriptManager.RegisterStartupScript(this, GetType(), "serkan", "$('#myModal').modal()", true);//show the modal


        }

        protected void edit_Kaydet_Click(object sender, EventArgs e)
        {

            KATEGORI editKategori = new KATEGORI();
            int editID = Convert.ToInt32(lbl_KategoriEdit.Text);

            editKategori = db.KATEGORI.FirstOrDefault(i => i.ID_KATEGORI == editID);




            if (db.KATEGORI.FirstOrDefault(i => i.AD_KATEGORI.ToUpper() == txtKategoriAd_edit.Text.ToUpper()) != null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kategori Tanım güncellemesi yapılamamıştır. Güncellenen iş tanımı hali hazırda mevcut! >>>" + editKategori.AD_KATEGORI + " ','fail');", true);
            }
            else
            {

                editKategori.AD_KATEGORI = txtKategoriAd_edit.Text;


                if (db.SaveChanges() > 0)
                {
                    grdKATEGORI.DataSource = db.KATEGORI.Where(i => i.DURUM == true).ToList();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt başarıyle güncellendi!','succsess');", true);
                    grdKATEGORI.DataBind();
                }
                else
                {
                    grdKATEGORI.DataSource = db.KATEGORI.Where(i => i.DURUM == true).ToList();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Güncelleme sırasında hata oluştu!','fail');", true);
                    grdKATEGORI.DataBind();
                }




            }
        }
        protected void btn_sil_Click(object sender, EventArgs e)
        {
            KATEGORI deleteKategori = new KATEGORI();

            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                                                                       // get the first cell value of the row
                                                                       // if you want to get controls in templatefield , just use row.FindControl
            int deleteID = Convert.ToInt32(linkbutton.CommandArgument);

            deleteKategori = db.KATEGORI.FirstOrDefault(i => i.ID_KATEGORI == deleteID);

            deleteKategori.DURUM = false;


            if (db.SaveChanges() > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt sss silindi!','succsess');window.location = 'KategoriTanim.aspx';", true);
                grdKATEGORI.DataSource = db.KATEGORI.Where(i => i.DURUM == true).ToList();
                grdKATEGORI.DataBind();


                //Response.Write("<script>MyFunction('İş Tanımı Silindi..','succsess');window.location = 'ISTANIMLARI.aspx';</script>");


            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Myfunction('iş Tanımı silme işlemi sırasında Hata oluştu','fail');", true);
                grdKATEGORI.DataSource = db.KATEGORI.Where(i => i.DURUM == true).ToList();
                grdKATEGORI.DataBind();
            }




        }

    }
}