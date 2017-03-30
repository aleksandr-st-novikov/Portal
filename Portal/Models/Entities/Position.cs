using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Portal.Models.Entities
{
    public class Position
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required(ErrorMessage = "Поле {0} обязательно.")]
        [StringLength(300, ErrorMessage = "Длина должна быть от {2} до {1} символов!", MinimumLength = 2)]
        [Display(Name = "Наименование")]
        [ConcurrencyCheck]
        public string Name { get; set; }

        [Display(Name = "Активна")]
        public Boolean IsActive { get; set; }
        public virtual ICollection<Employee> Employees { get; set; }
    }
}