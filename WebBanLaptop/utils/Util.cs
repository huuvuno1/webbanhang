using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;

namespace WebBanLaptop.Utils
{
    public class Util
    {
        public static string getPriceRangeCondition(string priceRange)
        {
            switch (priceRange)
            {
                case "1":
                    return "price < 5000000";
                    
                case "2":
                    return "price between 5000000 and 10000000";
                    
                case "3":
                    return "price between 10000000 and 15000000";
                    
                case "4":
                    return "price between 15000000 and 20000000";
                    
                case "5":
                    return "price > 20000000";
                    
                default:
                    return "price > 0";
            }
        }
    }
}