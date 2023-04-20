using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using WebBanLaptop.Utils;

namespace WebBanLaptop
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login_Click(object sender, EventArgs e)
        {

            string strcon = Config.getConnectionString();
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_user where username=@username and password=@password", con);
            cmd.Parameters.AddWithValue("@username", username.Text);
            cmd.Parameters.AddWithValue("@password", password.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            cmd.ExecuteNonQuery();
            con.Close();

            if (dt.Rows.Count > 0)
            {
                Session["login"] = true;
                
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Session["user_name"] = dt.Rows[i]["fullname"].ToString();
                    if (dt.Rows[i]["role"].ToString() == "1")
                    {
                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        Session["admin"] = true;
                        Response.Redirect("admin-management.aspx");
                    }
                }
                
            }
            else
            {
                Label1.Text = "Tên đăng nhập/Mật khẩu không chính xác";

            }


        }
    }
}