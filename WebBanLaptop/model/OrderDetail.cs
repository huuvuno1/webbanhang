using System;
using System.Collections.Generic;
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
        public Order order { get; set; }
        public Product product { get; set; }

        public OrderDetail(int id, int product_id, int price, int quantity, int order_id)
        {
            Id = id;
            ProductId = product_id;
            Price = price;
            Quantity = quantity;
            OrderId = order_id;
        }

        public OrderDetail()
        {
        }
    }
}