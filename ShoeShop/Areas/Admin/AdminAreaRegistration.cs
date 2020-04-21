using System.Web.Mvc;

namespace ShoeShop.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Admin",
                "dark-board",
                new { action = "Index", controller = "DarkBoard", id = UrlParameter.Optional },
                new[] { "ShoeShop.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", controller = "DarkBoard", id = UrlParameter.Optional },
                new[] { "ShoeShop.Areas.Admin.Controllers" }
            );
        }
    }
}