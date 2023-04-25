using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;

namespace WebBanLaptop.Api
{
    public partial class getLaptop : System.Web.UI.Page
    {
        private ProductDAO productDAO = new ProductDAO();




        protected void Page_Load(object sender, EventArgs e)
        {
            string type = Request.QueryString["type"];


            var pageable = productDAO.getProductByName(type);
            productsRepeater.DataSource = pageable;
            productsRepeater.DataBind();

        }
    }
}