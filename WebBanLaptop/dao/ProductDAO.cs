using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using WebBanLaptop.Model;
using WebBanLaptop.Utils;

namespace WebBanLaptop.DAO
{
    public class ProductDAO
    {
        public List<Product> getProducts()
        {
            List<Product> products = new List<Product>();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            SqlCommand cmd = new SqlCommand("GetProcductCategoryData", con);

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                while (reader.Read())
                {
                    products.Add(new Product()
                    {
                        Id = int.Parse(reader["id"].ToString()),
                        Name = reader["name"].ToString(),
                        Price = int.Parse(reader["price"].ToString()),
                        Description = reader["description"].ToString(),
                        Quantity = int.Parse(reader["quantity"].ToString()),
                        CategoryId = int.Parse(reader["category_id"].ToString()),
                        Status = int.Parse(reader["status"].ToString()),
                        CategoryName = reader["name_category"].ToString(),
                    });
                }
            }
            con.Close();

            return products;
        }
        public int insertProduct(int category_id,string name,string slug,int price,int quantity,string description)
        {
            int product_id;
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);

            string strQuery = "insert into tbl_product values(@category_id,@name,@slug,@price,@quantity,@description,@status) Select Scope_Identity()";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.AddWithValue("@category_id", category_id);
            cmd.Parameters.AddWithValue("@slug", slug);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@status", 1);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            product_id = Convert.ToInt32(cmd.ExecuteScalar());
            return product_id;
        }
        public Product getProductById(string id)
        {
            Product product = new Product();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = $@"SELECT * FROM tbl_product where id = {id}";
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                if (reader.Read())
                {
                    product.Id = Convert.ToInt32(reader["id"]);
                    product.Name = Convert.ToString(reader["name"]);
                    product.CategoryId = Convert.ToInt32(reader["category_id"]);
                    product.Price = Convert.ToInt32(reader["price"]);
                    product.Quantity = Convert.ToInt32(reader["quantity"]);
                    product.Status = Convert.ToInt32(reader["status"]);
                    product.Description= Convert.ToString(reader["description"]);
                    product.Slug= Convert.ToString(reader["slug"]);
                }
                return product;
            }
            else { return null; }
        }
        public bool updateProduct (string id, int category_id, string name, int price, int quantity, string description) 
        {
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);

            string strQuery = $@"update tbl_product set name='{name}', category_id = {category_id}, price = {price}, quantity = {quantity}, description = '{description}' where id = {id}";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public bool deleteProduct(int id)
        {
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);

            string strQuery = @"update tbl_product set status = 0 where id = @id";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public bool insertImages(int product_id, string path )
        {
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);

            string strQuery = "insert into tbl_image values(@path,@product_id)";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.AddWithValue("@product_id", product_id);
            cmd.Parameters.AddWithValue("@path", path);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public bool deleteImages(string product_id)
        {
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);

            string strQuery = @"delete tbl_image where product_id = @product_id";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.AddWithValue("@product_id", product_id);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public List<Image> getImageByProductId(string product_id)
        {
            List<Image> images = new List<Image>();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = $@"SELECT * FROM tbl_image where product_id = {product_id}";
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                while (reader.Read())
                {
                    images.Add(new Image()
                    {
                        Id = int.Parse(reader["id"].ToString()),
                        Path = reader["path"].ToString(),
                        ProductId = int.Parse(reader["product_id"].ToString()),
                    });
                }
            }
            con.Close();

            return images;
        }
    }
}