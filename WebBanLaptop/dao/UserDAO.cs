using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using WebBanLaptop.Model;
using WebBanLaptop.Utils;

namespace WebBanLaptop.DAO
{
    public class UserDAO
    {
        public List<User> getUsers()
        {
            List<User> users = new List<User>();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = @"SELECT * FROM tbl_user WHERE role = 1";

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                while (reader.Read())
                {
                    users.Add(new User()
                    {
                        Id = int.Parse(reader["id"].ToString()),
                        Username = reader["username"].ToString(),
                        Fullname = reader["fullname"].ToString(),
                        Role = int.Parse(reader["role"].ToString()),
                    });
                }
            }
            con.Close();

            return users;
        }
        public User getUserById(int id)
        {
            User user = new User();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = $@"SELECT * FROM tbl_user where id = {id}";
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                if (reader.Read())
                {
                    user.Id = Convert.ToInt32(reader["id"]);
                    user.Username = Convert.ToString(reader["username"]);
                    user.Fullname = Convert.ToString(reader["fullname"]);
                    user.Role = Convert.ToInt32(reader["role"]);
                }
                return user;
            }
            else { return null; }
        }
        public bool deleteUser(int id)
        {
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);

            string strQuery = @"delete tbl_user where id = @id";
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
    }
}