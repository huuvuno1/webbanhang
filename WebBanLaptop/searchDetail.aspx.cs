using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;

namespace WebBanLaptop
{
    public partial class searchDetail : System.Web.UI.Page
    {
        private ProductDAO productDAO = new ProductDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            string valueSearch = Request.QueryString["search"];
            var pageable = productDAO.getProductByName(valueSearch);
            RepeaterProductSearch.DataSource = pageable;
            RepeaterProductSearch.DataBind();
        }
    }
}