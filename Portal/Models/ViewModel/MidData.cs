using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Portal.Models.ViewModel
{
    public class MidData
    {
        public string TabNo { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Patronymic { get; set; }
        public string Department { get; set; }
        public string Position { get; set; }
        public DateTime DateIn { get; set; }
        public DateTime DateBirth { get; set; }
    }
}