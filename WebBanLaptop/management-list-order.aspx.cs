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
    public partial class management_list_order : System.Web.UI.Page
    {
        private OrderDAO orderDAO;
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

        protected void Confirm_Click(object sender, EventArgs e)
        {
            var button = (IButtonControl)sender;
            // grab the id from CommandArgument property
            int id = Convert.ToInt32(button.CommandArgument, CultureInfo.InvariantCulture);
            // call stored procedure based on id
            orderDAO = new OrderDAO();
            if (orderDAO.updateStatusOrder(id))
            {
                Response.Redirect("management-list-order.aspx");
            }
            else
            {
                form1.InnerText = "loi!";
            }

        }
        protected void BindData()
        {
            orderDAO = new OrderDAO();
            GridView1.DataSource = orderDAO.getOrders();
            GridView1.DataBind();
        }
        protected bool ShowButton(Object DataItem)
        {
            //Here you can place as many conditions as you like 
            //Provided you always return either true or false
            if ((string)DataItem == "0")
                return true;
            else
                return false;
        }
    }
}