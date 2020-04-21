namespace ShopDao.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Coupon")]
    public partial class Coupon
    {
        public int ID { get; set; }

        [StringLength(100)]
        public string Code { get; set; }

        public DateTime? CreateDate { get; set; }

        public DateTime? ExpirationDate { get; set; }

        public int? Status { get; set; }

        public int? Value { get; set; }
    }
}
