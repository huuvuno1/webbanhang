using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanLaptop.Utils;

namespace WebBanLaptop
{
    public partial class category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RepeaterBrand.DataSource = Constant.Brands.Select(x => new { Value = x });
            RepeaterBrand.DataBind();
        }
    }
}