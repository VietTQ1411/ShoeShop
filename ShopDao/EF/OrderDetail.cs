namespace ShopDao.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OrderDetail")]
    public partial class OrderDetail
    {
        public int ID { get; set; }

        public DateTime? CreateDate { get; set; }

        public int? CouponID { get; set; }

        public int? CustomerID { get; set; }

        [StringLength(500)]
        public string ShipName { get; set; }

        [StringLength(50)]
        public string ShipMobile { get; set; }

        [StringLength(500)]
        public string ShipAddress { get; set; }

        [StringLength(50)]
        public string ShipEmail { get; set; }

        [StringLength(10)]
        public string AccessCode { get; set; }

        public int? Status { get; set; }
    }
}
