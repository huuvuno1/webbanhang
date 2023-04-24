using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;

namespace WebBanLaptop
{
    public partial class product_detail : System.Web.UI.Page
    {

        ProductDAO productDAO = new ProductDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            var data = productDAO.getProductById(id);
            price.InnerText = data.Price.ToString()+"Đ";
            priceModal.InnerText = data.Price.ToString();
            oldPrice.InnerText = data.OldPrice.ToString()+"Đ";
            name.InnerText = data.Name.ToString();
            nameHeaderModal.InnerText = data.Name.ToString();
            nameModal.InnerText = data.Name.ToString();
            cpu.InnerText = data.Cpu.ToString();
            ram.InnerText = data.Ram.ToString();
            gpu.InnerText = data.Gpu.ToString();
            screen.InnerText = data.Screen.ToString();
            Image.ImageUrl = data.Image.ToString();
            ImageDetail.ImageUrl = data.Image.ToString();
            ImageDetail2.ImageUrl = data.Image.ToString();

        }
    }
}