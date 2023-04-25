using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebBanLaptop.Model
{
    public class OrderDetail
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int Price { get; set; }
        public int Quantity { get; set; }
        public int OrderId { get; set; }

        [NotMapped]
        public string ProductName { get; set; }
        public Order order { get; set; }
        public Product product { get; set; }

        public OrderDetail(int id, int product_id, int price, int quantity, int order_id, string product_name)
        {
            Id = id;
            ProductId = product_id;
            Price = price;
            Quantity = quantity;
            OrderId = order_id;
            ProductName = product_name;
        }

        public OrderDetail()
        {
        }
    }
}