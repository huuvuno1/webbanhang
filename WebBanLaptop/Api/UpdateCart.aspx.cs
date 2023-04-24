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
    public partial class UpdateCart : System.Web.UI.Page
    {
        ProductDAO productDAO = new ProductDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Cart> carts = (List<Cart>)Session["cart"];

            // method == post -> update cart, nguược lại get card
            if (Request.HttpMethod == "POST") 
            { 
                string id = Request.Form["product_id"];
                int quantity = int.Parse(Request.Form["quantity"]);
                Product product = productDAO.getProductById(id);


                // nếu số lượng gửi lên == 0 thì remove sản phẩm khỏi cart
                if (quantity == 0)
                {
                    carts = carts.FindAll(x => x.Id != id);
                } 
                else
                {
                    // nếu trong card đã có sản phẩm thì update tiền, số lượng và ngược lại
                    Cart cart = carts.Find(x => x.Id == id);
                    if (cart != null)
                    {
                        cart.Quantity = quantity;
                        cart.Price = product.Price;
                        cart.TotalPrice = quantity * product.Price;
                    }
                    else
                    {
                        cart = new Cart();
                        cart.Id = id;
                        cart.Quantity = quantity;
                        cart.Price = product.Price;
                        cart.TotalPrice = quantity * product.Price;
                        cart.Name = product.Name;
                        carts.Add(cart);
                    }
                }

                
                // cập nhật lại session
                Session["cart"] = carts;
            }
            RepeaterProductCart.DataSource = carts;
            RepeaterProductCart.DataBind();

            txtCount.InnerText = carts.Aggregate(0, (prev, curr) => prev + curr.Quantity).ToString();
            totalMoney.InnerText = Util.FormatVND(carts.Aggregate(0, (prev, curr) => curr.TotalPrice + prev));
        }
    }
}