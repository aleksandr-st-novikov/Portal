using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Portal.Models.Entities
{
    public class Employee
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        //[Required(ErrorMessage = "Поле {0} обязательно.")]
        [StringLength(15)]
        public string TabN { get; set; }

        //[Required(ErrorMessage = "Поле {0} обязательно.")]
        [StringLength(150)]
        public string Lastname { get; set; }

        [StringLength(150)]
        public string Firstname { get; set; }

        [StringLength(150)]
        public string Patronymic { get; set; }

        [NotMapped]
        public string FullName
        {
            get
            {
                return $"{Lastname} {Firstname} {Patronymic}";
            }
        }

        [NotMapped]
        public string FIO
        {
            get
            {
                return $"{Lastname} {Firstname.Substring(0,1)}.{Patronymic.Substring(0,1)}.";
            }
        }
        public int? PositionId { get; set; }

        public int? DepartmentId { get; set; }
        public DateTime? DateIn { get; set; }
        public DateTime? DateBirth { get; set; }
        public string Category { get; set; }
        public bool IsWork { get; set; }
        public virtual Department Department { get; set; }
        public virtual Position Position { get; set; }
        public virtual ICollection<AccessoriesDepartment> AccessoriesDepartment { get; set; }
    }

    public class Position
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required(ErrorMessage = "Поле {0} обязательно.")]
        [StringLength(300)]
        [Display(Name = "Наименование")]
        [ConcurrencyCheck]
        public string Name { get; set; }

        [Display(Name = "Активна")]
        public Boolean IsActive { get; set; }
        public virtual ICollection<Employee> Employees { get; set; }
    }

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

        public Boolean? NotChangeHead { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
        public virtual Employee Head { get; set; }
        public virtual ICollection<AccessoriesDepartment> AccessoriesDepartment { get; set; }
    }
}