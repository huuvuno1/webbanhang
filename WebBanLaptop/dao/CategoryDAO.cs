using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using WebBanLaptop.Model;
using WebBanLaptop.Utils;

namespace WebBanLaptop.DAO
{
    public class CategoryDAO
    {
        public List<Category> getListCategory()
        {
            List<Category> categories = new List<Category>();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = @"SELECT * FROM tbl_category";

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                while (reader.Read())
                {
                    categories.Add(new Category()
                    {
                        Id = int.Parse(reader["id"].ToString()),
                        Name = reader["name"].ToString()
                    });
                }
            }
            con.Close();

            return categories;
        }

        public bool insertCategory(string name)
        {
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);

            string strQuery = @"insert into tbl_category values(@name)";
            SqlCommand cmd = new SqlCommand(strQuery);
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
        public bool updateCategory(string id, string name)
        {
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);

            string strQuery = @"update tbl_category set name = @name where id = @id";
            SqlCommand cmd = new SqlCommand(strQuery);
            cmd.Parameters.AddWithValue("@id", id);
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
        public Category getCategoryById(string id)
        {
            Category category = new Category();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = $@"SELECT * FROM tbl_category where id = {id}";
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                if (reader.Read())
                {
                    category.Id = Convert.ToInt32(reader["id"]);
                    category.Name = Convert.ToString(reader["name"]);
                }
                return category;
            }
            else { return null; }
        }
    }
}