using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Portal.Models.Entities
{
    public class Department
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [ConcurrencyCheck]
        public int? ParentId { get; set; }
        public int? HeadId { get; set; }

        [Required(ErrorMessage = "Поле {0} обязательно.")]
        [StringLength(300, ErrorMessage = "Длина должна быть от {2} до {1} символов!", MinimumLength = 2)]
        [Display(Name = "Наименование")]
        [ConcurrencyCheck]
        public string Name { get; set; }

        [Display(Name = "Активен")]
        [ConcurrencyCheck]
        public Boolean IsActive { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
        public virtual Employee Head { get; set; }
    }
}