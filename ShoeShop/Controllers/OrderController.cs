using ShoeShop.App_Start;
using ShoeShop.Models;
using ShopDao.Dao;
using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeShop.Controllers
{
    public class OrderController : BaseUsersController
    {
        /// <summary>
        /// Check and Go to Order Page
        /// If Cart not have any one so go to home and show dialog
        /// 
        /// </summary>
        /// <returns></returns>
        // GET: Order
        public ActionResult Index()
        {
            var cart = Session[Constrain.Cart_Session];
            if (cart != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        /// <summary>
        /// 
        /// Order of customer
        /// 
        /// 
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Order(OrderDetail order,string address2,string shiptosecond)
        {
            User user = (User)Session[Constrain.User_Session];
            OrderDetail orderDetail = new OrderDetail();
            OrderDao dao = new ShopDao.Dao.OrderDao();
            List<CartItem> cart =(List < CartItem > )Session[Constrain.Cart_Session];

            ///check data
            if (shiptosecond == null)
            {
                if(!((order.ShipName==user.Name)&&(order.ShipMobile == user.Phone)
                    &&(order.ShipEmail == user.Email) && (order.ShipAddress == user.Address)))
                {
                    ///update user
                }
            }
            else
            {
                if (String.IsNullOrEmpty(address2))
                {
                    ModelState.AddModelError("", "Second Address can't not be blank");
                    return View("Index");
                }
                else
                {
                    if (!((order.ShipName == user.Name) && (order.ShipMobile == user.Phone)
                    && (order.ShipEmail == user.Email) && (order.ShipAddress == user.Address)))
                    {
                        ///update user
                    }
                    order.ShipAddress = address2;
                }
            }

            order.CreateDate = DateTime.Now;
           //Create bill
            if ((Coupon)Session[Constrain.Coupon_Session] != null)
            {
                order.CouponID = ((Coupon)Session[Constrain.Coupon_Session]).ID;
            }

            int orderID = new OrderDetailDao().Insert(order);

            foreach (CartItem item in cart)
            {
                Order o = new Order()
                {
                    ProductID = item.Product.ID,
                    OrderID = orderID,
                    Price = (item.Product.Price - (item.Product.Price * item.Product.PromotionPrice / 100)),
                    Quantity = item.Quantity
                };
                dao.Insert(o);
            }

            Session[Constrain.Cart_Session] = null;
            return View("Success");
        }

        public ActionResult Success()
        {
            return View();
        }
    }
}