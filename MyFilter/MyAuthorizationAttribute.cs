using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Security.Principal;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace serkanISG.MyFilter
{
    public class MyAuthorizationAttribute:AuthorizationFilterAttribute
    {

        public override void OnAuthorization(HttpActionContext actionContext)
        {
            if (actionContext.Request.Headers.Authorization==null)
            {

                actionContext.Response = actionContext.Request.CreateResponse(System.Net.HttpStatusCode.Unauthorized,"Bu alanı görmek için oturum izniniz bulunmamaktadır. Lütfen Giriş Yapın");
                return;

            }
            else
            {
                //LogonToken logonUser = null;
                //try
                //{
                var tokenKey = actionContext.Request.Headers.Authorization.Parameter;
                //    var jsonString = FTH.Extension.Encrypter.Decrypt(tokenKey, LoginApiAuth.Password);
                //    logonUser = JsonConvert.DeserializeObject<LogonToken>(jsonString);
                //}
                //catch
                //{
                //    actionContext.Response = actionContext.Request.CreateResponse(System.Net.HttpStatusCode.Unauthorized, "Bu alanı görmek için oturum izniniz bulunmamaktadır. Lütfen Giriş Yapın");

                //}




                //Eski Basic Authorization
                var userNamePassword = Encoding.UTF8.GetString(Convert.FromBase64String(tokenKey));
                var userInfoArray = userNamePassword.Split(':');
                var userName = userInfoArray[0];
                var password = userInfoArray[1];
            

                if (LoginApiAuth.UserNameandPassword(userName, password))
                {
                    Thread.CurrentPrincipal = new GenericPrincipal(new GenericIdentity(userName), null);


                }
                else
                {
                    actionContext.Response = actionContext.Request.CreateResponse(System.Net.HttpStatusCode.Unauthorized,$"Kullanıcı adı veya şifre yanlış!");

                }


                    
            }



            //base.OnAuthorization(actionContext);
        }

    }
}

