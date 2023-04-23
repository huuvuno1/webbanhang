using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
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
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = @"SELECT * FROM tbl_product";

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

        public bool insertProduct(int category_id, string name, string slug, int price, int quantity, string description)
        {
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);

            string strQuery = "insert into tbl_product values(@category_id,@name,@slug,@price,@quantity,@description,@status)";
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
                    product.Description = Convert.ToString(reader["description"]);
                    product.Slug = Convert.ToString(reader["slug"]);
                }
                return product;
            }
            else { return null; }
        }
        public bool updateProduct(string id, int category_id, string name, int price, int quantity, string description)
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
    }
}