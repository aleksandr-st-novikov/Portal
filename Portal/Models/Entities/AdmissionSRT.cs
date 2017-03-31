using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Portal.Models.Entities
{
    public class AdmissionSRT
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public DateTime? DateFlu { get; set; }

        [StringLength(20)]
        public string NumFlu { get; set; }
        public DateTime? Dopusk { get; set; }
        public DateTime? SanMin { get; set; }

        [StringLength(300)]
        public string Commentary { get; set; }

        public int? EmployeeId { get; set; }
        public virtual Employee Employee { get; set; }

        public int? DepartmentId { get; set; }
        public virtual Department Department { get; set; }
        public int? PositionId { get; set; }
        public virtual Position Position { get; set; }
    }
}