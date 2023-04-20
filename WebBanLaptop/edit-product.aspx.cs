using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;

namespace WebBanLaptop
{
    public partial class edit_product : System.Web.UI.Page
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
                    if (id != null)
                    {
                        var product = productDAO.getProductById(id);
                        if (product != null)
                        {
                            category.SelectedValue = Convert.ToString(product.CategoryId);
                            name.Text = product.Name;
                            price.Text = Convert.ToString(product.Price);
                            quantity.Text = Convert.ToString(product.Quantity);
                            description.InnerText= product.Description;

                        }
                        else
                        {
                            Response.StatusCode = 404;
                        }
                    }
                    else
                    {
                        Response.Redirect("management-list-product.aspx");
                    }

                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            productDAO = new ProductDAO();
            string id = Request.QueryString["id"];
            int categoryId = Int32.Parse(category.SelectedValue);
            string nameProduct = name.Text;
            int priceProduct = Int32.Parse(price.Text);
            int quantityProduct = Int32.Parse(quantity.Text);
            string descriptionProduct = Request.Form["description"];
            bool check = productDAO.updateProduct(id, categoryId, nameProduct, priceProduct, quantityProduct, descriptionProduct);
            if (check)
            {
                Response.Redirect("management-list-product.aspx");
            }
            else
            {
                form1.InnerText = "lỗi!";
            }
        }
    }
}