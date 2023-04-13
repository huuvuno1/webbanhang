using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace WebBanLaptop.utils
{
    public class Config
    {
        public static string getConnectionString()
        {
            string strcon = ConfigurationManager.ConnectionStrings["Bai23ConnectionString"].ConnectionString;
            return strcon;
        }
    }
}