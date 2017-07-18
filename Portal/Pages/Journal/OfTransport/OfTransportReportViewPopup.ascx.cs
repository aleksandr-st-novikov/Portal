using Portal.Models.EFContext;
using System;
using System.Collections.Generic;

namespace Portal.Pages.Journal.OfTransport
{
    public partial class OfTransportReportViewPopup : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PrepareReportOfTransport();
        }

        protected void ASPxCallbackPanelOfTransportReport_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            PrepareReportOfTransport();
        }

        private void PrepareReportOfTransport()
        {
            OfTransportReport ofTransportReport = new OfTransportReport();

            List<Models.Entities.OfTransport> data = null;
            using (OfTransportContext context = new OfTransportContext())
            {
                data = context.GetDataForReport((DateTime)Session["DateFromOfTransport"], (DateTime)Session["DateToOfTransport"]);
            }
            ofTransportReport.DataSource = data;

            ofTransportReport.DisplayName = "Отчет по служебному автотранспорту";
            ASPxDocumentViewerReport.Report = ofTransportReport;
        }
    }
}