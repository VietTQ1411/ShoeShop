namespace ShopDao.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        public int ID { get; set; }

        [StringLength(50)]

        [Required(ErrorMessage ="User Name can't not be blank")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Password can't not be blank")]
        [MaxLength(32,ErrorMessage = "Password must be 6 to 32 character")]
        [MinLength(6, ErrorMessage = "Password must be 6 to 32 character")]
        [StringLength(32)]
        public string Password { get; set; }

        public int? Type { get; set; }

        [Required(ErrorMessage = "Name can't not be blank")]
        [StringLength(500)]
        public string Name { get; set; }

        [Required(ErrorMessage = "Address can't not be blank")]
        [StringLength(500)]
        public string Address { get; set; }

        [Required(ErrorMessage = "Email can't not be blank")]
        [StringLength(50)]
        public string Email { get; set; }

        [Required(ErrorMessage = "Phone can't not be blank")]
        [StringLength(50)]
        public string Phone { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string CreateBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public bool? Status { get; set; }
    }
}
