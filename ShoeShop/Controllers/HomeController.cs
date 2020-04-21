using ShopDao.Dao;
using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeShop.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home

        public ActionResult Index()
        {
            List<Product> list = new ProductDao().listTop(12);
            return View(list);
        }

        [ChildActionOnly]
        public ActionResult Slider()
        {
            var model = new SliderDao().getAll();
            return PartialView(model);
        }
        public JsonResult QuickView(int id)
        {
            var Product = new ProductDao().getOneById(id);
            return Json(new
            {
                id = Product.ID,
                name = Product.Name,
                Image = Product.Image,
                price = Product.Price,
                sale = Product.PromotionPrice==null?null: Product.PromotionPrice,
                description = Product.Description
            });
        }
      
    }
}