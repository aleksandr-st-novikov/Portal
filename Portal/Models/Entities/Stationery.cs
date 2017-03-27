using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

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
        public int GroupId { get; set; }
    }
}