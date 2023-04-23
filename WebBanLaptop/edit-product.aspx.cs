using System;
using System.Collections.Generic;
using System.IO;
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

                            var images = productDAO.getImageByProductId(id);
                            List<ListItem> files = new List<ListItem>();
                            foreach (var image in images)
                            {
                                string fileName = image.Path;
                                files.Add(new ListItem(fileName, "~/assets/images/" + fileName));
                            }
                            RepeaterImages.DataSource = files;
                            RepeaterImages.DataBind();

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
                if (UploadImages.HasFiles)
                {
                    productDAO.deleteImages(id);
                    foreach (HttpPostedFile uploadedFile in UploadImages.PostedFiles)
                    {
                        uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/assets/images/"), uploadedFile.FileName));
                        string path = uploadedFile.FileName;
                        productDAO.insertImages(Convert.ToInt32(id), path);
                    }
                }
                Response.Redirect("management-list-product.aspx");
            }
        }
    }
}