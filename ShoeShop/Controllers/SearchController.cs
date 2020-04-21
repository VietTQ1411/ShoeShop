using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShoeShop.App_Start;
using ShopDao.Dao;
using ShopDao.EF;

namespace ShoeShop.Controllers
{
    public class SearchController : Controller
    {
        // GET: Search
        public ActionResult Index(int page = 1, int pageSize = 9)
        {
            int totalRecord = 0;
            //get content menu
            SearchTypeDao dao = new SearchTypeDao();
            ViewBag.Category = dao.GetCategories();
            ViewBag.Color = dao.GetColors();
            ViewBag.ProductCategory = dao.GetProductCategories();
            ViewBag.Size = dao.GetVs();

            //search product
            List<Product> list = GetProducts(page, pageSize,ref totalRecord);

            //Paging 
            int total = (int)(Math.Ceiling((double)totalRecord / pageSize));
            ViewBag.MaxPage = 5;
            ViewBag.totalPage = total;
            ViewBag.page = page;
            ViewBag.First = 1;
            ViewBag.next = page + 1;
            ViewBag.prev = page - 1;
         
            
            return View(list);
        }


        /// <summary>
        /// 
        /// Get Product for search 
        /// 
        /// </summary>
        /// <returns></returns>
        private List<Product> GetProducts(int page,int pageSize,ref int totalRecord)
        { 

            int? size;
            int? color;
            int? brand;
            int? style;
            string name = (string)Session[Constrain.Search_name];
            //get size
            if (Session[Constrain.Search_size] == null)
            {
                size = null;
            }
            else
            {
                size = (int)Session[Constrain.Search_size];
            }
            //get brand
            if (Session[Constrain.Search_brand] == null)
            {
                brand = null;
            }
            else
            {
                brand = (int)Session[Constrain.Search_brand];
            }
            //get color
            if (Session[Constrain.Search_color] == null)
            {
                color = null;
            }
            else
            {
                color = (int)Session[Constrain.Search_color];
            }
            //get style
            if (Session[Constrain.Search_style] == null)
            {
                style = null;
            }
            else
            {
                style = (int)Session[Constrain.Search_style];
            }

            return new ProductDao().SearchProducts(page,pageSize,ref totalRecord,name,brand,color,size,style);
        }

        public ActionResult Name(string name)
        {
            if (String.IsNullOrEmpty(name))
            {
                Session[Constrain.Search_name] = null;
            }
            else
            {
                Session[Constrain.Search_name] = name;
            }

            return RedirectToAction("Index", "Search");
        }

        public ActionResult Brand(int id)
        {
            if (id <= 0)
            {
                Session[Constrain.Search_brand] = null;
            }
            else
            {
                Session[Constrain.Search_brand] = id;
            }

            return RedirectToAction("Index", "Search");
        }

        public ActionResult Color(int id)
        {
            if (id <= 0)
            {
                Session[Constrain.Search_color] = null;
            }
            else
            {
                Session[Constrain.Search_color] = id;
            }

            return RedirectToAction("Index", "Search");
        }

        public ActionResult Size(int id)
        {
            if (id <= 0)
            {
                Session[Constrain.Search_size] = null;
            }
            else
            {
                Session[Constrain.Search_size] = id;
            }

            return RedirectToAction("Index", "Search");
        }

        public ActionResult Style(int id)
        {
            if (id <= 0)
            {
                Session[Constrain.Search_style] = null;
            }
            else
            {
                Session[Constrain.Search_style] = id;
            }

            return RedirectToAction("Index", "Search");
        }
    }
}