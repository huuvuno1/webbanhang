using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;
using WebBanLaptop.Utils;

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
                        brand.DataSource = Constant.Brands.Select(x => new { Value = x });
                        brand.DataBind();
                        var product = productDAO.getProductById(id);
                        if (product != null)
                        {
                            name.Text = product.Name;
                            price.Text = Convert.ToString(product.Price);
                            quantity.Text = Convert.ToString(product.Quantity);
                            description.InnerText = product.Description;
                            oldPrice.Text = Convert.ToString(product.OldPrice);
                            cpu.Text = product.Cpu;
                            ram.Text = product.Ram;
                            hardDrive.Text = product.Gpu;
                            weight.Text = Convert.ToString(product.Weight);
                            screen.Text = product.Screen;
                            type.Text = product.Type;
                            brand.SelectedValue = product.Brand;
                            imageReview.ImageUrl = "~/assets/images/" + product.Image;
                            imageReview.DataBind();
                            imageReview.Height = 70;

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
            string nameProduct = name.Text;
            int priceProduct = Int32.Parse(price.Text);
            int quantityProduct = Int32.Parse(quantity.Text);
            string descriptionProduct = Request.Form["description"];
            string brandProduct = brand.SelectedValue;
            int oldprice = Int32.Parse(oldPrice.Text);
            string CPU = cpu.Text;
            string RAM = ram.Text;
            string HardDrive = hardDrive.Text;
            float Weight = float.Parse(weight.Text, CultureInfo.InvariantCulture);
            string Screen = screen.Text;
            string Type = type.Text;
            string img_title = Path.GetFileName(imageReview.ImageUrl);
            if (FileUploadTitle.HasFile)
            {
                img_title = Path.GetFileName(FileUploadTitle.PostedFile.FileName);
                FileUploadTitle.PostedFile.SaveAs(Server.MapPath("~/assets/images/") + img_title);
            }

            bool check = productDAO.updateProduct(id, nameProduct, priceProduct, quantityProduct,
                descriptionProduct, brandProduct, oldprice, CPU, RAM, HardDrive, Weight, Screen, Type, img_title);
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