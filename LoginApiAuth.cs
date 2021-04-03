using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace serkanISG
{
    public class LoginApiAuth
    {
        internal const string Password = "159357";
        public static bool UserNameandPassword(string name, string pass)
        {
            
            using (serkanISGEntities1 db = new serkanISGEntities1())
            {
                return db.PERSONEL.Any(x => x.KULLANICI_ADI.Equals(name, StringComparison.OrdinalIgnoreCase) && x.SIFRE == pass );

            }






            




            //if(name=="sekoccan" && pass == "x1")
            //{
            //    return true;
            //}
            //else
            //{
            //    return false;
            //}

        }
        


    }
}