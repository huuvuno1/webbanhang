using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace LaptopWeb.ViewModels
{
    public class ProductViewModel
    {
        [Display(Name = "TÊN SẢN PHẨM")]
        [Required(ErrorMessage = "Vui lòng nhập tên sản phẩm!")]
        public string name { get; set; }

        [Display(Name = "PHÂN LOẠI SẢN PHẨM")]
        [Required(ErrorMessage = "Vui lòng chọn phân loại!")]
        public string category { get; set; }
    }
}