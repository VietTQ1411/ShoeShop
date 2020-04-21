using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShoeShop.Models
{
    [Serializable]
    public class UsersAccount
    {
        
        public int UserID { get; set; }
        [Required(ErrorMessage = "UserName not be blank")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Password not be blank")]
        public string Password { get; set; }
        public bool Remember { get; set; }
    }
}