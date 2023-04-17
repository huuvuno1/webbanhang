using LaptopWeb.Models;
using LaptopWeb.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace LaptopWeb.Controllers
{
    public class AdminController: Controller
    {
        private LaptopWebEntity db = new LaptopWebEntity();
        public ActionResult HomeAdmin()
        {
             return View(db.Tbl_Products.ToList().OrderBy(n => n.id));
        }

        
        public ActionResult ListCategory()
        {
            return View(db.Tbl_Categories.ToList().OrderBy(n => n.id));
        }

        public ActionResult CreateCategory ()
        {
            return View("CreateCategory");
        }

        [HttpPost]
        public ActionResult CreateCategory(CategoryViewModel categoryViewModel)
        {
            if (ModelState.IsValid)
            {
                    tbl_category newCategory = new tbl_category();
                    newCategory.name = categoryViewModel.name;
                    db.Tbl_Categories.Add(newCategory);
                    db.SaveChangesAsync();

                    ViewBag.SuccessMessage = "Thêm thành công!";
                    return RedirectToAction("ListCategory", "Admin");
            }
            return View();
        }
        [HttpGet]
        public ActionResult EditCategory(int id)
        {
            var category = db.Tbl_Categories.Where(x => x.id == id).FirstOrDefault();
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        [HttpPost]
        public ActionResult EditCategory(tbl_category category)
        {
            if (ModelState.IsValid)
            {
                var cat = db.Tbl_Categories.Where(s => s.id == category.id).FirstOrDefault();
                cat.name = category.name;
                db.SaveChanges();

                ViewBag.SuccessMessage = "Thêm thành công!";
                return RedirectToAction("ListCategory", "Admin");
            }
            return View();
        }
    }
}