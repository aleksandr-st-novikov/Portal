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
        [StringLength(300)]
        [Display(Name = "Наименование")]
        [ConcurrencyCheck]
        public string Name { get; set; }

        [StringLength(100)]
        [Display(Name = "Краткое наименование")]
        [ConcurrencyCheck]
        public string ShortName { get; set; }

        [Display(Name = "Активен")]
        [ConcurrencyCheck]
        public Boolean IsActive { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
        public virtual Employee Head { get; set; }
    }
}