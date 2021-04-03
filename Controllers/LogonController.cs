using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Web.Http;

namespace serkanISG.Controllers
{
    //[MyFilter.MyAuthorization]
    public class LogonController : ApiController
    {

        [HttpGet]
        public HttpResponseMessage Login([FromUri] string username, [FromUri] string pass)
        {
            if (serkanISG.LoginApiAuth.UserNameandPassword(username,pass))
            {
                //1- LogonUser
                var logonUser = new LogonToken()
                {
                    userName = username,
                    Password = pass
                };
                //2-JsonString
                var jsonString = JsonConvert.SerializeObject(logonUser);
                //Şifreleme
                var token = FTH.Extension.Encrypter.Encrypt(jsonString, serkanISG.LoginApiAuth.Password);
                return Request.CreateResponse(HttpStatusCode.OK, token);


            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.Unauthorized, "Kullanıcı adı veya şifresi yanlıştır");
            }

        }







        //public string LogonUser()
        //{
        //    return Thread.CurrentPrincipal.Identity.Name;

        //}

    }
}
