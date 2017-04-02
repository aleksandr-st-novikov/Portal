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

        protected void ASPxCallbackSetParameters_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            List<string> parameters = e.Parameter.Split(new char[] { '|' }).ToList();
            Session["reportName"] = parameters[0];
            for (int i = 1; i <= parameters.Count - 1; i++)
            {
                Session["param" + i.ToString()] = parameters[i];
            }
            //HttpContext.Current.Response.Redirect(ResolveUrl("~/Reports/DocumentView.aspx"), false);
        }

        protected void ASPxPopupControlReportParams_Load(object sender, EventArgs e)
        {
            ASPxFormLayoutSaveDateFrom.Date = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            ASPxFormLayoutSaveDateTo.Date = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month));
        }
    }
}