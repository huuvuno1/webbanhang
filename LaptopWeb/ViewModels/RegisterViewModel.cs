using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace LaptopWeb.ViewModels
{
    public class RegisterViewModel
    {
        [Display(Name = "HỌ TÊN")]
        [MaxLength(20)]
        [Required(ErrorMessage = "Nhập họ và tên")]
        public string fullname { get; set; }

        [Display(Name = "TÊN ĐĂNG NHẬP")]
        [Required(ErrorMessage = "Vui lòng nhập tên đăng nhập!")]
        public string username { get; set; }

        [Display(Name = "MẬT KHẨU")]
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu!")]
        public string password { get; set; }

        [Display(Name = "XÁC NHẬN MẬT KHẨU")]
        [Required(ErrorMessage = "Vui lòng nhập lại mật khẩu")]
        [Compare("password", ErrorMessage = "Mật khẩu không trùng khớp")]
        public string confirmPassword { get; set; }
    }
}