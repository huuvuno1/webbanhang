using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanLaptop.model
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public float Price { get; set; }

        public Product(int id, string name, string description, float price)
        {
            Id = id;
            Name = name;
            Description = description;
            Price = price;
        }

        public Product()
        {
        }
    }
}