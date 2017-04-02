using DevExpress.XtraPrinting;
using DevExpress.XtraReports.UI;
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
                    Department department = await context.GetDepartmentByUserAsync(User.Identity.Name);
                    if (department != null)
                    {
                        ASPxLabelDepartment.Text = "Допуски сотрудников: " + department.Name;
                        Session["DepartmentId"] = department.Id;
                    }
                }
            }
        }

        protected async void ASPxCallbackImportEmployee_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (Session["DepartmentId"] != null)
            {
                using (AdmissionContext context = new AdmissionContext())
                {
                    await context.PopulateByDepartmentAsync((int)Session["DepartmentId"]);
                    await context.SaveChangesAsync();
                }
            }
        }

        protected void ASPxPopupControlReportParams_Load(object sender, EventArgs e)
        {
            ASPxDateEditFrom.Date = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            ASPxDateEditTo.Date = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month));
        }

    }
}