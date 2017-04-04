using DevExpress.XtraReports.UI;
using DevExpress.XtraReports.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Reports
{
    public partial class DocumentView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowReport();
        }

        private void ShowReport()
        {
            if (Session["reportName"] != null)
            {
                string reportName = (string)Session["reportName"];
                if (!String.IsNullOrEmpty(reportName))
                {
                    if (ASPxDocumentViewerReport.IsCallback)
                    {
                        switch (reportName)
                        {
                            case "Admission":
                                if (Session["Report"] == null)
                                {
                                    AdmissionReport rep = new AdmissionReport();
                                    //rep.sqlDataSourceAdmission.Queries[0].Parameters[0].Value = DateTime.Parse((string)Session["param1"]);
                                    //rep.sqlDataSourceAdmission.Queries[0].Parameters[1].Value = DateTime.Parse((string)Session["param2"]);
                                    //rep.sqlDataSourceAdmission.Queries[0].Parameters[2].Value = Int32.Parse(Session["DepartmentId"].ToString());
                                    Session["Report"] = rep;
                                }
                                ASPxDocumentViewerReport.Report = Session["Report"] as XtraReport;
                                break;
                        }
                    }
                }
            }
        }

        protected void ASPxDocumentViewerReport_Unload(object sender, EventArgs e)
        {
            //((ASPxDocumentViewer)sender).Report = null;
        }
    }
}