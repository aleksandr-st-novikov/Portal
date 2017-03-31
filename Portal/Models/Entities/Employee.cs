using Microsoft.AspNet.Identity.EntityFramework;
using System;
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

        public int? PositionId { get; set; }

        public int? DepartmentId { get; set; }
        public DateTime? DateIn { get; set; }
        public DateTime? DateBirth { get; set; }
        public string Category { get; set; }
        public bool IsWork { get; set; }
        public virtual Department Department { get; set; }
        public virtual Position Position { get; set; }
    }
}