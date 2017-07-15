using Portal.Models.EFContext;
using Portal.Models.ViewModel;
using System;
using System.Collections.Generic;
using Portal.BL.Core;

namespace Portal.Pages.Unit.Birthday
{
    public partial class CongratulateReportViewPopup : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!ASPxCallbackPanelCongtatulate.IsCallback)
            {
                PrepareReportCongratulate();
            }
        }

        protected void ASPxCallbackPanelCongtatulate_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            PrepareReportCongratulate();
        }

        private void PrepareReportCongratulate()
        {
            ReportCongratulate rep = new ReportCongratulate();

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
            rep.Parameters["message"].Value = Data.BirthdayMessageBottom;

            rep.DisplayName = "Поздравляем";
            ASPxDocumentViewerReportCongtatulate.Report = rep;
        }
    }
}