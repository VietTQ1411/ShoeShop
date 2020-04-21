using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopDao.Dao
{
    public class SearchTypeDao
    {

        public ProductCategory GetProductCategoryByID(int id) {
            using (ShoeDao db = new ShoeDao())
            {
                return db.ProductCategories.Where(x => x.ID == id).SingleOrDefault();
            }
        }

        public Color GetColorByID(int id)
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Colors.Where(x => x.ID == id).SingleOrDefault();
            }
        }

        public Category getBrandByID(int id)
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Categories.Where(x => x.ID == id).SingleOrDefault();
            }
        }

        public List<ProductCategory> GetProductCategories()
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.ProductCategories.Where(x => x.Status == true).OrderBy(x => x.DisplayOrder).ToList();
            }
        }

        public List<Color> GetColors()
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Colors.OrderByDescending(x => x.Display).ToList();
            }
        }

        public List<Category> GetCategories()
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Categories.Where(x => x.Status == 1).OrderBy(x => x.DisplayOrder).ToList();
            }
        }

        public List<SizeProduct> GetVs()
        {
            using (ShoeDao db = new ShoeDao())
            {
                var model = from a in db.Products
                            group a by a.Size into g
                            select new SizeProduct()
                            {
                                size = g.Key

                            };
                return model.ToList();
            }
        }
    }
}
