using System;
using System.Collections.Generic;
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
        public float OldPrice { get; set; }
        public string CPU { get; set; }
        public string RAM { get; set; }
        public string HardDrive { get; set; }
        public float Weight { get; set; }
        public string Screen { get; set; }
        public string Type { get; set; }

        public Product(int id, string name, string description, int price, int quantity, int status, 
            string slug, string brand, float oldPrice, string cPU, string rAM, string hardDrive, float weight, string screen, string type)
        {
            Id = id;
            Name = name;
            Description = description;
            Price = price;
            Quantity = quantity;
            Status = status;
            Slug = slug;
            Brand = brand;
            OldPrice = oldPrice;
            CPU = cPU;
            RAM = rAM;
            HardDrive = hardDrive;
            Weight = weight;
            Screen = screen;
            Type = type;
        }

        public Product()
        {
        }
    }
}