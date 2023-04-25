﻿using System;
using System.Collections.Generic;
using System.Data;
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
            SqlCommand cmd = new SqlCommand("getOrderDetail", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@order_id", order_id);

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
                        ProductName = reader["name_product"].ToString(),
                    });
                }
            }
            con.Close();

            return details;
        }
        
    }
}