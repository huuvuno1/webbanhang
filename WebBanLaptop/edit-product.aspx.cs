using System;
using System.Collections.Generic;
using System.Globalization;
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
                            brand.Text = product.Brand;
                            oldPrice.Text = Convert.ToString(product.OldPrice);
                            cpu.Text = product.CPU;
                            ram.Text = product.RAM;
                            hardDrive.Text = product.HardDrive;
                            weight.Text = Convert.ToString(product.Weight);
                            screen.Text = product.Screen;
                            type.Text = product.Type;

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
            int id = Int32.Parse(Request.QueryString["id"]);
            int categoryId = Int32.Parse(category.SelectedValue);
            string nameProduct = name.Text;
            int priceProduct = Int32.Parse(price.Text);
            int quantityProduct = Int32.Parse(quantity.Text);
            string descriptionProduct = Request.Form["description"];
            string brandProduct = brand.Text;
            float oldprice = float.Parse(oldPrice.Text, CultureInfo.InvariantCulture);
            string CPU = cpu.Text;
            string RAM = ram.Text;
            string HardDrive = hardDrive.Text;
            float Weight = float.Parse(weight.Text, CultureInfo.InvariantCulture);
            string Screen = screen.Text;
            string Type = type.Text;

            bool check = productDAO.updateProduct(id, nameProduct, categoryId, priceProduct, quantityProduct, 
                descriptionProduct, brandProduct, oldprice, CPU, RAM, HardDrive, Weight, Screen, Type);
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