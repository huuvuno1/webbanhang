using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace WebBanLaptop.Utils
{
    public class Config
    {
        public static string getConnectionString()
        {
            string strcon = ConfigurationManager.ConnectionStrings["WebLaptopConnection"].ConnectionString;
            return strcon;
        }
    }
}