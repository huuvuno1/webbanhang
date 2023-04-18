using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanLaptop
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Register_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["WebLaptopConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            if (checkUsername(username.Text, con))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tbl_user values(@username,@fullname,@password,@role)", con);
                cmd.Parameters.AddWithValue("@fullname", fullname.Text);
                cmd.Parameters.AddWithValue("@username", username.Text);
                cmd.Parameters.AddWithValue("@password", password.Text);
                cmd.Parameters.AddWithValue("@role", 1);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                Response.Redirect("Login.aspx");
            }
            else
            {
                Label1.Text = "Tài khoản đã tồn tại";
            }

        }
        protected bool checkUsername(string username, SqlConnection con)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_user where username=@username", con);
            cmd.Parameters.AddWithValue("@username", username);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (dt.Rows.Count > 0)
            {
                return false;
            }
            else { return true; }
        }
    }
}