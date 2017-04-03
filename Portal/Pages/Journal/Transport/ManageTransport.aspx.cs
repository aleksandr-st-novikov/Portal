using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.Transport
{
    public partial class ManageTransport : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!(User.IsInRole("Администраторы")
                || User.IsInRole("Транспорт - Руководители")
                || User.IsInRole("Транспорт - Служебный вход")))
            {
                HttpContext.Current.Response.Redirect(ResolveUrl("~/"), false);
                return;
            }

            if (!Page.IsPostBack && !Page.IsCallback)
            {
                Page.Title = "Транспорт";

                using (DepartmentContext context = new DepartmentContext())
                {
                    Department department = await context.GetDepartmentByUserAsync(User.Identity.Name);
                    if (department != null)
                    {
                        ASPxLabelDepartment.Text = "Транспорт: " + department.Name;
                        Session["DepartmentId"] = department.Id;
                    }
                }
            }

            if (User.IsInRole("Транспорт - Руководители"))
            {
                ASPxComboBoxEmployee.DataSourceID = "SqlDataSourceEmployeeHeadDepartment";
            }

            if(User.IsInRole("Администраторы")
                || User.IsInRole("Транспорт - Служебный вход"))
            {
                ASPxComboBoxEmployee.DataSourceID = "SqlDataSourceEmployeeEntrance";
            }
        }

        protected void ASPxCallbackAdd_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {

        }
    }
}