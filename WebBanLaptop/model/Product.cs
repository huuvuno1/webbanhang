using System;
using System.Collections.Generic;
using System.Data;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebBanLaptop.Model
{
    public class Product
    {

        public int Id { get; set; }
        public string Name { get; set; }
        public string Slug { get; set; }
        public string Description { get; set; }
        public int Price { get; set; }
        public int Quantity { get; set; }
        public int Status { get; set; }
        public string Brand { get; set; }
        public string Image { get; set; }
        public int CategoryId { get; set; }
        public object Products { get; internal set; }
        public object Search { get; internal set; }
        public string Cpu { get; internal set; }
        public string Gpu { get; internal set; }
        public string Ram { get; internal set; }
        public string Screen { get; internal set; }

        public int OldPrice { get; set; }
        public string CPU { get; set; }
        public string RAM { get; set; }
        public string HardDrive { get; set; }
        public float Weight { get; set; }
        public string Type { get; set; }
        [NotMapped]
        public string CategoryName { get; set; }
        public Category Category { get; set; }

        

        public Product()
        {
        }

        public static implicit operator DataTable(Product v)
        {
            throw new NotImplementedException();
        }
    }
}