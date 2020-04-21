using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopDao.Dao
{
   public class ContactDao
    {
        public Contact GetContactByType(int type)
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Contacts.Where(x => x.Type == type && x.Status == true).SingleOrDefault();
            }
        }
    }
}
