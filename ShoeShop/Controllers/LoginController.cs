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
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }


        /// <summary>
        /// Form Đăng Nhập 
        /// Redirect to Darkboard nếu type account type = 0
        /// Redirect to Home nếu account type = 1
        /// 
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(UsersAccount model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var result = dao.Login(model.UserName, Encrytor.GetMD5(model.Password));
                switch (result)
                {
                    case 1:
                        var userLogin = dao.GetByID(model.UserName);
                        Session.Add(Constrain.User_Session, userLogin);
                        if (model.Remember) { 
                            return RedirectToAction("Index", "Cart");
                        }
                        if (userLogin.Type != 0)
                            return RedirectToAction("Index", "Home");
                        else
                            return RedirectToAction("Index", "Home");
                    case 0:
                        ModelState.AddModelError("", "Tài Khoản không tồn tại");
                        break;
                    case -1:
                        ModelState.AddModelError("", "Tài khoản đã bị khóa");
                        break;
                    case -2:
                        ModelState.AddModelError("", "Sai mật khẩu");
                        break;
                    default:
                        ModelState.AddModelError("", "Tên đang nhập mk ko đúng");
                        break;
                }
            }
            else
            {
                ModelState.AddModelError("", "Nhập tên tài khoản mật khẩu");
            }
            return View("Index");
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(User user,string rePass)
        {
            UserDao dao = new UserDao();
            if (ModelState.IsValid)
            {
                if (rePass != user.Password)
                {
                    ModelState.AddModelError("", "Re Enter Password Wrong!!");
                }
                else if(dao.isDuplicate(user.UserName))
                {
                    ModelState.AddModelError("", "Tài Khoản đã tồn tại");
                }else if (dao.isDuplicateEmail(user.Email))
                {
                    ModelState.AddModelError("", "Email đã tồn tại");
                }
                else
                {
                    user.Type = 2;
                    user.CreateDate = DateTime.Now;
                    user.CreateBy = user.UserName;
                    user.Status = true;
                    user.Password = Encrytor.GetMD5(user.Password);
                    dao.Insert(user);
                    return View("CreateSuccess");
                }
            }
            else
            {
                ModelState.AddModelError("", "Fill all properties");
            }

            return View();
        }

        public ActionResult CreateSuccess()
        {
            return View();
        }

        public ActionResult LogOut()
        {
            Session.Add(Constrain.User_Session, null);
            return RedirectToAction("Index", "Home");
        }
    }
}