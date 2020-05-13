using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopDao.Dao
{
    public class OrderDetailDao
    {
        public int Insert(OrderDetail order)
        {
            using (ShoeDao db = new ShoeDao())
            {
                db.OrderDetails.Add(order);
                db.SaveChanges();
                return order.ID;
            }
        }

        public List<OrderDetail> GetOrderDetails(int id)
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.OrderDetails.Where(x => x.CustomerID == id).OrderByDescending(x => x.CreateDate)
                                            .ToList();
            }
        }
    }
}
