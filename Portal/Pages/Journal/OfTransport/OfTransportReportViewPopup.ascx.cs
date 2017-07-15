using Portal.Models.EFContext;
using Portal.Models.Entities;
using Portal.Models.ViewModel;
using Portal.Pages.Journal.OfTransport;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

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
                data = context.GetDataForReport((DateTime)Session["DateFrom"], (DateTime)Session["DateTo"]);
            }
            ofTransportReport.DataSource = data;

            ofTransportReport.DisplayName = "Отчет по служебному автотранспорту";
            ASPxDocumentViewerReport.Report = ofTransportReport;
        }
    }
}