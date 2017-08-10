using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.Exit
{
    public partial class ManageExit : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!(User.IsInRole("Администраторы")
                || Context.User.IsInRole("Журналы - Согласование выходов - Руководители")
                || Context.User.IsInRole("Журналы - Согласование выходов - Руководители - Все сотрудники")
                || Context.User.IsInRole("Журналы - Согласование выходов - Служебный вход")))
            {
                HttpContext.Current.Response.Redirect(ResolveUrl("~/"), false);
                return;
            }

            if (!Page.IsPostBack && !Page.IsCallback)
            {
                using (DepartmentContext context = new DepartmentContext())
                using (EmployeeContext employeeContext = new EmployeeContext())
                {
                    Employee employee = await employeeContext.GetEmployeeByUserAsync(User.Identity.Name);
                    Session["PetmitEmployeeId"] = employee.Id;

                    Department department = await context.GetDepartmentByUserAsync(User.Identity.Name);
                    if (department != null)
                    {
                        if (User.IsInRole("Журналы - Согласование выходов - Руководители"))
                        {
                            ASPxLabelDepartment.Text = "Согласование выходов/входов сотрудников: " + department.Name;
                        }
                        else
                        {
                            ASPxLabelDepartment.Text = "Согласование выходов/входов сотрудников";
                        }
                        Session["DepartmentId"] = department.Id;
                        Session["DepartmentNode"] = String.Join(",", (await context.GetNodeDepartmentAsync(department.Id)).ToArray());
                    }
                }

                //Session["DateFromExit"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd 00:00:00"));
                //Session["DateToExit"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd 23:59:59"));
                Session["DateFromExit"] = Convert.ToDateTime(DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd 00:00:00"));
                Session["DateToExit"] = Convert.ToDateTime(DateTime.Now.AddMonths(1).ToString("yyyy-MM-dd 23:59:59"));
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            Page.Title = "Журналы - Согласование выходов/входов сотрудников";
        }
    }
}