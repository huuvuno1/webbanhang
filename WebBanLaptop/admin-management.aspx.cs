using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanLaptop
{
    public partial class admin_management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["admin"])
            {
                welcome.InnerHtml = "Xin chào, " + Session["user_name"];
                return;
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}