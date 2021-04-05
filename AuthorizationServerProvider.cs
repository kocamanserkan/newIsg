using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;

namespace serkanISG
{
    
    public class AuthorizationServerProvider : OAuthAuthorizationServerProvider

    {
        
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();

        }
        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            serkanISGEntities1 db = new serkanISGEntities1();
            PERSONEL per = new PERSONEL();
            per = db.PERSONEL.FirstOrDefault(i => i.KULLANICI_ADI == context.UserName);

            

            if (per != null && per.KULLANICI_ADI.ToLower() == context.UserName.ToLower() && context.Password == per.SIFRE)
            {
                var identity = new ClaimsIdentity(context.Options.AuthenticationType);
                identity.AddClaim(new Claim("sub", context.UserName));
                identity.AddClaim(new Claim("role", "user"));
                context.Validated(identity);



            }
            else
            {
                context.SetError("Oturum Hatası", "Kullanıcı adı veya Şifre Hatalı");
            }

        }




    }

}