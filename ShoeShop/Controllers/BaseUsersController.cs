using ShoeShop.App_Start;
using ShoeShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeShop.Controllers
{
    public class BaseUsersController : Controller
    {

        /// <summary>
        /// 
        /// Base for page request Account
        /// 
        /// 
        /// </summary>
        /// <param name="filterContext"></param>
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            var ses = (ShopDao.EF.User)Session[Constrain.User_Session];
            if (ses == null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(
                    new { Controller = "Login", Action = "Index" }));
            }
            base.OnActionExecuting(filterContext);
        }

        /// <summary>
        /// 
        /// Create Alert
        /// 
        /// </summary>
        /// <param name="message"></param>
        /// <param name="type"></param>
        protected void setAlert(string message, string type)
        {
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertType"] = "alert-success";
            }
            else if (type == "warning")
            {
                TempData["AlertType"] = "alert-warning";
            }
            else if (type == "error")
            {
                TempData["AlertType"] = "alert-danger";
            }
        }

    }
}