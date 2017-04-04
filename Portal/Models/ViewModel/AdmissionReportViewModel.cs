using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Portal.Models.ViewModel
{
    public class AdmissionReportViewModel
    {
        public string FIO { get; set; }
        public string PositionName { get; set; }
        public DateTime? DateFlu { get; set; }
        public string NumFlu { get; set; }
        public DateTime? Dopusk { get; set; }
        public DateTime? SanMin { get; set; }
        public DateTime? MedOsm { get; set; }
        public string Commentary { get; set; }
    }
}