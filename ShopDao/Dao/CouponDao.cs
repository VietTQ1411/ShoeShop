using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopDao.Dao
{
    public class CouponDao
    {
        public Coupon getOne(string code)
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Coupons.Where(x => x.Code == code && x.Status == 1 && x.ExpirationDate>DateTime.Now).SingleOrDefault();
            }
        }
    }
}
