using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class Personel2 : System.Web.UI.Page
    {

        DataBase db = new DataBase();


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsCallback && !Page.IsPostBack)
            {

                db.kayitListesi(gridPersonelListe);

            }
            


        }

        protected void btnVazgec_Click(object sender, EventArgs e)
        {
            
        }
    }
}