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
        protected void Page_Load(object sender, EventArgs e)
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
                using (EmployeeContext employeeContext = new EmployeeContext())
                {
                    Employee employee = employeeContext.GetEmployeeByUser(Context.User.Identity.Name);
                    if (employee != null)
                    {
                        Session["PetmitEmployeeId"] = Session["EmployeeId"] = employee.Id;
                        if (User.IsInRole("Журналы - Согласование выходов - Руководители"))
                        {
                            ASPxLabelDepartment.Text = "Согласование выходов/входов сотрудников: " + employee.Department.Name;
                        }
                        else
                        {
                            ASPxLabelDepartment.Text = "Согласование выходов/входов сотрудников";
                        }
                    }
                }

                //Session["DateFromExit"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd 00:00:00"));
                //Session["DateToExit"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd 23:59:59"));
                Session["DateFromExit"] = Convert.ToDateTime(DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd 00:00:00"));
                Session["DateToExit"] = Convert.ToDateTime(DateTime.Now.AddMonths(1).ToString("yyyy-MM-dd 23:59:59"));
            }


            if (!ClientScript.IsClientScriptBlockRegistered("setVarAdmin"))
            {
                string script = "";
                if (User.IsInRole("Администраторы"))
                {
                    script = @"var isAdmin = true;";
                }
                else if (Context.User.IsInRole("Журналы - Согласование выходов - Руководители")
                        || Context.User.IsInRole("Журналы - Согласование выходов - Руководители - Все сотрудники")
                        || Context.User.IsInRole("Журналы - Согласование выходов - Служебный вход"))
                {
                    script = @"var isAdmin = false;";
                }
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "setVarAdmin", script, true);
            }

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            Page.Title = "Журналы - Согласование выходов/входов сотрудников";
        }

    }
}