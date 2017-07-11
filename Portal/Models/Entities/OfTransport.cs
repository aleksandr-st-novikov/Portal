using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Portal.Models.Entities
{
    public class OfTransport
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public DateTime Date { get; set; }

        [StringLength(300)]
        public string Customer { get; set; }

        [StringLength(1000)]
        public string Route { get; set; }

        [StringLength(1000)]
        public string Purpose { get; set; }

        [StringLength(300)]
        public string Attendant { get; set; }

        public int EmployeeId { get; set; }
        public virtual Employee Employee { get; set; }
    }
}