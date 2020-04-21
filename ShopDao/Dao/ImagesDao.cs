using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopDao.Dao
{
    public class ImagesDao
    {
        public List<Image> getAll()
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Images.ToList();
            }
        }

        public Image getOne(int productID)
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Images.Where(x=> x.ProductID == productID && x.IsAvatar == true).SingleOrDefault();
            }
        }
    }
}
