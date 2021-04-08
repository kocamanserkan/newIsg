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
            grdBIRIM.DataBind();


        }
       
        protected void btnEKLE_Click(object sender, EventArgs e)
        {
            BIRIM newBirim = new BIRIM();

            //if(db.BIRIM.First(i=>i.AD_BIRIM.ToUpper == txtBirimAd.Text.ToUpper))


            newBirim.AD_BIRIM = txtBirimAd.Text.ToUpper(); ;



           
            



        }
        protected void btn_edit_link_Click(object sender, EventArgs e)
        {
            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
            txtBirimAd.Text = HttpUtility.HtmlDecode(row.Cells[2].Text.ToString());  // get the first cell value of the row
                                                                                     // if you want to get controls in templatefield , just use row.FindControl
            lblBirimEditID.Text = linkbutton.CommandArgument;
            ScriptManager.RegisterStartupScript(this, GetType(), "serkan", "$('#myModal').modal()", true);//show the modal


        }

        protected void edit_Kaydet_Click(object sender, EventArgs e)
        {

        }

        protected void btn_sil_Click(object sender, EventArgs e)
        {

        }

       
    }
}