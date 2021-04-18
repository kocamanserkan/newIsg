using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace serkanISG.Controllers
{
    public class PersonController : ApiController
    {
        serkanISGEntities1 db = new serkanISGEntities1();
        [HttpGet]
        public HttpResponseMessage Get()
        {


            return Request.CreateResponse(HttpStatusCode.OK, db.PERSONEL.ToList());



        }


        [HttpPost]
        public HttpResponseMessage Post([FromBody] PERSONEL per)
        {
            per.PERSONEL_AD = per.PERSONEL_AD.ToUpper();
            per.PERSONEL_SOYAD = per.PERSONEL_SOYAD.ToUpper();
            per.YAPTIGI_IS = per.YAPTIGI_IS.ToUpper();
         
            
            db.PERSONEL.Add(per);
            if (db.SaveChanges() > 0)
            {
                return Request.CreateResponse(HttpStatusCode.Created, per);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, "Uygunsuzluk Ekleme İşlemi Yapılamadı!");
            }


        }



    }
}
