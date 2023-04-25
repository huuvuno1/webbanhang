using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;
using WebBanLaptop.Utils;

namespace WebBanLaptop
{
    public partial class add_product : System.Web.UI.Page
    {
        private ProductDAO productDAO;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["admin"])
            {
                if (!Page.IsPostBack)
                {
                    brand.DataSource = Constant.Brands.Select(x => new { Value = x });
                    brand.DataBind();
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }

        protected void Add_Click(object sender, EventArgs e)
        {
            productDAO = new ProductDAO();
            string nameProduct = name.Text;
            string slugName = ToStringSlug(nameProduct);
            int priceProduct = Int32.Parse(price.Text);
            int quantityProduct = Int32.Parse(quantity.Text);
            string descriptionProduct = Request.Form["description"];
            string brandProduct = brand.SelectedValue;
            int oldprice = Int32.Parse(oldPrice.Text);
            string CPU = cpu.Text;
            string RAM = ram.Text;
            string HardDrive = hardDrive.Text;
            float Weight = float.Parse(weight.Text);
            string Screen = screen.Text;
            string Type = type.Text;
            string img_title ="";
            if(FileUploadTitle.HasFile)
            {
                img_title = Path.GetFileName(FileUploadTitle.PostedFile.FileName);
                FileUploadTitle.PostedFile.SaveAs(Server.MapPath("~/assets/images/") + img_title);
            }    

            int product_id = productDAO.insertProduct(nameProduct, slugName, priceProduct, quantityProduct, descriptionProduct, brandProduct, oldprice, CPU, RAM, HardDrive, Weight, Screen, Type, img_title);
            if (product_id > 0)
            {

                if (UploadImages.HasFiles)
                {
                    foreach (HttpPostedFile uploadedFile in UploadImages.PostedFiles)
                    {
                        uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/assets/images/"), uploadedFile.FileName));
                        listofuploadedfiles.Text += String.Format("{0}<br />", uploadedFile.FileName);
                        string path = uploadedFile.FileName;
                        productDAO.insertImages(product_id, path);
                    }
                }
                Response.Redirect("management-list-product.aspx");
            }
        }
        public static string ToStringSlug(string value)
        {

            //First to lower case
            value = value.ToLowerInvariant();

            //Remove all accents
            var bytes = Encoding.GetEncoding("Cyrillic").GetBytes(value);
            value = Encoding.ASCII.GetString(bytes);

            //Replace spaces
            value = Regex.Replace(value, @"\s", "-", RegexOptions.Compiled);

            //Remove invalid chars
            value = Regex.Replace(value, @"[^a-z0-9\s-_]", "", RegexOptions.Compiled);

            //Trim dashes from end
            value = value.Trim('-', '_');

            //Replace double occurences of - or _
            value = Regex.Replace(value, @"([-_]){2,}", "$1", RegexOptions.Compiled);

            return value;
        }
    }
}