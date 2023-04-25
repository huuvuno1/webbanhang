using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using WebBanLaptop.DAO;

namespace WebBanLaptop
{
    public partial class management_order_details : System.Web.UI.Page
    {
        private OrderDetailDAO detailDAO;
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
            detailDAO = new OrderDetailDAO();
            string order_id = Request.QueryString["order_id"];
            if (order_id != null)
            {
                var details = detailDAO.getOrderDetailByOrderId(order_id);
                if (details != null)
                {
                    GridView1.DataSource = details;
                    GridView1.DataBind();
                }
                else
                {
                    Response.StatusCode = 404;
                }
            }
            else
            {
                Response.StatusCode = 404;
                Response.Redirect("management-list-order.aspx");
            }
        }
    }
}