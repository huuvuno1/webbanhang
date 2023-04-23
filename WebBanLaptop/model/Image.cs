using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanLaptop.Model
{
    public class Image
    {
        public int Id { get; set; }
        public string Path { get; set; }
        public int ProductId { get; set; }

        public Image(int id, string path, int product_id)
        { 
            Id = id;
            Path = path;
            ProductId = product_id;
        }

        public Image()
        {
        }
    }
}