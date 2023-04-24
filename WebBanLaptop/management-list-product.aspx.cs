﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.DAO;
using WebBanLaptop.Model;

namespace WebBanLaptop
{
    public partial class management_list_product : System.Web.UI.Page
    {
        private ProductDAO productDAO;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["admin"])
            {
                if (!Page.IsPostBack)
                {
                    productDAO = new ProductDAO();
                    GridView1.DataSource = productDAO.getProducts();
                    GridView1.DataBind();
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
            
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            productDAO = new ProductDAO();
            GridView1.DataSource = productDAO.getProducts();
            GridView1.DataSource = productDAO.getProducts();
            GridView1.DataBind();

        }
    }
}