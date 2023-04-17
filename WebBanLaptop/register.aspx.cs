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
            if(password.Text != confirm.Text)
            {
                Label1.Text = "Mật khẩu không trùng nhau";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                if (checkUsername(username.Text))
                {
                    string strcon = ConfigurationManager.ConnectionStrings["WebLaptopConnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(strcon);


                    SqlCommand cmd = new SqlCommand("insert into tbl_user values(@username,@fullname,@password,@role)", con);
                    cmd.Parameters.AddWithValue("@fullname", fullname.Text);
                    cmd.Parameters.AddWithValue("@username", username.Text);
                    cmd.Parameters.AddWithValue("@password", password.Text);
                    cmd.Parameters.AddWithValue("@role", 1);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Label1.Text = "Tài khoản đã tồn tại";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
            

        }
        protected bool checkUsername(string username)
        {
            string strcon = ConfigurationManager.ConnectionStrings["WebLaptopConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cmd = new SqlCommand("select * from tbl_user where username=@username", con);
            cmd.Parameters.AddWithValue("@username", username);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
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