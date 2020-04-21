using ShoeShop.App_Start;
using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeShop.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            var ses = (User)Session[Constrain.User_Session];
            if (ses == null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(
                    new { Controller = "Login", Action = "Index"}));
            }
            else if(ses.Type!=0)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(
                    new { Controller = "Home", Action = "Index"}));
            }
            base.OnActionExecuting(filterContext);
        }
    }
}