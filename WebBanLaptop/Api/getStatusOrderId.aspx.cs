using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;
using WebBanLaptop.Model;
using WebBanLaptop.Utils;

namespace WebBanLaptop.Api
{
    public partial class getStatusOrderId : System.Web.UI.Page
    {
        OrderDAO orderDAO = new OrderDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderId = Request.QueryString["order_id"];
            if (string.IsNullOrEmpty(orderId))
            {
                Response.StatusCode = 404;
                Response.End();
                return;
            }
            Order order = orderDAO.getOrderById(int.Parse(orderId));
            if (order == null)
            {
                Response.StatusCode = 404;
                Response.End();
            }
            else
            {
                Response.Write($@"id={orderId}&status={order.Status}");
            }
        }
    }
}