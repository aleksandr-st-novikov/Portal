using DevExpress.Export;
using DevExpress.XtraPrinting;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.OfTransport
{
    public partial class ManageOfTransport : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!(User.IsInRole("Администраторы")
                || User.IsInRole("Служебный транспорт - Полный доступ")
                || User.IsInRole("Служебный транспорт - Чтение")))
            {
                HttpContext.Current.Response.Redirect(ResolveUrl("~/"), false);
                return;
            }

            if (!Page.IsPostBack && !Page.IsCallback)
            {
                Page.Title = "Служебный транспорт";
                ASPxLabelMain.Text = "Журнал планирования и учета поездок на служебном автотранспорте";

                using (EmployeeContext employeeContext = new EmployeeContext())
                {
                    Employee employee = await employeeContext.GetEmployeeByUserAsync(User.Identity.Name);
                    if (employee != null)
                    {
                        Session["EmployeeId"] = employee.Id;
                    }
                }
                Session["DateFrom"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.AddDays(-20).ToString("yyyy-MM-dd 00:00:00"));
                Session["DateTo"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.AddDays(10).ToString("yyyy-MM-dd 23:59:59"));
            }
        }

        protected void ASPxCallbackRefresh_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (ASPxCallbackRefresh.IsCallback)
            {
                Session["DateFrom"] = Convert.ToDateTime(ASPxDateEditGridFrom.Date.ToString("yyyy-MM-dd 00:00:00"));
                Session["DateTo"] = Convert.ToDateTime(ASPxDateEditGridTo.Date.ToString("yyyy-MM-dd 23:59:59"));
            }
        }

        protected void ASPxButtonPrint_Click(object sender, EventArgs e)
        {
            
        }
    }
}