using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Portal.Models.Entities
{
    public class Manual
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public int? ParentId { get; set; }
        public bool? IsCategory { get; set; }
        public int? EmployeeId { get; set; }
        public virtual Employee Employee { get; set; }

        [StringLength(500)]
        public string Name { get; set; }

        public string MainText { get; set; }
        public string Attachment { get; set; }
        public DateTime? DateCreate { get; set; }
    }
}