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
    public partial class index : System.Web.UI.Page
    {
        ProductDAO productDAO = new ProductDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            RepeaterBrand.DataSource = Constant.Brands2;
            RepeaterBrand.DataBind();

            RepeaterPriceRange.DataSource = Constant.PriceRange;
            RepeaterPriceRange.DataBind();

            RepeaterProductNew.DataSource = productDAO.filterProducts("laptop-moi", null, null, null, 1, 5).Products;
            RepeaterProductNew.DataBind();

            RepeaterProductGaming.DataSource = productDAO.filterProducts("laptop-gaming", null, null, null, 1, 5).Products;
            RepeaterProductGaming.DataBind();

            RepeaterProductGraphics.DataSource = productDAO.filterProducts("laptop-do-hoa", null, null, null, 1, 5).Products;
            RepeaterProductGraphics.DataBind();
        }
    }
}