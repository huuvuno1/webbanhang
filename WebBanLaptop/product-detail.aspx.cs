using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;
using WebBanLaptop.Model;
using WebBanLaptop.Utils;

namespace WebBanLaptop
{
    public partial class product_detail : System.Web.UI.Page
    {

        ProductDAO productDAO = new ProductDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (string.IsNullOrEmpty(id))
            {
                Response.Redirect("/index.aspx");
            }

            var data = productDAO.getProductById(id);
            price.InnerText = data.Price.ToString()+"Đ";
            oldPrice.InnerText = data.OldPrice.ToString()+"Đ";
            name.InnerText = data.Name.ToString();
            cpu.InnerText = data.Cpu.ToString();
            ram.InnerText = data.Ram.ToString();
            gpu.InnerText = data.Gpu.ToString();
            screen.InnerText = data.Screen.ToString();
            cpu1.InnerText = data.Cpu.ToString();
            ram1.InnerText = data.Ram.ToString();
            gpu1.InnerText = data.Gpu.ToString();
            screen1.InnerText = data.Screen.ToString();
            ImageDetail.ImageUrl = data.Image.ToString();
            ImageDetail2.ImageUrl = data.Image.ToString();
            title.InnerText = data.Name;
            

            Product product = productDAO.getProductById(id);
            price.InnerText = Util.FormatVND(product.Price);
            productName.InnerText = product.Name;
            product_id.Value = product.Id.ToString();
        }
    }
}