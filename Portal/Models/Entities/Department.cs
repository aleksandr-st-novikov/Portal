using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Portal.Models.Entities
{
    public class Department
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required(ErrorMessage = "Поле {0} обязательно.")]
        [StringLength(300, ErrorMessage = "Длина должна быть от {2} до {1} символов!", MinimumLength = 2)]
        [Display(Name = "Наименование")]
        public string Name { get; set; }
    }
}