﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;

namespace WebBanLaptop
{
    public partial class add_product : System.Web.UI.Page
    {
        private ProductDAO productDAO;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["admin"])
            {
                return;
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }

        protected void Add_Click(object sender, EventArgs e)
        {
            productDAO = new ProductDAO();
            int categoryId = Int32.Parse(category.SelectedValue);
            string nameProduct = name.Text;
            string slugName = ToStringSlug(nameProduct);
            int priceProduct = Int32.Parse(price.Text);
            int quantityProduct = Int32.Parse(quantity.Text);
            string descriptionProduct = Request.Form["description"];

            bool check = productDAO.insertProduct(categoryId, nameProduct, slugName, priceProduct, quantityProduct,descriptionProduct);
            if (check)
            {
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