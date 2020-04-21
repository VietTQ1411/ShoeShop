using ShopDao.Dao;
using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeShop.Controllers
{
    public class GenderController : Controller
    {
        // GET: Gender
        public ActionResult Men()
        {
            List<Product> list = new ProductDao().getAll();
            return View(list);
        }

        public ActionResult Women()
        {
            List<Product> list = new ProductDao().getAll();
            return View(list);
        }
    }
}