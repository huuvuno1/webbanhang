using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanLaptop.Utils
{
    public class Constant
    {
        public static string[] Brands = new string[] { "Macbook", "Acer", "Dell", "HP", "Asus", "Lenovo", "MSI" };

        public static object[] Brands2 = new object[]
        {
            new{
                Name = "Macbook",
                Image = "/assets/images/Apple.png",
            },
            new{
                Name = "Acer",
                Image = "/assets/images/Acer.webp",
            },
            new{
                Name = "Dell",
                Image = "/assets/images/Dell.webp",
            },
            new{
                Name = "HP",
                Image = "/assets/images/HP.webp",
            },
            new{
                Name = "Asus",
                Image = "/assets/images/Asus.webp",
            },
            new{
                Name = "Lenovo",
                Image = "/assets/images/Lenovo.webp",
            },
            new{
                Name = "MSI",
                Image = "/assets/images/MSI.webp",
            },
        };

        public static object[] PriceRange = new object[]
        {
            new
            {
                Name = "Dưới 5 triệu",
                Value = 1,
                Image = "/assets/images/p1.webp"
            },
            new
            {
                Name = "Từ 5 - 10 triệu",
                Value = 2,
                Image = "/assets/images/p2.webp"
            },
            new
            {
                Name = "Từ 10 - 15 triệu",
                Value = 3,
                Image = "/assets/images/p3.webp"
            },
            new
            {
                Name = "Từ 15 - 20 triệu",
                Value = 4,
                Image = "/assets/images/p4.webp"
            },
            new
            {
                Name = "Trên 20 triệu",
                Value = 5,
                Image = "/assets/images/p5.webp"
            },
            new
            {
                Name = "Xem tất cả",
                Value = 6,
                Image = "/assets/images/p1.webp"
            },
        };

        public static string[] OrderStatus = new string[] { "Chờ xác nhận", "Gọi xác nhận", "Đang giao", "Đã giao", "Đã hoàn thành" };
    }
}