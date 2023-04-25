using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;

namespace WebBanLaptop.Api
{
    public partial class searchOrder : System.Web.UI.Page
    {
        private OrderDAO orderDAO = new OrderDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            string input = Request.QueryString["input"];
            if (String.IsNullOrEmpty(input))
            {
                GridView1.DataSource = orderDAO.getOrders();
                GridView1.DataBind();
            }

            var pageable = orderDAO.getOrdersByNamOrPhone(input);
            GridView1.DataSource = pageable;
            GridView1.DataBind();
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

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        { 
        }
    }
}