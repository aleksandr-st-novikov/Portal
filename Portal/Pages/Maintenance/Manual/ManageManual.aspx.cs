using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Maintenance.Manual
{
    public partial class ManageManual : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && !Page.IsCallback)
            {
                using (DepartmentContext context = new DepartmentContext())
                using (EmployeeContext employeeContext = new EmployeeContext())
                {
                    Department department = await context.GetDepartmentByUserAsync(User.Identity.Name);
                    if (department != null)
                    {
                        Session["DepartmentId"] = department.Id;
                        Session["DepartmentNode"] = String.Join(",", (await context.GetNodeDepartmentAsync(department.Id)).ToArray());
                    }

                    Employee employee = await employeeContext.GetEmployeeByUserAsync(User.Identity.Name);
                    if (employee != null)
                    {
                        Session["EmployeeId"] = employee.Id;
                    }
                }

                if (!ClientScript.IsStartupScriptRegistered("manual"))
                {
                    string script = @"var nodeKey;";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "manual", script, true);
                }
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && !Page.IsCallback)
            {
                Page.Title = "Поддержка - Инструкции";
            }
        }

    }
}