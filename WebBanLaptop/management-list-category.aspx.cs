using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;

namespace WebBanLaptop
{
    public partial class management_list_category : System.Web.UI.Page
    {
        private CategoryDAO category;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["admin"])
            {
                if (!Page.IsPostBack)
                {
                    BindData();
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void BindData()
        {
            category = new CategoryDAO();
            GridView1.DataSource = category.getListCategory();
            GridView1.DataBind();
        }
    }
}