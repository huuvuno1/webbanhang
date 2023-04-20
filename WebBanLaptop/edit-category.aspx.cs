using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;
using WebBanLaptop.Model;

namespace WebBanLaptop
{
    public partial class edit_category : System.Web.UI.Page
    {
        private CategoryDAO categoryDAO;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["admin"])
            {
                if (!Page.IsPostBack)
                {
                    categoryDAO = new CategoryDAO();
                    string id = Request.QueryString["id"];
                    if (id != null)
                    {
                        var category = categoryDAO.getCategoryById(id);
                        if (category != null)
                        {
                            name.Text = category.Name;
                        }
                        else
                        {
                            Response.StatusCode = 404;
                        }
                    }
                    else
                    {
                        Response.Redirect("management-list-category.aspx");
                    }

                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            categoryDAO = new CategoryDAO();
            string id = Request.QueryString["id"];
            bool check = categoryDAO.updateCategory(id,name.Text);
            if (check)
            {
                Response.Redirect("management-list-category.aspx");
            }
        }
    }
}