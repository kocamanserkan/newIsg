using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace serkanISG
{
    public partial class Uygunsuzluk : System.Web.UI.Page
    {
        DataBase db = new DataBase();
        Kontrol kontrol = new Kontrol();
        string cs = "server=.;Initial Catalog=serkanISG;Integrated Security=SSPI";
        SqlConnection con;


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

            db.UygunsuzlukListele(grdUygunsuzlukListe);



            db.personelListesi(ddlSorumlu);
            db.personelListesi(ddlTespitEden);
            db.personelListesi(ddlSorumlua);
            db.personelListesi(ddlTespitedena);

            lblAd.Text = Request.Cookies["Kurabiye"]["full_ad"].ToString();



            if (!Page.IsPostBack && !Page.IsCallback)
            {

                //db.UygunsuzlukListele(grdUygunsuzlukListe);

                //db.personelListesi(ddlSorumlu);
                //db.personelListesi(ddlTespitEden);
                //db.personelListesi(ddlSorumlua);
                //db.personelListesi(ddlTespitedena);

                //lblAd.Text = Request.Cookies["Kurabiye"]["full_ad"].ToString();


            }

        }


        protected void grdUygunsuzlukListe_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {

            grdUygunsuzlukListe.EditIndex = e.NewEditIndex;
            db.UygunsuzlukListele(grdUygunsuzlukListe);

        }
        protected void grdUygunsuzlukListe_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {

            Label label_ID = grdUygunsuzlukListe.Rows[e.RowIndex].FindControl("label_ID") as Label;
            DropDownList aktif = grdUygunsuzlukListe.Rows[e.RowIndex].FindControl("ddldurum") as DropDownList;
            DropDownList tur = grdUygunsuzlukListe.Rows[e.RowIndex].FindControl("ddlTura") as DropDownList;
            TextBox uygunsuzDurum = grdUygunsuzlukListe.Rows[e.RowIndex].FindControl("txtUygnsuzDuruma") as TextBox;
            TextBox aksiyon = grdUygunsuzlukListe.Rows[e.RowIndex].FindControl("txtaksiyona") as TextBox;
            TextBox tespitTarih = grdUygunsuzlukListe.Rows[e.RowIndex].FindControl("dtpTespitTariha") as TextBox;
            TextBox terminTarih = grdUygunsuzlukListe.Rows[e.RowIndex].FindControl("dtpTerminTariha") as TextBox;
            DropDownList birim = grdUygunsuzlukListe.Rows[e.RowIndex].FindControl("ddlBirima") as DropDownList;
            DropDownList ddlSorumlua = grdUygunsuzlukListe.Rows[e.RowIndex].FindControl("txtSorumlua") as DropDownList;
            DropDownList ddlTespitedena = grdUygunsuzlukListe.Rows[e.RowIndex].FindControl("txtTespitedena") as DropDownList;

            con = new SqlConnection(cs);
            con.Open();

            SqlCommand cmd = new SqlCommand("Update UYGUNSUZLUK set AKTIFLIK='" + Convert.ToInt32(ddldurum.Text) + "',TUR='" + tur.Text + "',UYGUNSUZ_DURUM='" + uygunsuzDurum.Text + "',ONERI_AKSIYON='" + aksiyon.Text + "',TESPIT_TARIH='" + tespitTarih.Text + "',TERMIN_TARIH='" + terminTarih.Text + "',BIRIM='" + birim.Text + "',SORUMLU_AD='" + ddlSorumlua.Text + "',TESPIT_EDEN_AD='" + ddlTespitedena.Text + "' where ID_UYGUNSUZLUK=" + Convert.ToInt32(label_ID.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();


            db.UygunsuzlukListele(grdUygunsuzlukListe);

        }
        protected void grdUygunsuzlukListe_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {



            db.UygunsuzlukListele(grdUygunsuzlukListe);

        }

        protected void grdUygunsuzlukListe_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label ID = grdUygunsuzlukListe.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            con = new SqlConnection(cs);
            con.Open();

            SqlCommand cmd = new SqlCommand("Delete UYGUNSUZLUK where ID_UYGUNSUZLUK=" + Convert.ToInt32(ID.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();



            db.UygunsuzlukListele(grdUygunsuzlukListe);


        }

        protected void btnUygunsuzlukSave_Click(object sender, EventArgs e)
        {


            if (kontrol.uygunsuzlukFormKontrol(dtpTespitTarih, txtUygnsuzDurum, txtAksiyon, dateTerminTarihi, ddlSorumlu, ddlTespitEden))
            {

                if (ddlTespitEden.Text != ddlSorumlu.Text)
                {

                    string SORGU = " insert into UYGUNSUZLUK (BIRIM,TESPIT_TARIH,UYGUNSUZ_DURUM,ONERI_AKSIYON,SORUMLU_AD,TESPIT_EDEN_AD,TERMIN_TARIH,TUR) values ( '" + ddlBirim.Text + "','" + dtpTespitTarih.Text + "', '" + txtUygnsuzDurum.Text + "','" + (txtAksiyon.Text) + "','" + ddlSorumlu.Text + "','" + ddlTespitEden.Text + "','" + dateTerminTarihi.Text + "','" + ddlTur.Text + "')";

                    db.uygunsuzlukEkle(SORGU);


                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + " Uygunsuzluk kaydedilmiştir " + "');", true);

                    db.UygunsuzlukListele(grdUygunsuzlukListe);

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + " Tespit eden ile Sorumlu aynı kişi olamaz." + "');", true);

                }


            }
            else
            {



                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + " Formdaki gerekli yerleri doldurunuz." + "');", true);
            }





        }

        protected void grdUygunsuzlukListe_SelectedIndexChanged(object sender, EventArgs e)
        {


            label_ID.Text = grdUygunsuzlukListe.SelectedRow.Cells[1].Text;
            ddldurum.Text = grdUygunsuzlukListe.SelectedRow.Cells[2].Text;
            ddlTura.Text = grdUygunsuzlukListe.SelectedRow.Cells[3].Text;
            txtUygnsuzDuruma.Text = grdUygunsuzlukListe.SelectedRow.Cells[4].Text;
            txtaksiyona.Text = grdUygunsuzlukListe.SelectedRow.Cells[5].Text;
            dtpTespitTariha.Text = Convert.ToDateTime(grdUygunsuzlukListe.SelectedRow.Cells[6].Text).ToString("yyyy-MM-dd");
            dtpTerminTariha.Text = Convert.ToDateTime(grdUygunsuzlukListe.SelectedRow.Cells[7].Text).ToString("yyyy-MM-dd");
            ddlBirima.Text = grdUygunsuzlukListe.SelectedRow.Cells[8].Text;
            ddlSorumlua.Text = Convert.ToString(grdUygunsuzlukListe.SelectedRow.Cells[9].Text);
            ddlTespitedena.Text = Convert.ToString(grdUygunsuzlukListe.SelectedRow.Cells[10].Text);




        }

        protected void Guncelle_Click(object sender, EventArgs e)
        {

            con = new SqlConnection(cs);
            con.Open();

            SqlCommand cmd = new SqlCommand("Update UYGUNSUZLUK set AKTIFLIK='" + Convert.ToInt32(ddldurum.Text) + "',TUR='" + ddlTura.Text + "',UYGUNSUZ_DURUM='" + txtUygnsuzDuruma.Text + "',ONERI_AKSIYON='" + txtaksiyona.Text + "',TESPIT_TARIH='" + dtpTespitTariha.Text + "',TERMIN_TARIH='" + dtpTerminTariha.Text + "',BIRIM='" + ddlBirima.Text + "',SORUMLU_AD='" + ddlSorumlua.Text + "',TESPIT_EDEN_AD='" + ddlSorumlua.Text + "' where ID_UYGUNSUZLUK=" + Convert.ToInt32(label_ID.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();

            ClientScript.RegisterClientScriptBlock(this.GetType(), "myalert", "alert('" + " Uygunsuzluk Listesi Güncellenmiştir" + "'); return false;", true);
            db.UygunsuzlukListele(grdUygunsuzlukListe);

        }

        protected void Sil_Click(object sender, EventArgs e)
        {

            con = new SqlConnection(cs);
            con.Open();

            SqlCommand cmd = new SqlCommand("Delete UYGUNSUZLUK where ID_UYGUNSUZLUK=" + Convert.ToInt32(label_ID.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + " Uygunsuzluk Silinmiştir" + "');", true);

            db.UygunsuzlukListele(grdUygunsuzlukListe);

        }

    }
}