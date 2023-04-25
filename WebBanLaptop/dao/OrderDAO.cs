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
    public class OrderDAO
    {
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        public List<Order> getOrders()
        {
            List<Order> orders = new List<Order>();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = @"SELECT * FROM tbl_order";

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                while (reader.Read())
                {
                    orders.Add(new Order()
                    {
                        Id = int.Parse(reader["id"].ToString()),
                        CustomerName = reader["customer_name"].ToString(),
                        NumberPhone = reader["phone_number"].ToString(),
                        Address = reader["address"].ToString(),
                        Status = int.Parse(reader["delivery_status"].ToString()),
                    });
                }
            }
            con.Close();

            return orders;
        }
        public Order getOrderById(int id)
        {
            Order order= new Order();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = $@"SELECT * FROM tbl_order where id = {id}";
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                if (reader.Read())
                {
                    order.Id = Convert.ToInt32(reader["id"]);
                    order.CustomerName = Convert.ToString(reader["customer_name"]);
                    order.NumberPhone = Convert.ToString(reader["phone_number"]);
                    order.Address = Convert.ToString(reader["address"]);
                    order.Status = Convert.ToInt32(reader["delivery_status"]);
                }
                return order;
            }
            else { return null; }
        }
        public bool updateStatusOrder(int id)
        {
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);

            string strQuery = @"update tbl_order set delivery_status = 2 where id = @id";
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

        public void createOrder(ref Order order, List<Cart> carts)
        {
            string conn = Config.getConnectionString();
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = @"INSERT INTO tbl_order(email, phone_number, customer_name, address, delivery_status, note)
                VALUES(@email, @phone_number, @customer_name, @address, @delivery_status, @note);
                Select Scope_Identity()";

            cmd.Parameters.AddWithValue("@email", order.Email);
            cmd.Parameters.AddWithValue("@phone_number", order.NumberPhone);
            cmd.Parameters.AddWithValue("@customer_name", order.CustomerName);
            cmd.Parameters.AddWithValue("@address", order.Address);
            cmd.Parameters.AddWithValue("@delivery_status", 0);
            cmd.Parameters.AddWithValue("@note", order.Note);
            int order_id = int.Parse(cmd.ExecuteScalar().ToString());
            order.Id = order_id;

            carts.ForEach(cart =>
            {
                orderDetailDAO.SaveOrderDetail(order_id, cart);
            });

            con.Close();
        }
        
        public List<Order> getOrdersByNamOrPhone(string input)
        {
            List<Order> orders = new List<Order>();
            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = new SqlCommand("getOrdersByNamOrPhone", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@input", input);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader != null && reader.HasRows)
            {
                while (reader.Read())
                {
                    orders.Add(new Order()
                    {
                        Id = int.Parse(reader["id"].ToString()),
                        CustomerName = reader["customer_name"].ToString(),
                        NumberPhone = reader["phone_number"].ToString(),
                        Address = reader["address"].ToString(),
                        Status = int.Parse(reader["delivery_status"].ToString()),
                    });
                }
                return orders;
            }
            else { return null; }
        }


        public void createOrder(ref Order order, List<Cart> carts)
        {
            string conn = Config.getConnectionString();
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = @"INSERT INTO tbl_order(email, phone_number, customer_name, address, delivery_status, note)
                VALUES(@email, @phone_number, @customer_name, @address, @delivery_status, @note);
                Select Scope_Identity()";

            cmd.Parameters.AddWithValue("@email", order.Email);
            cmd.Parameters.AddWithValue("@phone_number", order.NumberPhone);
            cmd.Parameters.AddWithValue("@customer_name", order.CustomerName);
            cmd.Parameters.AddWithValue("@address", order.Address);
            cmd.Parameters.AddWithValue("@delivery_status", 0);
            cmd.Parameters.AddWithValue("@note", order.Note);
            int order_id = int.Parse(cmd.ExecuteScalar().ToString());
            order.Id = order_id;

            carts.ForEach(cart =>
            {
                orderDetailDAO.SaveOrderDetail(order_id, cart);
            });

            con.Close();
        }
        
    }
}