using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public partial class PersonelListesi : System.Web.UI.Page
    {
        string cs = "server=.;Initial Catalog=serkanISG;Integrated Security=SSPI";
        SqlConnection con;

        DataBase db = new DataBase();


        protected void Page_Load(object sender, EventArgs e)
        {
            lblAd.Text = Request.Cookies["Kurabiye"]["full_ad"].ToString();

            //if (!string.IsNullOrEmpty(Request.Cookies["Username"].Value.ToString()))
            //{
                
            //    lblAd.Text = Request.Cookies["Username"].Value.ToString();
            //}
            //else
            //{
            //    Response.Redirect("login.aspx");

            //}


            if (!Page.IsCallback && !Page.IsPostBack)
            {



                    db.kayitListesi(grdPersonelListesi);
                
               
            }
        }
        protected void grdPersonelListesi_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            
            grdPersonelListesi.EditIndex = e.NewEditIndex;
            db.kayitListesi(grdPersonelListesi);

        }
        protected void grdPersonelListesi_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            
            Label id = grdPersonelListesi.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox ad = grdPersonelListesi.Rows[e.RowIndex].FindControl("txt_ad") as TextBox;
            TextBox soyad = grdPersonelListesi.Rows[e.RowIndex].FindControl("txt_Soyad") as TextBox;
            TextBox kullaniciAd = grdPersonelListesi.Rows[e.RowIndex].FindControl("txt_username") as TextBox;
            TextBox parola = grdPersonelListesi.Rows[e.RowIndex].FindControl("txt_sifre") as TextBox;
            TextBox email = grdPersonelListesi.Rows[e.RowIndex].FindControl("txt_email") as TextBox;
            
            con = new SqlConnection(cs);
            con.Open();
          
            SqlCommand cmd = new SqlCommand("Update Personel set PERSONEL_ad='" + ad.Text + "',PERSONEL_Soyad='" + soyad.Text + "',KULLANICI_ADI='" + kullaniciAd.Text + "',SIFRE='" + parola.Text + "',EMAIL='" + email.Text + "' where PERSONEL_ID=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
           
            grdPersonelListesi.EditIndex = -1;
         
            db.kayitListesi(grdPersonelListesi);

        }
        protected void grdPersonelListesi_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            
            grdPersonelListesi.EditIndex = -1;
            db.kayitListesi(grdPersonelListesi);

        }

        protected void grdPersonelListesi_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = grdPersonelListesi.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            con = new SqlConnection(cs);
            con.Open();
           
            SqlCommand cmd = new SqlCommand("Delete Personel where PERSONEL_ID=" + Convert.ToInt32(id.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();

            grdPersonelListesi.EditIndex = -1;

            db.kayitListesi(grdPersonelListesi);


        }
    }
}