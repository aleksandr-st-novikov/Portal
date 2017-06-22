using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace Portal.Pages.Maintenance.DepartmentWork
{
    public partial class ManageDepartmentWork : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!(User.IsInRole("Администраторы")))
            {
                HttpContext.Current.Response.Redirect(ResolveUrl("~/"), false);
                return;
            }

            if (!Page.IsPostBack && !Page.IsCallback)
            {
                Page.Title = "Работа отдела";
                using (DepartmentContext context = new DepartmentContext())
                using (EmployeeContext employeeContext = new EmployeeContext())
                {
                    Department department = await context.GetDepartmentByUserAsync(User.Identity.Name);
                    if (department != null)
                    {
                        ASPxLabelDepartmentWork.Text = "Работа отдела: " + department.Name;
                        Session["DepartmentId"] = department.Id;
                        Session["DepartmentNode"] = String.Join(",", (await context.GetNodeDepartmentAsync(department.Id)).ToArray());
                    }

                    Employee employee = await employeeContext.GetEmployeeByUserAsync(User.Identity.Name);
                    if(employee != null)
                    {
                        Session["EmployeeId"] = employee.Id;
                    }
                }

            }
        }

        protected async void ASPxCallbackSaveWork_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (Page.IsValid && ASPxCallbackSaveWork.IsCallback)
            {
                using (DepartmentWorkContext departmentWorkContext = new DepartmentWorkContext())
                {
                    await departmentWorkContext.AddOrUpdateAsync(new Models.Entities.DepartmentWork
                    {
                        DepartmentId = (int)Session["DepartmentId"],
                        FromWhom = ASPxComboBoxFromWhom.Text,
                        RegisterDate = DateTime.Now,
                        RegisterDescription = ASPxMemoDescription.Text,
                        RegisterEmployeeId = (int)Session["EmployeeId"],
                        RegisterUserId = User.Identity.GetUserId()
                    }, -1);
                }
            }
        }

    }
}