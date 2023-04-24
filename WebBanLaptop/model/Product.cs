using System;
using System.Collections.Generic;
using System.Data;
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
        public int OldPrice { get; internal set; }
        public string Screen { get; internal set; }

        public Product(int id, string name, string description, int price, int category_id, int quantity, int status, string slug, string brand,string image,string cpu,string gpu,string ram,int oldPrice ,string screen)
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
            Image = image;
            Cpu = cpu;
                Gpu = gpu;
            Ram = ram;
            OldPrice = oldPrice;
            Screen = screen;
        }

        public Product()
        {
        }

        public static implicit operator DataTable(Product v)
        {
            throw new NotImplementedException();
        }
    }
}