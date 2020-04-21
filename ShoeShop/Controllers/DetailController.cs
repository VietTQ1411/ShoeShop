using ShopDao.Dao;
using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeShop.Controllers
{
    public class DetailController : Controller
    {
        // GET: Detail
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Detail(int id)
        {
            SearchTypeDao dao = new SearchTypeDao();
            Product list = new ProductDao().getOneById(id);
            ViewBag.Category = dao.getBrandByID(list.CategoryID);
            ViewBag.Style = dao.GetProductCategoryByID(list.TypeID);
            ViewBag.Color = dao.GetColorByID(list.Color);
            return View(list);
        }
    }
}