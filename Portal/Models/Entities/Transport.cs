using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Portal.Models.Entities
{
    public class Transport
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [StringLength(300)]
        public string Address { get; set; }

        public DateTime DateTransport { get; set; }

        public int? EmployeeId { get; set; }
        public virtual Employee Employee { get; set; }

        public int? DepartmentId { get; set; }
        public virtual Department Department { get; set; }
    }
}