using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanLaptop.Model
{
    public class Order
    {
        public int Id { get; set; }
        public string CustomerName { get; set; }
        public string NumberPhone { get; set; }
        public string Address { get; set; }
        public int Status { get; set; }

        public Order(int id, string name, string address, int status, string phone)
        {
            Id = id;
            CustomerName = name;
            Address = address;
            Status = status;
            NumberPhone = phone;
        }

        public Order()
        {
        }
    }
}