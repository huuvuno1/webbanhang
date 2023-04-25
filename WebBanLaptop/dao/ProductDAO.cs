using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Globalization;
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
                        Brand = reader["brand"].ToString(),
                        CPU = reader["cpu"].ToString(),
                        RAM = reader["ram"].ToString(),
                        CategoryName = reader["name_category"].ToString(),
                        OldPrice = int.Parse(reader["oldPrice"].ToString(), CultureInfo.InvariantCulture),
                        HardDrive = reader["hardDrive"].ToString(),
                        Weight = float.Parse(reader["weight"].ToString(), CultureInfo.InvariantCulture),
                        Screen = reader["screen"].ToString(),
                        Type = reader["type"].ToString(),
                    });
                }
            }
            con.Close();

            return products;
        }

        public Pageable filterProducts(string categoryType, string priceRanges, string brands, string sortBy, int page_num, int page_size)
        {
            string priceRangeCondition = "";
            if (!string.IsNullOrEmpty(priceRanges))
            {
                var map = priceRanges.Split(',').Select(x => Util.getPriceRangeCondition(x));
                priceRangeCondition = string.Join(" or ", map);
            }


            string condition = priceRangeCondition == "" ? "" : $"WHERE ({priceRangeCondition})";
            if (!String.IsNullOrEmpty(brands))
            {
                string prefix = condition == "" ? "WHERE" : "AND";
                condition += $@"{prefix} (brand in ({string.Join(", ", brands.Split(',').Select(x => $"'{x}'"))}))";
            }

            if (!String.IsNullOrEmpty(categoryType))
            {
                string prefix = condition == "" ? "WHERE" : "AND";
                condition += $@"{prefix} (type=@type) ";
            }

            string sort = !String.IsNullOrEmpty(sortBy) ? $"order by {sortBy.Split('_')[0]} {sortBy.Split('_')[1]}" : "order by id";
            string paging = $@" OFFSET @offset ROWS
                                    FETCH NEXT @page_size ROWS ONLY";
            List<Product> products = new List<Product>();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            // get prodcuts
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = $"SELECT * FROM tbl_product {condition} {sort} {paging}";
            cmd.Parameters.AddWithValue("@offset", (page_num - 1) * page_size);
            cmd.Parameters.AddWithValue("@page_size", page_size);
            if (!String.IsNullOrEmpty(categoryType))
            {
                cmd.Parameters.AddWithValue("@type", categoryType);
            }

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                while (reader.Read())
                {
                    string oldPrice = reader["oldPrice"].ToString();

                    products.Add(new Product()
                    {
                        Id = int.Parse(reader["id"].ToString()),
                        Name = reader["name"].ToString(),
                        Price = int.Parse(reader["price"].ToString()),
                        Description = reader["description"].ToString(),
                        Quantity = int.Parse(reader["quantity"].ToString()),
                        CategoryId = int.Parse(reader["category_id"].ToString()),
                        Status = int.Parse(reader["status"].ToString()),
                        Brand = reader["brand"].ToString(),
                        Image = reader["img"].ToString(),
                        Cpu = reader["cpu"].ToString(),
                        Gpu = reader["hardDrive"].ToString(),
                        Ram = reader["ram"].ToString(),
                        OldPrice = oldPrice == "" ? int.Parse(reader["price"].ToString()) : int.Parse(oldPrice),

                    });
                }
            }

            con.Close();
            con.Open();

            // count result
            // MultipleActiveResultSets=true;
            SqlCommand cmd2 = con.CreateCommand();
            cmd2.CommandText = $"select count(*) from tbl_product {condition}";
            if (!String.IsNullOrEmpty(categoryType))
            {
                cmd2.Parameters.AddWithValue("@type", categoryType);
            }
            string count = cmd2.ExecuteScalar().ToString();

            con.Close();

            Pageable pageable = new Pageable()
            {
                Total= int.Parse(count),
                Products= products,
            };

            return pageable;
        }

        public int insertProduct(int category_id,string name,string slug,int price,int quantity,string description,string brand,
            float oldPrice,string cpu,string ram,string hardDrive,float weight,string screen,string type)
        {
            int product_id;
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);

            string strQuery = "insert into tbl_product values(@category_id,@name,@slug,@price,@quantity," +
                "@description,@status,@brand,@oldPrice,@cpu,@ram,@hardDrive,@weight,@screen,@type) " +
                "Select Scope_Identity()";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.AddWithValue("@category_id", category_id);
            cmd.Parameters.AddWithValue("@slug", slug);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@status", 1);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@brand", brand);
            cmd.Parameters.AddWithValue("@cpu", cpu);
            cmd.Parameters.AddWithValue("@oldPrice", oldPrice);
            cmd.Parameters.AddWithValue("@ram", ram);
            cmd.Parameters.AddWithValue("@hardDrive", hardDrive);
            cmd.Parameters.AddWithValue("@weight", weight);
            cmd.Parameters.AddWithValue("@screen", screen);
            cmd.Parameters.AddWithValue("@type", type);

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
                    string oldPrice = reader["oldPrice"].ToString();
                    product.Id = int.Parse(reader["id"].ToString());
                    product.Name = reader["name"].ToString();
                    product.Price = int.Parse(reader["price"].ToString());
                    product.Description = reader["description"].ToString();
                    product.Quantity = int.Parse(reader["quantity"].ToString());
                    product.CategoryId = int.Parse(reader["category_id"].ToString());
                    product.Status = int.Parse(reader["status"].ToString());
                    product.Brand = reader["brand"].ToString();
                    product.Image = reader["img"].ToString();
                    product.Cpu = reader["cpu"].ToString();
                    product.Gpu = reader["hardDrive"].ToString();
                    product.Ram = reader["ram"].ToString();
                    product.OldPrice = oldPrice == "" ? int.Parse(reader["price"].ToString()) : int.Parse(oldPrice);
                    product.Screen = reader["screen"].ToString();

                }
                return product;
            }
            else { return null; }
        }
        public List<Product> getProductByName(string name)
        {
            List<Product> products = new List<Product>();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = $@"SELECT * FROM tbl_product where name Like '%{name}%'";
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                while (reader.Read())
                {
                    Product product = new Product();
                    product.Id = Convert.ToInt32(reader["id"]);
                    product.Name = Convert.ToString(reader["name"]);
                    product.CategoryId = Convert.ToInt32(reader["category_id"]);
                    product.Price = Convert.ToInt32(reader["price"]);
                    product.Quantity = Convert.ToInt32(reader["quantity"]);
                    product.Status = Convert.ToInt32(reader["status"]);
                    product.Description = Convert.ToString(reader["description"]);
                    product.Slug = Convert.ToString(reader["slug"]);
                    product.Image = Convert.ToString(reader["img"]);
                    product.Brand = Convert.ToString(reader["brand"]);

                    product.Brand = Convert.ToString(reader["brand"]);
                    product.CPU = Convert.ToString(reader["cpu"]);
                    product.RAM = Convert.ToString(reader["ram"]);
                    product.HardDrive = Convert.ToString(reader["hardDrive"]);
                    product.Screen = Convert.ToString(reader["screen"]);
                    product.Type = Convert.ToString(reader["type"]);
                    product.OldPrice =Convert.ToInt32(reader["oldPrice"].ToString() == "" ? reader["price"] : reader["oldPrice"]);
                    product.Weight = (float)Convert.ToDouble(reader["weight"]);
                    products.Add(product);

                }
                return products;
            }
            else { return null; }
        }
        public List<Product> getProductByType(string type)
        {
            List<Product> products = new List<Product>();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = $@"SELECT top 5 * FROM tbl_product where type Like '%{type}%'";
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                while (reader.Read())
                {
                    Product product = new Product();
                    product.Id = int.Parse(reader["id"].ToString());
                    product.Name = reader["name"].ToString();
                    product.Price = int.Parse(reader["price"].ToString());
                    product.Description = reader["description"].ToString();
                    product.Quantity = int.Parse(reader["quantity"].ToString());
                    product.CategoryId = int.Parse(reader["category_id"].ToString());
                    product.Status = int.Parse(reader["status"].ToString());
                    product.Brand = reader["brand"].ToString();
                    product.Image = reader["img"].ToString();
                    product.Cpu = reader["cpu"].ToString();
                    product.Gpu = reader["hardDrive"].ToString();
                    product.Ram = reader["ram"].ToString();
                    product.OldPrice = int.Parse(reader["oldPrice"].ToString());

                    products.Add(product);
                }
                return products;
            }
            else { return null; }
        }
        public bool updateProduct(int id, string name, int category_id, int price, int quantity, string description, string brand,
            float oldPrice, string cpu, string ram, string hardDrive, float weight, string screen, string type)
        {
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);

            SqlCommand cmd = new SqlCommand("UpdateProductByID", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@category_id", category_id);
            cmd.Parameters.AddWithValue("@price", price);
            cmd.Parameters.AddWithValue("@quantity", quantity);
            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@brand", brand);
            cmd.Parameters.AddWithValue("@oldPrice", oldPrice);
            cmd.Parameters.AddWithValue("@cpu", cpu);
            cmd.Parameters.AddWithValue("@ram", ram);
            cmd.Parameters.AddWithValue("@hardDrive", hardDrive);
            cmd.Parameters.AddWithValue("@weight", weight);
            cmd.Parameters.AddWithValue("@screen", screen);
            cmd.Parameters.AddWithValue("@type", type);

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
        public bool deleteImages(int product_id)
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