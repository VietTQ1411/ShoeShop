using ShoeShop.App_Start;
using ShopDao.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeShop.Controllers
{
    public class AboutController : Controller
    {
        /// <summary>
        /// 
        /// Get about page
        /// 
        /// 
        /// </summary>
        /// <returns></returns>
        // GET: About
        public ActionResult Index()
        {
            return View();
        }


        /// <summary>
        /// 
        /// 
        /// Get Contact 
        /// 
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Contact()
        {
            ContactDao contact = new ContactDao();
            ViewBag.location = contact.GetContactByType(Constrain.Type_Location_Contact).Content;
            ViewBag.phone = contact.GetContactByType(Constrain.Type_Phone_Contact).Content; ;
            ViewBag.email = contact.GetContactByType(Constrain.Type_Email_Contact).Content; ;
            ViewBag.site = contact.GetContactByType(Constrain.Type_site_Contact).Content; ;
            return View();
        }
    }
}