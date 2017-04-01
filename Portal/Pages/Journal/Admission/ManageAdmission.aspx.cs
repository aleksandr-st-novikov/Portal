using DevExpress.XtraPrinting;
using Portal.Models;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using Portal.Reports;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.Admission
{
    public partial class ManageAdmission : System.Web.UI.Page
    {
        private Department department;
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!(User.IsInRole("Администраторы")
                || User.IsInRole("Допуски сотрудников")))
            {
                HttpContext.Current.Response.Redirect(ResolveUrl("~/"), false);
                return;
            }

            if (!Page.IsPostBack && !Page.IsCallback)
            {
                Page.Title = "Допуски сотрудников";

                ASPxLoadingPanelLoad.ContainerElementID = "ASPxPanel1";
                using (DepartmentContext context = new DepartmentContext())
                {
                    department = await context.GetDepartmentByUserAsync(User.Identity.Name);
                    if (department != null)
                    {
                        ASPxLabelDepartment.Text = "Допуски сотрудников: " + department.Name;
                        Session["DepartmentId"] = department.Id;
                    }
                }
            }

            if (ASPxDocumentViewerReport.IsCallback)
            {
                //AdmissionReport rep = new AdmissionReport();
                ////rep.Parameters["dateFrom"].Value = (DateTime)ASPxFormLayoutSaveDateFrom.Value;
                //rep.sqlDataSourceAdmission.Queries[0].Parameters[0].Value = DateTime.Now.AddDays(-10).Date;
                ////rep.Parameters["dateTo"].Value = DateTime.Parse(ASPxFormLayoutSaveDateTo.Value.ToString());
                //rep.sqlDataSourceAdmission.Queries[0].Parameters[1].Value = DateTime.Now.Date;
                //rep.sqlDataSourceAdmission.Queries[0].Parameters[2].Value = Int32.Parse(Session["DepartmentId"].ToString());

                TestReport rep = new TestReport();

                ASPxDocumentViewerReport.Report = rep;
                ASPxDocumentViewerReport.DataBind();
            }
        }

        protected async void ASPxCallbackImportEmployee_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (department != null)
            {
                using (AdmissionContext context = new AdmissionContext())
                {
                    await context.PopulateByDepartmentAsync(department.Id);
                    await context.SaveChangesAsync();
                }
            }
        }

        protected void ASPxCallbackSave_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            //AdmissionReport rep = new AdmissionReport();
            ////rep.Parameters["dateFrom"].Value = (DateTime)ASPxFormLayoutSaveDateFrom.Value;
            //rep.sqlDataSourceAdmission.Queries[0].Parameters[0].Value = DateTime.Now.AddDays(-10).Date;
            ////rep.Parameters["dateTo"].Value = DateTime.Parse(ASPxFormLayoutSaveDateTo.Value.ToString());
            //rep.sqlDataSourceAdmission.Queries[0].Parameters[1].Value = DateTime.Now.Date;
            //rep.sqlDataSourceAdmission.Queries[0].Parameters[2].Value = Int32.Parse(Session["DepartmentId"].ToString());

            //ASPxDocumentViewerReport.Report = rep;

            //ASPxPopupControlReport.ShowOnPageLoad = true;

            //XlsxExportOptions xlsxOptions = rep.ExportOptions.Xlsx;

            //// Set XLSX-specific export options.
            //xlsxOptions.ShowGridLines = true;
            //xlsxOptions.TextExportMode = TextExportMode.Value;
            //xlsxOptions.ExportHyperlinks = true;
            //xlsxOptions.SheetName = "Лист 1";

            ////string filePath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            ////rep.ExportToXlsx("rep.xlsx");

            //Response.Clear();
            //Response.Buffer = true;
            //Response.Charset = "";
            //Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            //Response.AddHeader("content-disposition", "attachment;filename=SqlExport.xlsx");
            //using (MemoryStream MyMemoryStream = new MemoryStream())
            //{
            //    rep.ExportToXlsx(MyMemoryStream);
            //    MyMemoryStream.WriteTo(Response.OutputStream);
            //    Response.Flush();
            //    Response.End();
            //}

        }

        protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            //AdmissionReport rep = new AdmissionReport();
            ////rep.Parameters["dateFrom"].Value = (DateTime)ASPxFormLayoutSaveDateFrom.Value;
            //rep.sqlDataSourceAdmission.Queries[0].Parameters[0].Value = DateTime.Now.AddDays(-10).Date;
            ////rep.Parameters["dateTo"].Value = DateTime.Parse(ASPxFormLayoutSaveDateTo.Value.ToString());
            //rep.sqlDataSourceAdmission.Queries[0].Parameters[1].Value = DateTime.Now.Date;
            //rep.sqlDataSourceAdmission.Queries[0].Parameters[2].Value = Int32.Parse(Session["DepartmentId"].ToString());

            TestReport rep = new TestReport();
            ASPxDocumentViewerReport.Report = rep;
            ASPxDocumentViewerReport.DataBind();
        }

        protected void ASPxDocumentViewerReport_CacheReportDocument(object sender, DevExpress.XtraReports.Web.CacheReportDocumentEventArgs e)
        {
            //e.Key = this.hf.Value;
            //Page.Session[e.Key] = e.SaveDocumentToMemoryStream();
        }

        protected void ASPxDocumentViewerReport_RestoreReportDocumentFromCache(object sender, DevExpress.XtraReports.Web.RestoreReportDocumentFromCacheEventArgs e)
        {
            //Stream stream = Page.Session[e.Key] as Stream;
            //if (stream != null)
            //    e.RestoreDocumentFromStream(stream);
        }
    }
}