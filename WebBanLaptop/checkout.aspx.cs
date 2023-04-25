using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;
using WebBanLaptop.Model;
using WebBanLaptop.Utils;

namespace WebBanLaptop
{
    public partial class checkout : System.Web.UI.Page
    {
        OrderDAO orderDAO = new OrderDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Cart> carts = (List<Cart>)Session["cart"];
                RepeaterProducts.DataSource = carts;
                RepeaterProducts.DataBind();

                sum_money.InnerText = Util.FormatVND(carts.Aggregate(0, (prev, curr) => curr.TotalPrice + prev)) + " ₫";
                count.InnerText = carts.Aggregate(0, (prev, curr) => prev + curr.Quantity).ToString();
            }
            
        }

        protected void BtnOrderSubmit_Click(object sender, EventArgs e)
        {
            List<Cart> carts = (List<Cart>)Session["cart"];
            if (carts.Count == 0)
            {
                Response.Redirect("/index.aspx");
            }

            string email = Request.Form["email"];
            string fullname = Request.Form["fullname"];
            string phoneNumber = Request.Form["phoneNumber"];
            string address = Request.Form["address"];
            string note = Request.Form["note"];
            Order order = new Order()
            {
                Address = address,
                Email = email,
                CustomerName= fullname,
                NumberPhone=phoneNumber,
                Note=note,
            };

            orderDAO.createOrder(ref order, carts);

            Response.Redirect("/order_lookup?order_id=AA500BB" + order.Id);
        }
    }
}