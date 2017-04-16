using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Portal.Models.Entities
{
    public class Accessories
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public DateTime DateDocument { get; set; }
        public int AccessoriesTypeId { get; set; }
        public virtual AccessoriesType AccessoriesType { get; set; }
        public int AccessoriesDepartmentId { get; set; }
        public virtual AccessoriesDepartment AccessoriesDepartment { get; set; }
        public int Status { get; set; }
        public virtual ICollection<AccessoriesTable> AccessoriesTable { get; set; }
    }

    public class AccessoriesTable
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int AccessoriesId { get; set; }
        public virtual Accessories Accessories { get; set; }
        public int AccessoriesProductId { get; set; }
        public virtual AccessoriesProduct AccessoriesProduct { get; set; }
        public int? Quantity { get; set; }
        public int? QuantityAgreed { get; set; }
    }

    public class AccessoriesType
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [StringLength(20)]
        [Required]
        public string Name { get; set; }

        public virtual ICollection<AccessoriesProduct> AccessoriesProduct { get; set; }
        public virtual ICollection<AccessoriesDepartment> AccessoriesDepartment { get; set; }
        public virtual ICollection<Accessories> Accessories { get; set; }
    }

    public class AccessoriesDepartment
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int DepartmentId { get; set; }
        public virtual Department Department { get; set; }
        public int EmployeeId { get; set; }
        public virtual Employee Employee { get; set; }

        [StringLength(150)]
        public string Description { get; set; }

        public int AccessoriesTypeId { get; set; }
        public virtual AccessoriesType AccessoriesType { get; set; }
        public virtual ICollection<Accessories> Accessories { get; set; }
    }

    public class AccessoriesProduct
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required(ErrorMessage = "Поле {0} обязательно.")]
        [Display(Name = "Наименование")]
        [StringLength(150)]
        public string Name { get; set; }

        [Display(Name = "Ед.изм.")]
        [StringLength(20)]
        public string Unit { get; set; }

        [Display(Name = "Количество для выписки на складе")]
        public decimal QuantityPerOne { get; set; }

        [Display(Name = "Цена")]
        public double Price { get; set; }

        public Boolean IsActive { get; set; }
        public int AccessoriesTypeId { get; set; }
        public virtual AccessoriesType AccessoriesType { get; set; }
        public virtual ICollection<AccessoriesTable> AccessoriesTable { get; set; }
    }
}