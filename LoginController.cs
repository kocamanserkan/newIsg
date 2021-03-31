using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace serkanISG
{
    public class LoginController : ApiController
    {
       


        // GET api/<controller>
        public HttpResponseMessage Get(giris gr )
        {

            PERSONEL person = new PERSONEL();

            //person = db.PERSONEL.FirstOrDefault(i => i.KULLANICI_ADI == gr.nickname && i.SIFRE == gr.password);

            if (person == null)
            {

                return Request.CreateResponse(HttpStatusCode.NotFound, ""+ gr.nickname +"adlı kullanıcı bulunamadı.");


            }
            else
            {

                return Request.CreateResponse(HttpStatusCode.OK, person);
            }




        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public HttpResponseMessage Post(giris gr)
        {
            PERSONEL person = new PERSONEL();

            //person = db.PERSONEL.FirstOrDefault(i => i.KULLANICI_ADI == gr.nickname && i.SIFRE == gr.password);

            if (person == null)
            {

                return Request.CreateResponse(HttpStatusCode.NotFound, "" + gr.nickname + "adlı kullanıcı bulunamadı.");


            }
            else
            {

                return Request.CreateResponse(HttpStatusCode.OK, person);
            }


        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }


    }

    public class giris
    {
        public string nickname { get; set; }
        public string password { get; set; }


    }


}

