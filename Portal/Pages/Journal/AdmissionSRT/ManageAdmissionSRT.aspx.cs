using Portal.Models;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.AdmissionSRT
{
    public partial class ManageAdmissionSRT : System.Web.UI.Page
    {
        private Department department;
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("Администраторы")
                || Context.User.IsInRole("Допуски работников СРТ"))
            {
                Response.Redirect("/");
                return;
            }

            ASPxLoadingPanelLoad.ContainerElementID = "ASPxPanel1";
            using (DepartmentContext context = new DepartmentContext())
            {
                department = await context.GetDepartmentByUserAsync(User.Identity.Name);
                if (department != null)
                {
                    ASPxLabelDepartment.Text = department.Name;
                    Session["DepartmentId"] = department.Id;
                }
            }
                
        }

        protected async void ASPxCallbackImportEmployee_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (department != null)
            {
                using (AdmissionSRTContext context = new AdmissionSRTContext())
                {
                    await context.PopulateByDepartmentAsync(department.Id);
                    await context.SaveChangesAsync();
                }
            }
        }
    }
}