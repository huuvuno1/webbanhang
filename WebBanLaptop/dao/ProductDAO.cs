using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebBanLaptop.model;
using WebBanLaptop.utils;

namespace WebBanLaptop.dao
{
    public class ProductDAO
    {
        private List<Product> getProducts()
        {
            List<Product> products = new List<Product>();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = @"SELECT top 20 * FROM tblProduct";

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                if (reader.Read())
                {
                    products.Add(new Product()
                    {
                        Id= int.Parse(reader["id"].ToString()),
                        Name = reader["Name"].ToString(),
                        Price = float.Parse(reader["mGiaban"].ToString()),
                        Description = reader["Pk_idienthoaiid"].ToString(),
                    }); ;
                }
            }
            con.Close();

            return products;
        }
    }
}