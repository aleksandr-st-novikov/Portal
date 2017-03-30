using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Portal.Models.Entities
{
    public class Stationery
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required(ErrorMessage = "Поле {0} обязательно.")]
        [Display(Name = "Наименование")]
        [StringLength(150, ErrorMessage = "Длина должна быть от {2} до {1} символов!", MinimumLength = 2)]
        public string Name { get; set; }

        [Display(Name = "Ед.изм.")]
        [StringLength(20)]
        //[DefaultValue("шт.")]
        public string Unit { get; set; }

        [Display(Name = "Цена")]
        public double Price { get; set; }

        public Boolean IsActive { get; set; }
        //public int GroupId { get; set; }
    }
}