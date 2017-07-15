using System;
using DevExpress.XtraReports.UI;
using Portal.Models.EFContext;

namespace Portal.Pages.Journal.OfTransport
{
    public partial class OfTransportReport : DevExpress.XtraReports.UI.XtraReport
    {
        public OfTransportReport()
        {
            InitializeComponent();
        }

        private void xrTableCell7_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            GetEmployeeFIO(sender,"Customer");
        }

        private void GetEmployeeFIO(object sender, string field)
        {
            XRTableCell cell = (XRTableCell)sender;
            int employeeId = 0;
            if (GetCurrentColumnValue(field) != null && Int32.TryParse(GetCurrentColumnValue(field).ToString(), out employeeId))
            {
                using (EmployeeContext context = new EmployeeContext())
                {
                    Models.Entities.Employee entry = context.FindById(employeeId);
                    if (entry != null)
                    {
                        cell.Text = entry.FIO;
                    }
                }
            }
        }

        private void xrTableCell10_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            GetEmployeeFIO(sender, "Attendant");
        }
    }
}
