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
            grdISTANIM.DataSource = db.TANIMIS.ToList();
            if (!IsPostBack)
            {
                grdISTANIM.DataBind();
            }




        }

        protected void btn_Click(object sender, EventArgs e)
        {
            //ISTANIM1 IS = new ISTANIM1();
            TANIMIS IS = new TANIMIS();
           
            ISTANIM a = new ISTANIM();

            //ISTANIM IS = new ISTANIM();
            IS.AD_IS = txtISADI.Text.ToUpper();
            if (db.TANIMIS.Any(i => i.AD_IS == txtISADI.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('"+ txtISADI.Text.ToString().ToUpper() + " Kayıtlarda Var.. Ekleme işlemi başarısız. !','fail');", true);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + txtISADI.Text.ToString().ToUpper() + " Kayıtlarda Var.. Ekleme işlemi başarısız.');", true);
                txtISADI.Text = string.Empty;
            }
            else
            {
                
                 db.TANIMIS.Add(IS);


                db.SaveChanges();
                grdISTANIM.DataSource = db.TANIMIS.ToList();
                grdISTANIM.DataBind();


                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt Eklendi!','succsess');", true);

                txtISADI.Text = string.Empty;

            }





        }

        protected void link_Click(object sender, EventArgs e)
        {

            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
            txtIsAdi_edit.Text = HttpUtility.HtmlDecode(row.Cells[2].Text.ToString());  // get the first cell value of the row
                                                                                        // if you want to get controls in templatefield , just use row.FindControl
            lblISid_edit.Text = linkbutton.CommandArgument;
            ScriptManager.RegisterStartupScript(this, GetType(), "serkan", "$('#myModal').modal()", true);//show the modal


        }

        protected void edit_Kaydet_Click(object sender, EventArgs e)
        {

            //ISTANIM editIS = new ISTANIM();
            TANIMIS editIS = new TANIMIS();
            int newID = Convert.ToInt32(lblISid_edit.Text);


            editIS = db.TANIMIS.FirstOrDefault(i => i.ID_IS == newID);

            if (db.ISTANIM.FirstOrDefault(i => i.ISADI.ToUpper() == txtIsAdi_edit.Text.ToUpper()) != null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('İş Tanım güncellemesi yapılamamıştır. Güncellenen iş tanımı hali hazırda mevcut!','fail');", true);
            }
            else
            {

                editIS.AD_IS = txtIsAdi_edit.Text;


                if (db.SaveChanges() > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt başarıyle güncellendi!','succsess');", true);
                    grdISTANIM.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Güncelleme sırasında hata oluştu!','fail');", true);
                    grdISTANIM.DataBind();
                }


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

            db.TANIMIS.Remove(deleteIS);

            if (db.SaveChanges() > 0)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('Kayıt sss silindi!','succsess');", true);
                grdISTANIM.DataSource = db.TANIMIS.ToList();
                grdISTANIM.DataBind();


                //Response.Write("<script>MyFunction('İş Tanımı Silindi..','succsess');window.location = 'ISTANIMLARI.aspx';</script>");


            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Myfunction('iş Tanımı silme işlemi sırasında Hata oluştu','fail');", true);
                grdISTANIM.DataBind();
            }




        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "myFunction('serkan','succsess');", true);
        }
    }
}