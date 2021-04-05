using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace serkanISG.MyFilter
{
    public class MyActionAttribute : ActionFilterAttribute
    {
        //-- Action Çalışmadan Önceki Durum
        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            using(serkanISGEntities1 db = new serkanISGEntities1())
            {
                StringBuilder sb = new StringBuilder();
                foreach (var item in actionContext.ActionArguments)
                {
                    sb.Append($"{item.Key} = {item.Value.ToString()},");
                }

                db.LogRegister.Add(new LogRegister()
                {
                    IsBefore = true,
                    LogCaption = $"{actionContext.ControllerContext.ControllerDescriptor.ControllerName} - {actionContext.ActionDescriptor.ActionName}",

                    //UserInfo = $"{Encoding.UTF8.GetString(Convert.FromBase64String(actionContext.Request.Headers.Authorization.Parameter))} ",
                   
                    Time = DateTime.Now,
                    LogDetail = sb.ToString()
                }) ; ;

                db.SaveChanges();

            }
     
            base.OnActionExecuting(actionContext);

        }
        //Çalıştıktan Sonraki duurm
        public override void OnActionExecuted(HttpActionExecutedContext actionExecutedContext)
        {
            using (serkanISGEntities1 db = new serkanISGEntities1())
            {


                db.LogRegister.Add(new LogRegister()
                {
                    IsBefore = false,
                    //UserInfo = $"{Encoding.UTF8.GetString(Convert.FromBase64String(actionExecutedContext.Request.Headers))} ",
                    LogCaption = $"{actionExecutedContext.ActionContext.ControllerContext.ControllerDescriptor.ControllerName} -- {actionExecutedContext.ActionContext.ActionDescriptor.ActionName}",
                    Time = DateTime.Now,
                    LogDetail = Convert.ToString(actionExecutedContext.ActionContext.Response.StatusCode)
                }) ;

                db.SaveChanges();

            }



            base.OnActionExecuted(actionExecutedContext);
        }

    }
}