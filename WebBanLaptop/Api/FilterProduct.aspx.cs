using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;

namespace WebBanLaptop.Api
{
    public partial class FilterProduct : System.Web.UI.Page
    {
        private ProductDAO productDAO = new ProductDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            string priceRange = Request.QueryString["priceRange"];
            string sortBy = Request.QueryString["sortBy"];
            string limit = Request.QueryString["limit"];
            string brands = Request.QueryString["brands"];
            if (String.IsNullOrEmpty(limit))
            {
                limit = "20";
            }
            var list = productDAO.filterProducts(priceRange, brands, int.Parse(limit), sortBy);
            productsRepeater.DataSource = list;
            productsRepeater.DataBind();
        }
    }
}