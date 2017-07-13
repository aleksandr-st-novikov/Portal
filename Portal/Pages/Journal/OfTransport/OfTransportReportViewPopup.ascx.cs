using Portal.Models.EFContext;
using Portal.Models.Entities;
using Portal.Models.ViewModel;
using Portal.Pages.Journal.OfTransport;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Portal.Reports
{
    public partial class OfTransportReportViewPopup : System.Web.UI.UserControl
    {
        //private OfTransportReport ofTransportReport
        //{
        //    get
        //    {
        //        return (OfTransportReport)Session["OfTransportReport"];
        //    }
        //    set
        //    {
        //        Session["OfTransportReport"] = value;
        //    }
        //}

        private OfTransportReport ofTransportReport;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["OfTransportReportLoaded"] != null)
            //{
            //    PrepareReportOfTransport();
            //}
        }

        protected void ASPxCallbackPanelTransportReport_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            //List<string> parameters = e.Parameter.Split(new char[] { '|' }).ToList();
            //Session["reportName"] = parameters[0];
            //for (int i = 1; i <= parameters.Count - 1; i++)
            //{
            //    Session["param" + i.ToString()] = parameters[i];
            //}

            //string reportName = (string)Session["reportName"];
            //if (!String.IsNullOrEmpty(reportName))
            //{
            //    ASPxDocumentViewerReport.Report = null;
                PrepareReportOfTransport();
            //    Session["TransportReportLoaded"] = true;
            //}

        }

        private void PrepareReportOfTransport()
        {
            ofTransportReport = new OfTransportReport();

            List<OfTransport> data = null;
            using (OfTransportContext context = new OfTransportContext())
            {
                data = context.GetDataForReport((DateTime)Session["DateFrom"], (DateTime)Session["DateTo"]);
            }
            ofTransportReport.DataSource = data;

            ofTransportReport.DisplayName = "Отчет по транспорту";
            ASPxDocumentViewerReport.Report = ofTransportReport;
        }
    }
}