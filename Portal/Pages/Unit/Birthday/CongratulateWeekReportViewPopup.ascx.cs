using Portal.Models.EFContext;
using Portal.Models.ViewModel;
using System;
using System.Collections.Generic;

namespace Portal.Pages.Unit.Birthday
{
    public partial class CongratulateWeekReportViewPopup : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!ASPxCallbackPanelCongtatulateWeek.IsCallback)
            {
                PrepareReportCongratulateWeek();
            }
        }

        protected void ASPxCallbackPanelCongtatulateWeek_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            PrepareReportCongratulateWeek();
        }

        private void PrepareReportCongratulateWeek()
        {
            ReportCongratulateWeek rep = new ReportCongratulateWeek();

            List<BirthdayReportViewModel> data = null;
            using (EmployeeContext context = new EmployeeContext())
            {
                data = context.GetEmployyeBirthday((DateTime)Session["DateFrom"], (DateTime)Session["DateTo"]);
                foreach (var d in data)
                {
                    d.DOB = new DateTime(2000, d.DOB.Month, d.DOB.Day);
                }
            }
            rep.DataSource = data;

            rep.DisplayName = "Поздравляем - неделя";
            ASPxDocumentViewerReportCongtatulateWeek.Report = rep;
        }
    }
}