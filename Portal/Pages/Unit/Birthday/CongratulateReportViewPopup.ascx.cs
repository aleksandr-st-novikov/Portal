using Portal.Models.EFContext;
using Portal.Models.Entities;
using Portal.Models.ViewModel;
using Portal.Pages.Journal.OfTransport;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Portal.Pages.Unit.Birthday
{
    public partial class CongratulateReportViewPopup : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PrepareReportCongratulate();
        }

        protected void ASPxCallbackPanelOfTransportReport_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            PrepareReportCongratulate();
        }

        private void PrepareReportCongratulate()
        {
            OfTransportReport ofTransportReport = new OfTransportReport();

            List<OfTransport> data = null;
            using (OfTransportContext context = new OfTransportContext())
            {
                data = context.GetDataForReport((DateTime)Session["DateFrom"], (DateTime)Session["DateTo"]);
            }
            ofTransportReport.DataSource = data;

            ofTransportReport.DisplayName = "Поздравляем";
            //ASPxDocumentViewerReport.Report = ofTransportReport;
        }
    }
}