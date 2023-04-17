using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace LaptopWeb.ViewModels
{
    public class CategoryViewModel
    {
        public int id { get; set; }

        [Display(Name = "TÊN LOẠI")]
        [Required(ErrorMessage = "Vui lòng nhập tên loại sản phẩm!")]
        public string name { get; set; }
    }
}