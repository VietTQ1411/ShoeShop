using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopDao.Dao
{
    public class SliderDao
    {
        public List<Slide> getAll()
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Slides.Where(x=>x.Status==true).OrderBy(x=>x.DisplayOrder).ToList();
            }
        }
    }
}
