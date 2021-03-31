using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace serkanISG
{
    public class Kontrol
    {

        public bool Giris(TextBox txtUSERNAME, TextBox txtPAROLA)
        {


            using (SqlConnection con = new SqlConnection("server =.; Initial Catalog = serkanISG; Integrated Security = SSPI"))
            {
                SqlCommand cmd = new SqlCommand("select * from PERSONEL where KULLANICI_ADI = @KULLANICI_ADI and SIFRE = @SIFRE;");
                cmd.Parameters.AddWithValue("@KULLANICI_ADI", txtUSERNAME.Text);
                cmd.Parameters.AddWithValue("@SIFRE", txtPAROLA.Text);
                cmd.Connection = con;
                con.Open();

                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();

                bool girisbasarili = ((ds.Tables.Count > 0) && (ds.Tables[0].Rows.Count > 0));


                return girisbasarili;
            }



        }



         public bool formKontrol(TextBox txtKuLLANICI_ADI, TextBox txtPAROLA, TextBox txtISIM, TextBox txtEMAIL, TextBox txtSOYISIM, TextBox txtPAROLA_KONTROL, TextBox txtTCKN, TextBox txtSICILNO, DropDownList dwlIS)
        {
           bool Kontrol = false;

            if (!string.IsNullOrEmpty(txtKuLLANICI_ADI.Text) && !string.IsNullOrEmpty(txtPAROLA.Text) && !string.IsNullOrEmpty(txtISIM.Text) && !string.IsNullOrEmpty(txtEMAIL.Text) && !string.IsNullOrEmpty(txtSOYISIM.Text) && !string.IsNullOrEmpty(txtPAROLA_KONTROL.Text) && !string.IsNullOrEmpty(txtTCKN.Text) && !string.IsNullOrEmpty(txtSICILNO.Text) && !string.IsNullOrEmpty(txtTCKN.Text) && !string.IsNullOrEmpty(dwlIS.Text))
            {
                Kontrol = true;
            }
            else
            {
                Kontrol = false;

            }

            return Kontrol;

        }

        public bool KULLANICI_AD_Kontrol(TextBox txtKULLANICI_ADI)
        {

            using (SqlConnection con = new SqlConnection("server =.; Initial Catalog = serkanISG; Integrated Security = SSPI"))
            {
                SqlCommand cmd = new SqlCommand("select KULLANICI_ADI from PERSONEL where KULLANICI_ADI = @username;");
                cmd.Parameters.AddWithValue("@username", txtKULLANICI_ADI.Text);

                cmd.Connection = con;
                con.Open();

                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();

                bool kulllanıcıAdıAvaible = ((ds.Tables.Count > 0) && (ds.Tables[0].Rows.Count > 0));


                return kulllanıcıAdıAvaible;

            }


        }


        public bool uygunsuzlukFormKontrol(TextBox dtpTespitTarih,TextBox txtUygnsuzDurum, TextBox txtAksiyon, TextBox dateTerminTarihi, DropDownList ddlSorumlu, DropDownList ddlTespitEden)
        {
            bool kontrol = false;


            if (!string.IsNullOrEmpty(txtUygnsuzDurum.Text) && !string.IsNullOrEmpty(txtAksiyon.Text) && dtpTespitTarih != null &&  dateTerminTarihi !=null)
            {
                kontrol = true;
                
            }
            else
            {
                kontrol = false;

            }

            return kontrol;


        }






    }
}