using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LaptopWeb.ViewModels
{
    public class LoginViewModel
    {
        [Display(Name = "TÊN ĐĂNG NHẬP")]
        [Required(ErrorMessage = "Vui lòng nhập tên đăng nhập!")]
        public string username { get; set; }
        
        [Display(Name = "MẬT KHẨU")]
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu!")]
        public string password { get; set; }
        
    }
}