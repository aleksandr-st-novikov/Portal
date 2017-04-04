using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Portal.Models.ViewModel
{
    public class TransportReportViewModel
    {
        public string Address { get; set; }
        public DateTime DateTransport { get; set; }
        public string FIO { get; set; }
        public string DepartmentShortName { get; set; }
    }
}