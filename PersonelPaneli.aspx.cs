using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class PersonelPaneli : System.Web.UI.Page
    {



      
        DataBase db = new DataBase();

        //protected void Page_Init(object sender, EventArgs e)
        //{
        //    if(Request.UrlReferrer == null)
        //    {
        //        Response.Redirect("/login.aspx");


        //    }

        //    else if (!Request.UrlReferrer.ToString().ToLower().Contains("")
        //    {


        //    }

        //}      


        protected void Page_Load(object sender, EventArgs e)
        {

          
            lblAD.Text = Request.Cookies["Kurabiye"]["full_ad"].ToString();
        }



        //if (!IsPostBack)
        //{
        //    db.personelBilgi(txtUsername, txtAD, txtTCKN, isTarih, txtIS, sicilNO, txtEMAIL);
        //}


        //if (!Page.IsCallback && !Page.IsPostBack)
        //{
        //    db.kayitListesi(gridView);
        //   db.personelListesi(ddlSorumlu);
        //    db.personelListesi(ddlTespitEden);
        //    ddlTespitEden.Text = txtAD.Text;


        //}


    

        //protected void UploadFile(object sender, EventArgs e)
        //{
        //    string folderPath = Server.MapPath("~/Files/");

        //    //Check whether Directory (Folder) exists.
        //    if (!Directory.Exists(folderPath))
        //    {
        //        //If Directory (Folder) does not exists Create it.
        //        Directory.CreateDirectory(folderPath);
        //    }


        //    //Save the File to the Directory (Folder).
        //    FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

        //    //Display the Picture in Image control.
        //    Image1.ImageUrl = "~/Files/" + Path.GetFileName(FileUpload1.FileName);

        //}

        //protected void btnUygunsuzlukKaydet_Click(object sender, EventArgs e)
        //{


        //    string SORGU = " insert into UYGUNSUZLUK (BIRIM,TESPIT_TARIHI,UYGUNSUZ_DURUM,ONERI_AKSIYON,SORUMLU_AD,TESPIT_EDEN_AD,TERMIN_TARIH,TUR) values ( '" + ddlBirim.Text + "','" + dateTespitTarih.Text + "', '" + txtUygnsuzDurum.Text + "','" + (txtAksiyon.Text) + "','" + ddlSorumlu.Text + "','" + ddlTespitEden.Text + "','" + dateTerminTarihi.Text + "','" + ddlTur.Text + "')";

        //    db.uygunsuzlukEkle(SORGU);
        //    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + " Uygunsuzluk kaydedilmiştir " + "');", true);
        //}
    }

}