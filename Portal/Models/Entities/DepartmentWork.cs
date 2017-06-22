using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Portal.Models.Entities
{
    public class DepartmentWork
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public string RegisterUserId { get; set; }
        public int RegisterEmployeeId { get; set; }
        public virtual Employee RegisterEmployee { get; set; }
        public DateTime RegisterDate { get; set; }
        public DateTime CloseDate { get; set; }

        [StringLength(150)]
        public string FromWhom { get; set; }

        [StringLength(5000)]
        public string RegisterDescription { get; set; }

        public string CloseUserId { get; set; }
        public int CloseEmployeeId { get; set; }
        public virtual Employee CloseEmployee { get; set; }
        public string CloseDescription { get; set; }
        public int DepartmentId { get; set; }
        public virtual Department Department { get; set; }
    }
}