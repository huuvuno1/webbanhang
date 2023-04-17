using LaptopWeb.Models;
using LaptopWeb.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace LaptopWeb.Controllers
{
    public class AuthController: Controller
    {
        private LaptopWebEntity db = new LaptopWebEntity();
        // GET: Auth/Login
        public ActionResult Login()
        {
            return View("Login");
        }

        //POST: Auth/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel loginViewModel)
        {
            if (ModelState.IsValid)
            {
                var matchedUser = db.TblUsers.SingleOrDefault(user => user.username == loginViewModel.username && user.password == loginViewModel.password);


                if (matchedUser != null)
                {
                    Session["Id"] = matchedUser.id;
                    Session["Fullname"] = matchedUser.fullname;
                    Session["Username"] = matchedUser.username;
                    Session["Role"] = matchedUser.role;
                    ViewBag.ID = matchedUser.id;
                    
                    if (matchedUser.role == 2)
                    {
                        return RedirectToAction("HomeAdmin", "Admin");
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ViewBag.ErrorMessage = "Sai tài khoản / Mật khẩu";
                    return View();
                }


            }
            return View();
        }

        //GET : Auth/Register
        public ActionResult Register()
        {
            return View("Register");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterViewModel registerViewModel)
        {
            if (ModelState.IsValid)
            {
                var checkUsername = db.TblUsers.SingleOrDefault(user => user.username == registerViewModel.username);
                if(checkUsername == null)
                {
                    tbl_user newUser = new tbl_user();
                    newUser.fullname = registerViewModel.fullname;
                    newUser.username = registerViewModel.username;
                    newUser.password = registerViewModel.password;
                    newUser.role = 1;
                    db.TblUsers.Add(newUser);
                    db.SaveChangesAsync();

                    ViewBag.SuccessMessage = "Đăng ký tài khoản thành công!";
                    return View();
                }
                else
                {
                    ViewBag.ErrorMessage = $"Tài khoản {checkUsername.username} đã tồn tại trên hệ thống, vui lòng kiểm tra lại!";
                    return View();
                }
            }
            return View();
        }
    }
}