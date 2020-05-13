using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopDao.Dao
{
    public class UserDao
    {
        public long Insert(User entity)
        {
            using (ShoeDao db = new ShoeDao())
            {
                db.Users.Add(entity);
                db.SaveChanges();
                return entity.ID;
            }
        }
        public User GetByID(String name)
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Users.SingleOrDefault(x => x.UserName == name);
            }
        }
        public User ViewDetail(int id)
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Users.SingleOrDefault(x => x.ID == id);
            }
        }

        public bool isDuplicate(string user)
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Users.Where(x=>x.UserName==user).ToList().Count > 0;
            }
        }

        public bool isDuplicateEmail(string email)
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Users.Where(x => x.Email == email).ToList().Count > 0;
            }
        }

        public bool Update(User entity)
        {
            using (ShoeDao db = new ShoeDao())
            {
                try
                {
                    var user = db.Users.Find(entity.ID);
                    user.Name = entity.Name;
                    user.Address = entity.Address;
                    user.Email = entity.Email;
                    user.ModifiedBy = entity.ModifiedBy;
                    user.ModifiedDate = DateTime.Now;
                    user.Password = entity.Password;

                    db.SaveChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        public bool Delete(int id)
        {
            using (ShoeDao db = new ShoeDao())
            {
                try
                {
                    var user = db.Users.Find(id);
                    db.Users.Remove(user);
                    db.SaveChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
        public int Login(String username, String pass)
        {
            using (ShoeDao db = new ShoeDao())
            {
                var re = db.Users.SingleOrDefault(x => x.UserName == username);
                if (re == null)
                {
                    //Tài Khoản không tồn tại;
                    return 0;
                }
                else
                {
                    if (re.Password.Equals(pass))
                    {
                        if (re.Status == false)
                        {
                            //"Tài khoản đang bị khóa";
                            return -1;
                        }
                        else
                        {
                            return 1;
                        }
                    }
                    else
                    {
                        //"Sai Mật khẩu";
                        return -2;

                    }
                }
            }
        }
    }
}
