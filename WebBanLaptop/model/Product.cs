using System;
using System.Collections.Generic;
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
        public int CategoryId { get; set; }
        public virtual Category Category { get; set; }

        public Product(int id, string name, string description, int price, int category_id, int quantity, int status, string slug, string brand)
        {
            Id = id;
            Name = name;
            Description = description;
            Price = price;
            CategoryId = category_id;
            Quantity = quantity;
            Status = status;
            Slug = slug;
            Brand= brand;
        }

        public Product()
        {
        }
    }
}