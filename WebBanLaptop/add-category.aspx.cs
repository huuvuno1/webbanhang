using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;

namespace WebBanLaptop
{
    public partial class add_category : System.Web.UI.Page
    {
        private CategoryDAO categoryDAO;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["admin"])
            {
                return;
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            categoryDAO = new CategoryDAO();
            bool check = categoryDAO.insertCategory(name.Text);
            if(check)
            {
                Response.Redirect("management-list-category.aspx");
            }    
        }
    }
}