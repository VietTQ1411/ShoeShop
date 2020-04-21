using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopDao.Dao
{
    public class OrderDao
    {
        public void Insert(Order order)
        {
            using (ShoeDao db = new ShoeDao())
            {
                db.Orders.Add(order);
                db.SaveChanges();
            }
        }
    }
}
