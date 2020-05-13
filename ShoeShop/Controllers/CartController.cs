using ShoeShop.App_Start;
using ShoeShop.Models;
using ShopDao.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeShop.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[Constrain.Cart_Session];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }

            return View(list);
        }
        

        /// <summary>
        /// 
        /// Thêm 1 Sản Phẩm vào trong giỏ hàng
        /// Nếu sản phẩm đã tồn tại thì tăng số lượng sản  phẩm
        /// 
        /// </summary>
        /// <param name="productID"></param>
        /// <param name="quantity"></param>
        /// <returns></returns>
        public ActionResult AddCart(int ID, int quantity)
        {
            var Product = new ProductDao().getOneById(ID);
            var cart = Session[Constrain.Cart_Session];
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.Product.ID == ID))
                {
                    foreach (CartItem i in list)
                    {
                        if (i.Product.ID == ID)
                        {
                            int total = i.Quantity + quantity;
                            if (total < Product.Quantity)
                            {
                                i.Quantity += quantity;
                            }
                            else
                            {
                                i.Quantity = Product.Quantity;
                            }
                            
                        }
                    }
                }
                else
                {
                    var item = new CartItem();
                    item.Product = Product;
                    item.Quantity = quantity;

                    list.Add(item);
                }
                Session[Constrain.Cart_Session] = list;

            }
            else
            {
                var item = new CartItem();
                item.Product = Product;
                item.Quantity = quantity;

                var list = new List<CartItem>();
                list.Add(item);

                Session[Constrain.Cart_Session] = list;
            }
            return RedirectToAction("Index");
        }

        /// <summary>
        /// 
        /// Sửa số lượng sản phẩm trong giỏ hàng
        /// nếu status == true và số lượng trong database còn thì tăng số lượng sản phẩm
        /// nếu status == false và số lượng sản phẩm trong giỏ hàng lớn hơn 0 thì giảm số lượng
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public JsonResult Change(int id, bool status)
        {
            var cart = (List<CartItem>)Session[Constrain.Cart_Session];
            if (status)
            {
                if (cart.Find(x => x.Product.ID == id).Product.Quantity > cart.Find(x => x.Product.ID == id).Quantity)
                {
                    cart.Find(x => x.Product.ID == id).Quantity += 1;
                    return Json(new
                    {
                        status = true
                    });
                }
            }
            else
            {
                if (cart.Find(x => x.Product.ID == id).Quantity > 0)
                {
                    cart.Find(x => x.Product.ID == id).Quantity -= 1;
                    return Json(new
                    {
                        status = true
                    });
                }

            }
            return Json(new
            {
                status = false
            });
        }

        /// <summary>
        /// 
        /// Kiểm tra mã giảm giá và lưu lại
        /// 
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        public JsonResult CheckCoupon(string code)
        {
            var coupon = new CouponDao().getOne(code);

            if (coupon != null)
            {
                Session[Constrain.Coupon_Session] = coupon;
                return Json(new
                {
                    status = true,
                    value = coupon.Value
                });
            }
            else
            {
                Session[Constrain.Coupon_Session] = null;
                return Json(new
                {
                    status = false
                });
            }

        }

        /// <summary>
        /// 
        /// Xóa 1 sản phẩm trong giỏ hàng
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public JsonResult Delete(int id)
        {
            var sessionCart = (List<CartItem>)Session[Constrain.Cart_Session];
            sessionCart.RemoveAll(x => x.Product.ID == id);
            Session[Constrain.Cart_Session] = sessionCart;
            return Json(new
            {
                status = true
            });
        }
    }
}