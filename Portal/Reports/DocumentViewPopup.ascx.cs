using DevExpress.XtraReports.UI;
using DevExpress.XtraReports.Web;
using Portal.Models.EFContext;
using Portal.Models.Entities;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdmissionReportLoaded"] != null)
            {
                PrepareReportAdmission();
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
                switch (reportName)
                {
                    case "Admission":
                        PrepareReportAdmission();
                        Session["AdmissionReportLoaded"] = true;
                        break;
                }
            }

        }

        private void PrepareReportAdmission()
        {
            admissionReport = new AdmissionReport();
            admissionReport.sqlDataSourceAdmission.Queries[0].Parameters[0].Value = DateTime.Parse((string)Session["param1"]);
            admissionReport.sqlDataSourceAdmission.Queries[0].Parameters[1].Value = DateTime.Parse((string)Session["param2"]);
            admissionReport.sqlDataSourceAdmission.Queries[0].Parameters[2].Value = Int32.Parse(Session["DepartmentId"].ToString());

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
            ASPxDocumentViewerReport.Report = admissionReport;
        }
        
    }
}