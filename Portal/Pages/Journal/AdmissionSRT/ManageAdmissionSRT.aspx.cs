using Portal.Models;
using Portal.Models.EFContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.AdmissionSRT
{
    public partial class ManageAdmissionSRT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
                ASPxLabelDepartment.Text = context.GetDepartmentByUser(User.Identity.Name);
            }
                
        }

        protected void ASPxCallbackImportEmployee_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {

        }
    }
}