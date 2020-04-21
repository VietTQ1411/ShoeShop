using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoeShop.App_Start
{
    public class Constrain
    {
        public static readonly int Type_Location_Contact = 1;
        public static readonly int Type_Phone_Contact = 2;
        public static readonly int Type_Email_Contact = 3;
        public static readonly int Type_site_Contact = 4;
        public static readonly string Cart_Session = "CartSection";
        public static readonly string Coupon_Session = "CouponSession";
        public static readonly string User_Session = "User";


        //Search key 
        public static readonly string Search_name = "Product_name";
        public static readonly string Search_brand = "Product_brand";
        public static readonly string Search_size = "Product_size";
        public static readonly string Search_style = "Product_style";
        public static readonly string Search_color = "Product_color";
    }
}