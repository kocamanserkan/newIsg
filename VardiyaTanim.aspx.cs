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
            if (!IsPostBack)
            {

                grdVardiya.DataBind();

            }
        }
        protected void btnNewVardiya_Click(object sender, EventArgs e)
        {


            //ISTANIM1 IS = new ISTANIM1();
            VARDIYA newVardiya = new VARDIYA();



            string vardiyaBaslangic = txtbaslangicSaat.Text;
            string vardiyaBitis = txtBitisSaat.Text;


            //ISTANIM IS = new ISTANIM();
           
              string vardiyaFinal  = vardiyaBaslangic +"/"+ vardiyaBitis;
            newVardiya.AD_VARDIYA = vardiyaFinal;

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
                grdVardiya.DataSource = db.VARDIYA.ToList();
                grdVardiya.DataBind();


            }

        }

        protected void link_Click(object sender, EventArgs e)
        {
           
          
           
            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
            lblVardiyaKodu.Text = linkbutton.CommandArgument;


            string vardiya = HttpUtility.HtmlDecode(row.Cells[2].Text.ToString());

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



            //ddlBasSaat_Edit.SelectedValue = startSaat;
            //ddlBasDak_Edit.Text = startDak;
            //ddlBitSaat_Edit.Text = finishSaat;
            //ddlBitDak_Edit.Text = finishDak;


            //txtKategoriAd_edit.Text = HttpUtility.HtmlDecode(row.Cells[2].Text.ToString());  // get the first cell value of the row
            //                                                                                 // if you want to get controls in templatefield , just use row.FindControl
            //lbl_KategoriEdit.Text = linkbutton.CommandArgument;
            ScriptManager.RegisterStartupScript(this, GetType(), "script", "$('#myModal').modal()", true);//show the modal


        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            VARDIYA editVardiya = new VARDIYA();



            int editID = Convert.ToInt32(lblVardiyaKodu.Text);

            editVardiya = db.VARDIYA.FirstOrDefault(i => i.ID_VARDIYA == editID);




            if (db.VARDIYA.FirstOrDefault(i => i.AD_VARDIYA.ToUpper() == txtBaslamaEdit.Text.ToUpper()) != null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Vardiya Tanım güncellemesi yapılamamıştır. Güncellenen vardiya tanımı hali hazırda mevcut! >>> ','fail');", true);
            }
            else
            {

                editVardiya.AD_VARDIYA = txtBaslamaEdit.Text + "/" + txtBitisEdit.Text;
                


                if (db.SaveChanges() > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt başarıyle güncellendi!','succsess');", true);
                    grdVardiya.DataBind();
                }
                else
                {
                   
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Güncelleme sırasında hata oluştu!','fail');", true);
                    grdVardiya.DataBind();
                }

            }

        }


        protected void btn_sil_Click(object sender, EventArgs e)
        {
            //KATEGORI deleteKategori = new KATEGORI();
            VARDIYA deleteVardiye = new VARDIYA();

            

            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
                                                                       // get the first cell value of the row
                                                                       // if you want to get controls in templatefield , just use row.FindControl
            int deleteID = Convert.ToInt32(linkbutton.CommandArgument);

            deleteVardiye = db.VARDIYA.FirstOrDefault(i => i.ID_VARDIYA == deleteID);

            db.VARDIYA.Remove(deleteVardiye);


            if (db.SaveChanges() > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt silindi!','succsess');window.location = 'VardiyaTanim.aspx';", true);
          
                grdVardiya.DataBind();


                //Response.Write("<script>MyFunction('İş Tanımı Silindi..','succsess');window.location = 'ISTANIMLARI.aspx';</script>");


            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Myfunction('iş Tanımı silme işlemi sırasında Hata oluştu','fail');", true);
             
                grdVardiya.DataBind();
               
            }




        }


    }
}