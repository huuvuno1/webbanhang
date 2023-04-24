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
    public partial class product_detail : System.Web.UI.Page
    {
        ProductDAO productDAO= new ProductDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (string.IsNullOrEmpty(id))
            {
                Response.Redirect("/index.aspx");
            }

            Product product = productDAO.getProductById(id);
            price.InnerText = Util.FormatVND(product.Price);
            productName.InnerText = product.Name;
            product_id.Value = product.Id.ToString();

            //List<Cart> carts = (List<Cart>)Session["cart"];
            //Cart cart = carts.Find(x => x.Id == id);
            //if (cart != null)
            //{
            //    quantity.
            //}
        }
    }
}