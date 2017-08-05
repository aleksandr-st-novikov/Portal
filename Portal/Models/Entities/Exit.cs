using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using Portal.BL.Core;

namespace Portal.Models.Entities
{
    public class Exit
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public Enums.RunType RunType { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime? DateFromCheck { get; set; }
        public DateTime? DateTo { get; set; }
        public DateTime? DateToCheck { get; set; }
        public int? EmployeeId { get; set; }
        public virtual Employee Employee { get; set; }
        public int? DepartmentId { get; set; }
        public virtual Department Department { get; set; }
        public int? PetmitEmployeeId { get; set; }
        public int? ExitPurposeId { get; set; }
        public ExitPurpose ExitPurpose { get; set; }

        [StringLength(500)]
        public string DescriptionOne { get; set; }

        [StringLength(500)]
        public string DescriptionTwo { get; set; }
    }

    public class ExitPurpose
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    }
}