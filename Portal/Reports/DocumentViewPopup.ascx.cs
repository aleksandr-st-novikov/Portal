using DevExpress.XtraReports.UI;
using DevExpress.XtraReports.Web;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using Portal.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Reports
{
    public partial class DocumentViewPopup : System.Web.UI.UserControl
    {
        #region Reports
        private AdmissionReport admissionReport
        {
            get
            {
                return (AdmissionReport)Session["AdmissionReport"];
            }
            set
            {
                Session["AdmissionReport"] = value;
            }
        }

        //private TransportReport transportReport
        //{
        //    get
        //    {
        //        return (TransportReport)Session["TransportReport"];
        //    }
        //    set
        //    {
        //        Session["TransportReport"] = value;
        //    }
        //}
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdmissionReportLoaded"] != null)
            {
                PrepareReportAdmission();
            }
            if (Session["TransportReportLoaded"] != null)
            {
                PrepareReportTransport();
            }
        }

        protected void ASPxCallbackPanelReport_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
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
                switch (reportName)
                {
                    case "Admission":
                        PrepareReportAdmission();
                        Session["AdmissionReportLoaded"] = true;
                        break;
                    case "Transport":
                        PrepareReportTransport();
                        Session["TransportReportLoaded"] = true;
                        break;
                }
            }

        }

        private void PrepareReportAdmission()
        {
            admissionReport = new AdmissionReport();

            List<AdmissionReportViewModel> data = null;
            using (AdmissionContext context = new AdmissionContext())
            {
                data = context.GetDataForReport(DateTime.Parse((string)Session["param1"]), 
                    DateTime.Parse((string)Session["param2"]),
                    Int32.Parse(Session["DepartmentId"].ToString()));
            }

            admissionReport.Parameters["Period"].Value = "c " + DateTime.Parse((string)Session["param1"]).ToShortDateString() +
                " по " + DateTime.Parse((string)Session["param2"]).ToShortDateString();

            using (DepartmentContext context = new DepartmentContext())
            {
                Department department = context.GetDepartmentByUser(Context.User.Identity.Name);
                if (department != null)
                {
                    admissionReport.Parameters["Department"].Value = department.Name;
                }
            }

            admissionReport.DisplayName = "Отчет о допусках сотрудников";
            admissionReport.DataSource = data;
            ASPxDocumentViewerReport.Report = admissionReport;
        }

        private void PrepareReportTransport()
        {
            //transportReport = new TransportReport();

            //List<TransportReportViewModel> data = null;
            //using (TransportContext context = new TransportContext())
            //{
            //    if (Context.User.IsInRole("Транспорт - Руководители"))
            //    {
            //        data = context.GetDataForReport(DateTime.Parse((string)Session["param1"]),
            //            DateTime.Parse((string)Session["param2"]),
            //            Int32.Parse(Session["DepartmentId"].ToString()));
            //    }
            //    else if(Context.User.IsInRole("Администраторы") || Context.User.IsInRole("Транспорт - Служебный вход"))
            //    {
            //        data = context.GetDataForReport(DateTime.Parse((string)Session["param1"]),
            //            DateTime.Parse((string)Session["param2"]));
            //    }
            //}
            //transportReport.DataSource = data;

            //transportReport.DisplayName = "Отчет по транспорту";
            //ASPxDocumentViewerReport.Report = transportReport;
        }
    }
}