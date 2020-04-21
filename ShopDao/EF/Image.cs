namespace ShopDao.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Image
    {
        public int ID { get; set; }

        public int? ProductID { get; set; }

        [StringLength(500)]
        public string Link { get; set; }

        public bool? IsAvatar { get; set; }

        public bool? Status { get; set; }
    }
}
