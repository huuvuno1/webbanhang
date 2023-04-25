using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;

namespace WebBanLaptop.Api
{
    public partial class Search : System.Web.UI.Page
    {
        private ProductDAO productDAO = new ProductDAO();


        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Request.QueryString["name"];
            if (String.IsNullOrEmpty(name))
            {
                Response.Write("");
                return;
            }
            
            var pageable = productDAO.getProductByName(name);
            searchRepeter.DataSource = pageable;
            searchRepeter.DataBind();
        }
    }
}