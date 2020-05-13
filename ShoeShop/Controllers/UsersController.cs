using ShoeShop.App_Start;
using ShopDao.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoeShop.Controllers
{
    public class UsersController : Controller
    {
        // GET: Users
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult MyOrder()
        {
            var ses = (ShopDao.EF.User)Session[Constrain.User_Session];
            var list = new OrderDetailDao().GetOrderDetails(ses.ID);
            return View(list);
        }

        [HttpPost]
        public ActionResult MyOrder(int a)
        {
            return View();
        }

        [HttpGet]
        public ActionResult LoginSecurity()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LoginSecurity(string oldpass, string newpass, string repass)
        {
            if (ModelState.IsValid)
            {
                var ses = (ShopDao.EF.User)Session[Constrain.User_Session];
                if (ses.Password != Encrytor.GetMD5(oldpass))
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng");
                }
                else if (newpass != repass)
                {
                    ModelState.AddModelError("", "Nhập lại mật khẩu không đúng");
                }
                else
                {
                    ses.Password = Encrytor.GetMD5(newpass);
                    new UserDao().Update(ses);
                    return View("Success");
                }
            }
            else
            {
                ModelState.AddModelError("", "Vui lòng nhập mật khẩu");
            }
            return View();
        }

        [HttpGet]
        public ActionResult YourAddress()
        {

            return View();
        }

        [HttpPost]
        public ActionResult YourAddress(string oldpass, string newpass)
        {
            var ses = (ShopDao.EF.User)Session[Constrain.User_Session];
            if (ModelState.IsValid)
            {
                if (oldpass == null && newpass == null)
                {
                    ModelState.AddModelError("", "Vui lòng điền thông tin");
                }
                else
                {
                    if (oldpass != null)
                    {
                        ses.Address = oldpass;
                    }
                    if (newpass != null)
                    {
                        ses.Phone = newpass;
                    }
                    new UserDao().Update(ses);
                    return View("Success");
                }
            }
            else
            {
                ModelState.AddModelError("", "Vui lòng điền thông tin");
            }
            return View();
        }

        public ActionResult Success()
        {
            return View();
        }
    }
}