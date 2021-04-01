using serkanISG.MyFilter;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace serkanISG
{
    //[MyError]
    [MyAction]
    public class UygunsuzlukController : ApiController
    {
        serkanISGEntities1 db = new serkanISGEntities1();

        // GET api/<controller>
        public HttpResponseMessage Get(string durum = "all", int? top = 0)
        {

           
            IQueryable<UYGUNSUZLUK> query = db.UYGUNSUZLUK;
            durum = durum.ToLower();
            switch (durum)
            {
                case "all":
                    break;
                case "aktif": durum = "1"; query = query.Where(e => e.AKTIFLIK.ToLower() == durum); break;
                case "pasif": durum = "0"; query = query.Where(e => e.AKTIFLIK.ToLower() == durum); break;

                default:
                    //throw new 
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, $"['{durum}'] uygunsuzluk durumu için doğru bir filtreleme aracı değildi. Lütfen Aktif ya da Pasif olarak filtreleyin ");
                    //return Request.CreateErrorResponse(HttpStatusCode.BadRequest, new Exception());

            }



            //var uygunsuzlukList = db.UYGUNSUZLUK.ToList().Where(i => i.AKTIFLIK == "1");
            if (top >0 )
            {
                return Request.CreateResponse(HttpStatusCode.OK, query.Take(top.Value));
            }

         
            return Request.CreateResponse(HttpStatusCode.OK, query.ToList());




        }

        // GET api/<controller>/5
        //[MyAction]
        public HttpResponseMessage Get(int? id)
        {
            if (id == null)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Hata: Uygunsuzluk ID si rakamlardan oluşmalıdır.");
            }
            else
            {
                UYGUNSUZLUK uygunsuzlukById = new UYGUNSUZLUK();
                uygunsuzlukById = db.UYGUNSUZLUK.FirstOrDefault(i => i.ID_UYGUNSUZLUK == id);



                if (uygunsuzlukById != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, uygunsuzlukById);
                }
                else
                {

                    return Request.CreateResponse(HttpStatusCode.NotFound, "" + Convert.ToString(id) + " ID'li uygunsuzluk bulunamadı!");

                }
            }
           




        }

        // POST api/<controller>
        public HttpResponseMessage Post([FromBody] UYGUNSUZLUK postUygunsuzluk)
        {
            if (postUygunsuzluk != null)
            {

                if (postUygunsuzluk.TESPIT_TARIH > DateTime.Now || postUygunsuzluk.TESPIT_TARIH > postUygunsuzluk.TERMIN_TARIH)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Uygunsuzluk Tespit Tarihi Bugündenden(" + DateTime.Now.ToShortDateString() + ") sonra olamaz.");
                }
                else
                {

                    db.UYGUNSUZLUK.Add(postUygunsuzluk);
                    if (db.SaveChanges() > 0)
                    {
                        return Request.CreateResponse(HttpStatusCode.Created, postUygunsuzluk);
                    }
                    else
                    {
                        return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Uygunsuzluk Ekleme İşlemi Yapılamadı!");
                    }

                }

            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Uygunsuzluk Ekleme İşlemi Yapılamadı! Bilgilerin Doğru bir şekilde doldurulduğundan emin olun");

            }



        }

        // PUT api/<controller>/5
        public HttpResponseMessage Put(int id, [FromBody] UYGUNSUZLUK putUygunsuzluk)
        {

            UYGUNSUZLUK kontrol = new UYGUNSUZLUK();

            kontrol = db.UYGUNSUZLUK.FirstOrDefault(i => i.ID_UYGUNSUZLUK == id);

            if (kontrol == null)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "" + id + "'li uygunsuzluk bulunamadı");
            }
            else
            {
                if (putUygunsuzluk == null || putUygunsuzluk.TESPIT_TARIH > putUygunsuzluk.TERMIN_TARIH || putUygunsuzluk.TERMIN_TARIH > DateTime.Now || String.IsNullOrEmpty(putUygunsuzluk.SORUMLU_AD) || String.IsNullOrEmpty(putUygunsuzluk.TESPIT_EDEN_AD) || String.IsNullOrEmpty(putUygunsuzluk.UYGUNSUZ_DURUM) || String.IsNullOrEmpty(putUygunsuzluk.BIRIM) || String.IsNullOrEmpty(putUygunsuzluk.TUR) || putUygunsuzluk.TESPIT_TARIH == null || putUygunsuzluk.TERMIN_TARIH == null)
                {

                    string errorMessage = "Bu kayıt güncellenemdi.. Kontrol Ediniz@";
                    errorMessage = errorMessage.Replace("@", "@" + System.Environment.NewLine);
                    return Request.CreateResponse(HttpStatusCode.BadRequest, errorMessage + putUygunsuzluk);

                }
                else
                {

                    kontrol.AKTIFLIK = putUygunsuzluk.AKTIFLIK;
                    kontrol.BIRIM = putUygunsuzluk.BIRIM;
                    kontrol.ONERI_AKSIYON = putUygunsuzluk.ONERI_AKSIYON;
                    kontrol.UYGUNSUZ_DURUM = putUygunsuzluk.UYGUNSUZ_DURUM;
                    kontrol.TESPIT_EDEN_AD = putUygunsuzluk.TESPIT_EDEN_AD;
                    kontrol.SORUMLU_AD = putUygunsuzluk.SORUMLU_AD;
                    kontrol.TESPIT_TARIH = putUygunsuzluk.TESPIT_TARIH;
                    kontrol.TERMIN_TARIH = putUygunsuzluk.TERMIN_TARIH;
                    kontrol.TUR = putUygunsuzluk.TUR;

       

                    db.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, kontrol);
                    //p
                }
            }



        }





        // DELETE api/<controller>/5
        
        public HttpResponseMessage Delete(int id)
        {

            UYGUNSUZLUK kontrol = new UYGUNSUZLUK();

            kontrol = db.UYGUNSUZLUK.FirstOrDefault(i => i.ID_UYGUNSUZLUK == id);

            if (kontrol == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, "" + id + "li uygunsuzluk kaydı bulunamadı!..");
                //Api Added

            }
            else
            {
                kontrol.AKTIFLIK = "0";
                db.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Silindi!" + kontrol);



            }





        }


    }

   
}

