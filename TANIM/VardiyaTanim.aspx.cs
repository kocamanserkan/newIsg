using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class VardiyaTanim : System.Web.UI.Page
    {
        serkanISGEntities1 db = new serkanISGEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {
            grdVardiya.DataSource = db.VARDIYA.ToList();
            if (!IsPostBack && !IsCallback)
            {
                bind();

            }
        }
        private void bind()
        {
            try
            {

                txtbaslangicSaat.Text = DateTime.Now.ToString("HH:mm");
                txtBitisSaat.Text = DateTime.Now.AddHours(8.0).ToString("HH:mm");

                if (ddlAktiflik.SelectedValue == "Pasif")
                {
                    grdVardiya.DataSource = db.VARDIYA.Where(i => i.DURUM_VARDIYAa == "Pasif").ToList();
                    grdVardiya.DataBind();

                }
                else
                {

                    grdVardiya.DataSource = db.VARDIYA.Where(i => i.DURUM_VARDIYAa == "Aktif").ToList();
                    grdVardiya.DataBind();
                }

            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Hay Aksi!  Beklenmedik bir hata oluştu :(','fail');", true);
            }

        }
        protected void btnNewVardiya_Click(object sender, EventArgs e)
        {


            //ISTANIM1 IS = new ISTANIM1();
            VARDIYA newVardiya = new VARDIYA();



            string vardiyaBaslangic = txtbaslangicSaat.Text;
            string vardiyaBitis = txtBitisSaat.Text;


            //ISTANIM IS = new ISTANIM();

            string vardiyaFinal = vardiyaBaslangic + "/" + vardiyaBitis;
            newVardiya.AD_VARDIYA = vardiyaFinal;
            newVardiya.DURUM_VARDIYAa = "Aktif";

            if (db.VARDIYA.Any(i => i.AD_VARDIYA.ToUpper() == vardiyaFinal.ToUpper()))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('" + vardiyaFinal.ToUpper() + " Kayıtlarda Var.. Ekleme işlemi başarısız. !','fail');", true);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + txtISADI.Text.ToString().ToUpper() + " Kayıtlarda Var.. Ekleme işlemi başarısız.');", true);

            }
            else
            {

                db.VARDIYA.Add(newVardiya);


                db.SaveChanges();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt Eklendi!','succsess');", true);
                bind();

            }

        }

        protected void link_Click(object sender, EventArgs e)
        {



            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
            VARDIYA edt = new VARDIYA();
            int editId = Convert.ToInt32(linkbutton.CommandArgument);
            edt = db.VARDIYA.FirstOrDefault(i => i.ID_VARDIYA == editId);


            lblVardiyaKodu.Text = linkbutton.CommandArgument;


            //string vardiya = HttpUtility.HtmlDecode(row.Cells[2].Text.ToString());
            string vardiya = edt.AD_VARDIYA;

            string[] subs = vardiya.Split('/');
            string start = subs[0];
            string finish = subs[1];
            string[] second = start.Split(':');
            string startSaat = second[0];
            string startDak = second[1];

            string[] third = finish.Split(':');
            string finishSaat = third[0];
            string finishDak = third[1];


            txtBaslamaEdit.Text = subs[0];
            txtBitisEdit.Text = subs[1];
            ddlDurumEdit.Text = edt.DURUM_VARDIYAa;


            ScriptManager.RegisterStartupScript(this, GetType(), "script", "$('#myModal').modal()", true);//show the modal


        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            VARDIYA editVardiya = new VARDIYA();



            int editID = Convert.ToInt32(lblVardiyaKodu.Text);

            editVardiya = db.VARDIYA.FirstOrDefault(i => i.ID_VARDIYA == editID);

            editVardiya.AD_VARDIYA = txtBaslamaEdit.Text + "/" + txtBitisEdit.Text;
            editVardiya.DURUM_VARDIYAa = ddlDurumEdit.SelectedValue;


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


        protected void btn_sil_Click(object sender, EventArgs e)
        {
            try
            {  //KATEGORI deleteKategori = new KATEGORI();
                VARDIYA deleteVardiye = new VARDIYA();



                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                                                                           // get the first cell value of the row
                                                                           // if you want to get controls in templatefield , just use row.FindControl
                int deleteID = Convert.ToInt32(linkbutton.CommandArgument);

                deleteVardiye = db.VARDIYA.FirstOrDefault(i => i.ID_VARDIYA == deleteID);
                deleteVardiye.DURUM_VARDIYAa = "Pasif";


                if (db.SaveChanges() > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt silindi!','succsess')", true);

                    bind();

                    //Response.Write("<script>MyFunction('İş Tanımı Silindi..','succsess');window.location = 'ISTANIMLARI.aspx';</script>");


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
                VARDIYA deleteKategori = new VARDIYA();

                LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
                GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                                                                           // get the first cell value of the row
                                                                           // if you want to get controls in templatefield , just use row.FindControl
                int deleteID = Convert.ToInt32(linkbutton.CommandArgument);

                deleteKategori = db.VARDIYA.FirstOrDefault(i => i.ID_VARDIYA == deleteID);
                deleteKategori.DURUM_VARDIYAa = "Aktif";
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