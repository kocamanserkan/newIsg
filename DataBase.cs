using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public class DataBase
    {


        public void personelEKle(string SORGU)
        {

            SqlConnection con = new SqlConnection("server =.; Initial Catalog =serkanISG; Integrated Security = SSPI");


            con.Open();

            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;

            cmd.CommandText = SORGU;

            cmd.ExecuteNonQuery();




            con.Close();

        }

        public void isListesi(DropDownList ddl)
        {



            SqlConnection baglanti;
            SqlCommand komut;
            SqlDataAdapter da;
            baglanti = new SqlConnection("server=.;Initial Catalog=serkanISG;Integrated Security=SSPI");

            baglanti.Open();

            da = new SqlDataAdapter("select * from ISTANIM ", baglanti);

            DataTable isimData = new DataTable();
            da.Fill(isimData);

            ddl.DataSource = isimData;
            ddl.DataTextField = "ISADI";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("---Seçiniz---", "-1"));


            baglanti.Close();

        }

        public void personelBilgi(Label txtKullanıcıADI, Label Full_AD, Label TCKN, Label isBaslangicTarih, Label YapilanIS  ,Label sicilNo, Label Email)
        {


            string CSs = "server=.;Initial Catalog=serkanISG;Integrated Security=SSPI";
            using (SqlConnection conn = new SqlConnection(CSs))
            {
                
                string sorgu = "select PERSONEL_Ad + ' ' + PERSONEL_SOYAD as ADSOYAD,TCKN, IS_BASLANGIC_TARIH,YAPTIGI_IS,SICIL_NO,EMAIL from PERSONEL where KULLANICI_ADI = '" + txtKullanıcıADI.Text + "'";
                    SqlCommand cmd = new SqlCommand(sorgu, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "PERSONEL");
                Full_AD.Text = ds.Tables["PERSONEL"].Rows[0]["ADSOYAD"].ToString();
                TCKN.Text = ds.Tables["PERSONEL"].Rows[0]["TCKN"].ToString();
                isBaslangicTarih.Text = ds.Tables["PERSONEL"].Rows[0]["IS_BASLANGIC_TARIH"].ToString();
                YapilanIS.Text = ds.Tables["PERSONEL"].Rows[0]["YAPTIGI_IS"].ToString();
                sicilNo.Text = ds.Tables["PERSONEL"].Rows[0]["SICIL_NO"].ToString();
                Email.Text = ds.Tables["PERSONEL"].Rows[0]["EMAIL"].ToString();
            }



        }
        
        public void kayitListesi(GridView gridKayitListesi)
        {


            SqlConnection baglanti;
            SqlCommand komut;
            SqlDataAdapter da;
            baglanti = new SqlConnection("server=.;Initial Catalog=serkanISG;Integrated Security=SSPI");

            baglanti.Open();

            da = new SqlDataAdapter("select PERSONEL_ID as ID, PERSONEL_ad as Ad, PERSONEL_Soyad as Soyad, KULLANICI_ADI as 'Kullanıcı Adı', SIFRE as 'Şifre', EMAIL as 'E-mail'  from PERSONEL", baglanti);

            DataTable kayitData = new DataTable();
            da.Fill(kayitData);

            gridKayitListesi.DataSource = kayitData;
            gridKayitListesi.DataBind();
            baglanti.Close();

            //, YAPTIGI_IS as 'Yaptığı İş',EMAIL as'E-mail'


        }
        public void personelListesi(DropDownList ddl)
        {



            SqlConnection baglanti;
            SqlCommand komut;
            SqlDataAdapter da;
            baglanti = new SqlConnection("server=.;Initial Catalog=serkanISG;Integrated Security=SSPI");

            baglanti.Open();

            da = new SqlDataAdapter("select PERSONEL_AD+' '+PERSONEL_SOYAD as AD from Personel ", baglanti);

            DataTable isimData = new DataTable();
            da.Fill(isimData);

            ddl.DataSource = isimData;
            ddl.DataTextField = "AD";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("---Seçiniz---", "-1"));


            baglanti.Close();

        }
        public void uygunsuzlukEkle(string SORGU)
        {

            SqlConnection con = new SqlConnection("server =.; Initial Catalog =serkanISG; Integrated Security = SSPI");


            con.Open();

            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;

            cmd.CommandText = SORGU;

            cmd.ExecuteNonQuery();


        }
        public TextBox fullAd(TextBox txtKullanıcıADI)
        {


            string CSs = "server=.;Initial Catalog=serkanISG;Integrated Security=SSPI";
            using (SqlConnection conn = new SqlConnection(CSs))
            {

                string sorgu = "select PERSONEL_AD + ' ' + PERSONEL_SOYAD as ADSOYAD From Personel where KULLANICI_ADI = '" + txtKullanıcıADI.Text + "'";
                SqlCommand cmd = new SqlCommand(sorgu, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "PERSONEL");
                txtKullanıcıADI.Text = ds.Tables["PERSONEL"].Rows[0]["ADSOYAD"].ToString();
               
            }

            return txtKullanıcıADI;

        }
        public void UygunsuzlukListele(GridView grid)
        {


            SqlConnection baglanti;
            SqlCommand komut;
            SqlDataAdapter da;
            baglanti = new SqlConnection("server=.;Initial Catalog=serkanISG;Integrated Security=SSPI");

            baglanti.Open();

            da = new SqlDataAdapter("select ID_UYGUNSUZLUK as ID, AKTIFLIK as 'Durum', TUR as 'Uygunsuzluk Türü', UYGUNSUZ_DURUM as 'Uygunsuz Durum', ONERI_AKSIYON as 'Öneri Aksiyon',TESPIT_TARIH as 'Tespit Tarihi',TERMIN_TARIH as 'Termin Tarihi' ,BIRIM as 'Birim', SORUMLU_AD as 'Sorumlu', TESPIT_EDEN_AD as 'Tespit Eden' from UYGUNSUZLUK", baglanti);

            DataTable kayitData  = new DataTable();
            da.Fill(kayitData);

            for (int rowIndex = 0; rowIndex < kayitData.Rows.Count; rowIndex++)
            {   

                if(kayitData.Rows[rowIndex][1].ToString() == "0")
                {
                    kayitData.Rows[rowIndex][1] = "Pasif";
                }
                else
                {
                    kayitData.Rows[rowIndex][1] = "Aktif";

                }   
               
                
            }



            grid.DataSource = kayitData;
            grid.DataBind();
            baglanti.Close();







        }








    }
}