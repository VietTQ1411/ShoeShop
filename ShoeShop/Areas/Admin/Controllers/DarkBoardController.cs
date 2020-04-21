using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeShop.Areas.Admin.Controllers
{
    public class DarkBoardController : BaseController
    {
        // GET: Admin/DarkBoard
        public ActionResult Index()
        {
            return View();
        }
    }
}