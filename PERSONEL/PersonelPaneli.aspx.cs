using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class PersonelPaneli : System.Web.UI.Page
    {
      
        DataBase db = new DataBase();

    
        [Authorize]
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblAD.Text = Session["FullName"].ToString();
            }
            catch (Exception)
            {

                Response.Redirect("~/giris.aspx");
            }

           
        }



    }

}