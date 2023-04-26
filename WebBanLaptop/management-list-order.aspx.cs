using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;
using WebBanLaptop.Utils;

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
            int status = 1;
            var button = (IButtonControl)sender;
            // grab the id from CommandArgument property
            int id = Convert.ToInt32(button.CommandArgument, CultureInfo.InvariantCulture);
            // call stored procedure based on id
            orderDAO = new OrderDAO();
            if (orderDAO.updateStatusOrder(id, status))
            {
                Response.Redirect("management-list-order.aspx");
            }

        }
        protected void BindData()
        {
            orderDAO = new OrderDAO();
            GridView1.DataSource = orderDAO.getOrders();
            GridView1.DataBind();
        }
        protected bool ShowButtonConfirm(Object DataItem)
        {
            //Here you can place as many conditions as you like 
            //Provided you always return either true or false
            if ((string)DataItem == "0")
                return true;
            else
                return false;
        }
        protected void GridView1_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // get correct Label value
                string value = (e.Row.FindControl("lb_status") as Label).Text;

                // convert string value into an integer value
                int intValue = int.Parse(value);

                if (intValue == 0)
                {
                    e.Row.Cells[7].Text = "Chờ xác nhận";
                }
                if (intValue == 1)
                {
                    e.Row.Cells[7].Text = "Gọi xác nhận";
                }
                if (intValue == 2)
                {
                    e.Row.Cells[7].Text = "Đang giao";
                }
                if (intValue == 3)
                {
                    e.Row.Cells[7].Text = "Đã giao";
                }
                if (intValue == 4)
                {
                    e.Row.Cells[7].Text = "Đã hoàn thành";
                }
            }
        }
        protected void GiaoHang_Click(object sender, EventArgs e)
        {
            int status = 2;
            var button = (IButtonControl)sender;
            // grab the id from CommandArgument property
            int id = Convert.ToInt32(button.CommandArgument, CultureInfo.InvariantCulture);
            // call stored procedure based on id
            // call stored procedure based on id
            orderDAO = new OrderDAO();
            if (orderDAO.updateStatusOrder(id, status))
            {
                Response.Redirect("management-list-order.aspx");
            }

        }
        protected bool ShowButtonGiaoHang(Object DataItem)
        {
            //Here you can place as many conditions as you like 
            //Provided you always return either true or false
            if ((string)DataItem == "1")
                return true;
            else
                return false;
        }
        protected void Success_Click(object sender, EventArgs e)
        {
            int status = 3;
            var button = (IButtonControl)sender;
            // grab the id from CommandArgument property
            int id = Convert.ToInt32(button.CommandArgument, CultureInfo.InvariantCulture);
            // call stored procedure based on id
            // call stored procedure based on id
            orderDAO = new OrderDAO();
            if (orderDAO.updateStatusOrder(id, status))
            {
                Response.Redirect("management-list-order.aspx");
            }

        }
        protected bool ShowButtonSuccess(Object DataItem)
        {
            //Here you can place as many conditions as you like 
            //Provided you always return either true or false
            if ((string)DataItem == "2")
                return true;
            else
                return false;
        }
        protected void Pay_Click(object sender, EventArgs e)
        {
            int status = 4;
            var button = (IButtonControl)sender;
            // grab the id from CommandArgument property
            int id = Convert.ToInt32(button.CommandArgument, CultureInfo.InvariantCulture);
            // call stored procedure based on id
            // call stored procedure based on id
            orderDAO = new OrderDAO();
            if (orderDAO.updateStatusOrder(id, status))
            {
                Response.Redirect("management-list-order.aspx");
            }

        }
        protected bool ShowButtonPay(Object DataItem)
        {
            //Here you can place as many conditions as you like 
            //Provided you always return either true or false
            if ((string)DataItem == "3")
                return true;
            else
                return false;
        }

    }
}