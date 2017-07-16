using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Portal.Models.Entities
{
    public class Constant
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [ConcurrencyCheck]
        [StringLength(300)]
        public string Name { get; set; }

        [StringLength(1000)]
        public string Value { get; set; }

        [StringLength(500)]
        [ConcurrencyCheck]
        public string Description { get; set; }
    }
}