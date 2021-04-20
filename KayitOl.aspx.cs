using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class KayitOl : System.Web.UI.Page
    {
        serkanISGEntities1 db2 = new serkanISGEntities1();
        DataBase db = new DataBase();
        Kontrol cntrl = new Kontrol();
        ISTANIM c = new ISTANIM();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsCallback && !IsPostBack)
          ddlIS.DataSource =  db2.TANIMIS.Select(i => i.AD_IS).ToList();
            ddlIS.DataBind();
        }
    }
}