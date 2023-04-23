using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;

namespace WebBanLaptop
{
    public partial class delete_product : System.Web.UI.Page
    {
        private ProductDAO productDAO;

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["admin"])
            {
                if (!Page.IsPostBack)
                {
                    productDAO = new ProductDAO();
                    string id = Request.QueryString["id"];
                    productDAO.deleteProduct(id);
                    
                        Response.Redirect("management-list-product.aspx");
                    


                    

                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
            
        }
    }
}