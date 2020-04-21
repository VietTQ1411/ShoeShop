using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ShoeShop
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //Dark board 
            routes.MapRoute(
                name: "Admin dark board",
                url: "dark-board",
                defaults: new { controller = "DarkBoard", action = "Index", id = UrlParameter.Optional },
                new[] { "ShoeShop.Areas.Admin.Controllers" }
            );

            //Đăng xuất
            routes.MapRoute(
                name: "log out",
                url: "log-out",
                defaults: new { controller = "Login", action = "LogOut", id = UrlParameter.Optional },
                new[] { "ShoeShop.Controllers" }
            );

            //Tạo mới tài khoản
            routes.MapRoute(
                name: "create account",
                url: "create",
                defaults: new { controller = "Login", action = "Create", id = UrlParameter.Optional },
                new[] { "ShoeShop.Controllers" }
            );

            //Take bill
            routes.MapRoute(
                name: "billing",
                url: "billing",
                defaults: new { controller = "Order", action = "Order", id = UrlParameter.Optional },
               new[] { "ShoeShop.Controllers" }
            );

            //Order hàng
            routes.MapRoute(
                name: "check out",
                url: "check-out",
                defaults: new { controller = "Order", action = "Index", id = UrlParameter.Optional },
               new[] { "ShoeShop.Controllers" }
            );

            //Thêm giỏ hàng
            routes.MapRoute(
                name: "Add Cart",
                url: "them-gio-hang",
                defaults: new { controller = "Cart", action = "AddCart", id = UrlParameter.Optional },
               new[] { "ShoeShop.Controllers" }
            );

            //Trang tìm kiếm
            routes.MapRoute(
                name: "Search",
                url: "search",
                defaults: new { controller = "Search", action = "Index", id = UrlParameter.Optional },
                new[] { "ShoeShop.Controllers" }
            );

            //Trang Contact
            routes.MapRoute(
                name: "Contact",
                url: "contact",
                defaults: new { controller = "About", action = "Contact", id = UrlParameter.Optional },
                new[] { "ShoeShop.Controllers" }
            );

            //Trang About
            routes.MapRoute(
                name: "About",
                url: "about",
                defaults: new { controller = "About", action = "Index", id = UrlParameter.Optional },
                new[] { "ShoeShop.Controllers" }
            );

            //Trang Men Page
            routes.MapRoute(
                name: "Men page",
                url: "men",
                defaults: new { controller = "Gender", action = "Men", id = UrlParameter.Optional },
                new[] { "ShoeShop.Controllers" }
            );

            //Trang Women Page
            routes.MapRoute(
                name: "Women page",
                url: "women",
                defaults: new { controller = "Gender", action = "Women", id = UrlParameter.Optional },
                new[] { "ShoeShop.Controllers" }
            );

            //Chi tiết sản phẩm
            routes.MapRoute(
                name: "Product Detail",
                url: "san-pham/{id}",
                defaults: new { controller = "Detail", action = "Detail", id = UrlParameter.Optional },
                new[] { "ShoeShop.Controllers" }
            );

            //Trang chủ
            routes.MapRoute(
                name: "Home Page",
                url: "home",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                new[] { "ShoeShop.Controllers" }
            );

            //Defaulf page
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                new[] { "ShoeShop.Controllers" }
            );
        }
    }
}
