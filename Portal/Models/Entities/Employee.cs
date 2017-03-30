using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Portal.Models.Entities
{
    public class Employee
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required(ErrorMessage = "Поле {0} обязательно.")]
        [StringLength(150, ErrorMessage = "Длина должна быть от {2} до {1} символов!", MinimumLength = 2)]
        public string TabN { get; set; }

        [Required(ErrorMessage = "Поле {0} обязательно.")]
        [StringLength(150, ErrorMessage = "Длина должна быть от {2} до {1} символов!", MinimumLength = 2)]
        public string Lastname { get; set; }

        [StringLength(150, ErrorMessage = "Длина должна быть от {2} до {1} символов!", MinimumLength = 2)]
        public string Firstname { get; set; }

        [StringLength(150, ErrorMessage = "Длина должна быть от {2} до {1} символов!", MinimumLength = 2)]
        public string Patronymic { get; set; }

        [StringLength(150, ErrorMessage = "Длина должна быть от {2} до {1} символов!", MinimumLength = 2)]
        public string Prof { get; set; }

        public int? DepartmentId { get; set; }
        public DateTime? DateIn { get; set; }
        public DateTime? DateBirth { get; set; }
        public string Category { get; set; }
        public virtual Department Department { get; set; }
    }
}