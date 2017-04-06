using Portal.Models.EFContext;
using Portal.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Portal.Reports
{
    public partial class TransportReportViewPopup : System.Web.UI.UserControl
    {
        private TransportReport transportReport
        {
            get
            {
                return (TransportReport)Session["TransportReport"];
            }
            set
            {
                Session["TransportReport"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TransportReportLoaded"] != null)
            {
                PrepareReportTransport();
            }
        }

        protected void ASPxCallbackPanelTransportReport_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            List<string> parameters = e.Parameter.Split(new char[] { '|' }).ToList();
            Session["reportName"] = parameters[0];
            for (int i = 1; i <= parameters.Count - 1; i++)
            {
                Session["param" + i.ToString()] = parameters[i];
            }

            string reportName = (string)Session["reportName"];
            if (!String.IsNullOrEmpty(reportName))
            {
                ASPxDocumentViewerReport.Report = null;
                PrepareReportTransport();
                Session["TransportReportLoaded"] = true;
            }

        }

        private void PrepareReportTransport()
        {
            transportReport = new TransportReport();

            List<TransportReportViewModel> data = null;
            using (TransportContext context = new TransportContext())
            {
                if (Context.User.IsInRole("Транспорт - Руководители"))
                {
                    data = context.GetDataForReport(DateTime.Parse((string)Session["param1"]),
                        DateTime.Parse((string)Session["param2"]),
                        Int32.Parse(Session["DepartmentId"].ToString()));
                }
                else if(Context.User.IsInRole("Администраторы") || Context.User.IsInRole("Транспорт - Служебный вход"))
                {
                    data = context.GetDataForReport(DateTime.Parse((string)Session["param1"]),
                        DateTime.Parse((string)Session["param2"]));
                }
            }
            transportReport.DataSource = data;

            transportReport.DisplayName = "Отчет по транспорту";
            ASPxDocumentViewerReport.Report = transportReport;
        }
    }
}