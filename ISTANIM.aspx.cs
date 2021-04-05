using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class ISTANIM1 : System.Web.UI.Page
    {
        serkanISGEntities1 db = new serkanISGEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {
            grdISTANIM.DataSource = db.ISTANIM.ToList();
            if (!IsPostBack)
            {
                grdISTANIM.DataBind();
            }
            ClientScript.RegisterClientScriptBlock(this.GetType(), "myalert", "alert('" + " Uygunsuzluk Listesi Güncellenmiştir" + "'); return false;", true);




        }

        protected void btn_Click(object sender, EventArgs e)
        {
            ISTANIM IS = new ISTANIM();
            IS.ISADI = txtISADI.Text.ToUpper();
            if (db.ISTANIM.Any(i => i.ISADI == txtISADI.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + txtISADI.Text.ToUpper() + " Kayıtlarda Var');", true);
                txtISADI.Text = string.Empty;
            }
            else
            {
                db.ISTANIM.Add(IS);

                db.SaveChanges();
                grdISTANIM.DataSource = db.ISTANIM.ToList();
                grdISTANIM.DataBind();

                //this.Response.Redirect("~/ISTANIM.aspx");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + txtISADI.Text + " Eklenmiştir');", true);
                txtISADI.Text = string.Empty;
              
            }





        }
    }
}