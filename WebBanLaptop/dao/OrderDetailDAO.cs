﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebBanLaptop.Model;
using WebBanLaptop.Utils;

namespace WebBanLaptop.DAO
{
    public class OrderDetailDAO
    {
        public List<OrderDetail> getOrderDetailByOrderId(string order_id)
        {
            List<OrderDetail> details = new List<OrderDetail>();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = $@"SELECT * FROM tbl_order_detail WHERE order_id = {order_id}";

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                while (reader.Read())
                {
                    details.Add(new OrderDetail()
                    {
                        Id = int.Parse(reader["id"].ToString()),
                        ProductId = int.Parse(reader["product_id"].ToString()),
                        Price = int.Parse(reader["price"].ToString()),
                        Quantity = int.Parse(reader["quantity"].ToString()),
                        OrderId = int.Parse(reader["order_id"].ToString()),
                    });
                }
            }
            con.Close();

            return details;
        }
        
    }
}