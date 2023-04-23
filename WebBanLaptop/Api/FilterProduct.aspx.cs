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
            string type = Request.QueryString["type"];
            string priceRange = Request.QueryString["priceRange"];
            string sortBy = Request.QueryString["sortBy"];
            string brands = Request.QueryString["brands"];
            string pageNum = Request.QueryString["pageNum"];
            string pageSize = Request.QueryString["pageSize"];
            if (String.IsNullOrEmpty(pageSize))
            {
                pageSize = "20";
            }

            if (String.IsNullOrEmpty(pageNum))
            {
                pageNum= "1";
            }
            var pageable = productDAO.filterProducts(type, priceRange, brands, sortBy, int.Parse(pageNum), int.Parse(pageSize));
            productsRepeater.DataSource = pageable.Products;
            productsRepeater.DataBind();


            List<object> pageNumbers = new List<object>();
            for (int i = 1; i <= pageable.Total/ int.Parse(pageSize) + 1; i++)
            {
                pageNumbers.Add(new
                {
                    pageNumber = i,
                });
            }
            RepeaterPaging.DataSource = pageNumbers;
            RepeaterPaging.DataBind();
        }
    }
}