using ShopDao.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopDao.Dao
{
    public class ProductDao
    {
        public List<Product> getAll()
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Products.ToList();
            }
        }

        public Product getOneById(int id)
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Products.Find(id);
            }
        }

        public List<Product> getNewsProduct(int number)
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Products.OrderByDescending(x => x.CreateDate).Take(number).ToList();
            }
        }


        public List<Product> listTop(int top)
        {
            using (ShoeDao db = new ShoeDao())
            {
                return db.Products.OrderByDescending(x => x.ViewCount).Take(top).ToList();
            }
        }


        public List<Product> SearchProducts(int page, int pageSize, ref int totalRecord,
            string name, int? brand, int? color, int? size, int? style)
        {
            using (ShoeDao db = new ShoeDao())
            {
                //var model = from a in db.Products
                //            where ((String.IsNullOrEmpty(name)) ? true : a.Name.Contains(name))
                //            && ((brand == null) ? true : a.CategoryID == brand)
                //            && ((color == null) ? true : a.Color == color)
                //            && ((size == null) ? true : a.Size == size)
                //            && ((style == null) ? true : a.TypeID == style)
                //            select new Product()
                //            {
                //                ID = a.ID,
                //                Name = a.Name,
                //                Image = a.Image,
                //                Size = a.Size,
                //                MetaTitle = a.MetaTitle,
                //                Description = a.Description,
                //                Price = a.Price,
                //                PromotionPrice = a.PromotionPrice,
                //                Quantity = a.Quantity,
                //                Color = a.Color,
                //                CategoryID = a.CategoryID,
                //                TypeID = a.TypeID,
                //                Detail = a.Detail,
                //                CreateDate = a.CreateDate,
                //                CreateBy = a.CreateBy,
                //                ModifiedDate = a.ModifiedDate,
                //                ModifiedBy = a.ModifiedBy,
                //                Status = a.Status,
                //                MetaKeyWords = a.MetaKeyWords,
                //                MetaDiscriptions = a.MetaDiscriptions,
                //                ViewCount = a.ViewCount

                //            };
                totalRecord = db.Products.Where(x => ((String.IsNullOrEmpty(name)) ? true : x.Name.Contains(name))
                                                && ((brand == null) ? true : x.CategoryID == brand)
                                                && ((color == null) ? true : x.Color == color)
                                                && ((size == null) ? true : x.Size == size)
                                                && ((style == null) ? true : x.TypeID == style)
                                                ).Count();
                return db.Products.Where(x=>((String.IsNullOrEmpty(name)) ? true : x.Name.Contains(name))
                                            && ((brand == null) ? true : x.CategoryID == brand)
                                            && ((color == null) ? true : x.Color == color)
                                            && ((size == null) ? true : x.Size == size)
                                            && ((style == null) ? true : x.TypeID == style)
                                            ).OrderByDescending(x => x.CreateDate)
                                                .Skip((page - 1) * pageSize).Take(pageSize).ToList();
            }

        }



        //public List<Product> listRelate(long productID)
        //{
        //    var product = db.Products.Find(productID);
        //    return db.Products.Where(x => x.ID != productID && x.CategoryID == product.CategoryID).OrderByDescending(x => x.CreateDate).Take(4).ToList();
        //}
    }
}
