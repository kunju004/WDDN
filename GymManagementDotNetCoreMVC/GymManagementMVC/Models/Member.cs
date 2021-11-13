using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace GymManagementMVC.Models
{
    public class Member
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Name can't be empty")]
        public string MemberName { get; set; }
        
        [Required(ErrorMessage = "Gender can't be empty")]
        public string Gender { get; set; }
        
        [Required(ErrorMessage = "DOB can't be empty")]
        [DataType(DataType.Date)]
        public DateTime DateOfBirth { get; set; }

        [Required(ErrorMessage = "EmailId can't be empty")]
        [DataType(DataType.EmailAddress, ErrorMessage = "E-mail is not valid")]
        public string EmailId { get; set; }

        [Required(ErrorMessage = "Address can't be empty")]
        public string Address { get; set; }

        [DataType(DataType.PhoneNumber)]
        [Required(ErrorMessage = "Phone Number Required!")]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$",ErrorMessage = "Entered phone format is not valid.")]
        public string PhoneNumber { get; set; }

        [Required(ErrorMessage = "Date can't be empty")]
        [DataType(DataType.Date)]
        public DateTime JoinDate { get; set; }
        [Required(ErrorMessage = "Time can't be empty")]
        [DataType(DataType.Time)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:HH:mm:ss}")]
        public DateTime GymTime { get; set; }

        [Required(ErrorMessage = "Period can't be empty")]
        public string Subscription { get; set; }

        [Required(ErrorMessage = "Price can't be empty")]
        public decimal Price { get; set; }
    }
}