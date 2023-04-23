using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanLaptop.Model
{
    public class Pageable
    {
        public int Total { get; set; }
        public List<Product> Products { get; set; }
        public Pageable() { }

        public Pageable(int total, List<Product> products)
        {
            Total = total;
            Products = products;
        }
    }
}