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
    public partial class OrderLookup : System.Web.UI.Page
    {
        OrderDAO orderDAO = new OrderDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderId = Request.QueryString["orderId"];
            if (string.IsNullOrEmpty(orderId) || !orderId.StartsWith("AA500BB")) {
                Response.StatusCode = 404;
                Response.End();
                return;
            }
            orderId = orderId.Replace("AA500BB", "");
            Order order = orderDAO.getOrderById(int.Parse(orderId));
            if (order == null)
            {
                Response.StatusCode = 404;
                Response.End();
            } 
            else
            {
                Response.Write($@"id={"AA500BB" + orderId}&status={Constant.OrderStatus[order.Status]}&name={order.CustomerName}&createdAt={order.CreatedAt}&statusCode={order.Status}");
            }
        }
    }
}