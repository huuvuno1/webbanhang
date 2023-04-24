using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;

namespace WebBanLaptop
{
    public partial class management_list_user : System.Web.UI.Page
    {
        private UserDAO userDAO;
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

        protected void Delete_Click(object sender, EventArgs e)
        {
            var button = (IButtonControl)sender;
            // grab the id from CommandArgument property
            int id = Convert.ToInt32(button.CommandArgument, CultureInfo.InvariantCulture);
            // call stored procedure based on id
            userDAO = new UserDAO();
            if (userDAO.deleteUser(id))
            {
                Response.Redirect("management-list-user.aspx");
            }
            else
            {
                Response.StatusCode = 200;
            }
        }
        protected void BindData()
        {
            userDAO = new UserDAO();
            GridView1.DataSource = userDAO.getUsers();
            GridView1.DataBind();
        }
    }
}