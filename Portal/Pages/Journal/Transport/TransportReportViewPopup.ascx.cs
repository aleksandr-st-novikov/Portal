using Portal.Models.EFContext;
using Portal.Models.ViewModel;
using System;
using System.Collections.Generic;

namespace Portal.Pages.Journal.Transport
{
    public partial class TransportReportViewPopup : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!ASPxCallbackPanelTransportReport.IsCallback)
            {
                PrepareReportTransport();
            }
        }

        protected void ASPxCallbackPanelTransportReport_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            PrepareReportTransport();
        }

        private void PrepareReportTransport()
        {
            TransportReport transportReport = new TransportReport();

            List<TransportReportViewModel> data = null;
            using (TransportContext context = new TransportContext())
            {
                data = context.GetDataForReport((DateTime)Session["DateFrom"], (DateTime)Session["DateTo"]);
            }
            transportReport.DataSource = data;

            transportReport.DisplayName = "Отчет по транспорту";
            ASPxDocumentViewerReport.Report = transportReport;
        }
    }
}