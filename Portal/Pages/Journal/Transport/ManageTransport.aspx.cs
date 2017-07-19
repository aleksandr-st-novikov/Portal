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
    public partial class ManageTransport1 : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!(User.IsInRole("Администраторы")
                || User.IsInRole("Журналы - Транспорт - Руководители")
                || User.IsInRole("Журналы - Транспорт - Руководители - Все сотрудники")
                || User.IsInRole("Журналы - Транспорт - Служебный вход")))
            {
                HttpContext.Current.Response.Redirect(ResolveUrl("~/"), false);
                return;
            }

            if (!Page.IsPostBack && !Page.IsCallback)
            {
                using (DepartmentContext context = new DepartmentContext())
                {
                    Department department = await context.GetDepartmentByUserAsync(User.Identity.Name);
                    if (department != null)
                    {
                        if (User.IsInRole("Журналы - Транспорт - Руководители"))
                        {
                            ASPxLabelDepartment.Text = "Транспорт (развоз сотрудников): " + department.Name;
                        }
                        else
                        {
                            ASPxLabelDepartment.Text = "Транспорт (развоз сотрудников)";
                        }
                        Session["DepartmentId"] = department.Id;
                        Session["DepartmentNode"] = String.Join(",", (await context.GetNodeDepartmentAsync(department.Id)).ToArray());
                    }
                }

                TimeSpan start = new TimeSpan(0, 0, 0);
                TimeSpan end = new TimeSpan(5, 0, 0);
                TimeSpan now = DateTime.Now.TimeOfDay;

                if ((now > start) && (now < end))
                {
                    Session["DateFromTransport"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd 00:00:00"));
                    Session["DateToTransport"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd 23:59:59"));
                }
                else
                {
                    Session["DateFromTransport"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd 00:00:00"));
                    Session["DateToTransport"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd 23:59:59"));
                }

                //if (User.IsInRole("Журналы - Транспорт - Служебный вход"))
                //{
                //    Session["DateFrom"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd 00:00:00"));
                //    Session["DateTo"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.AddDays(1).ToString("yyyy-MM-dd 23:59:59"));
                //}
                //else
                //{
                //    Session["DateFrom"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.AddDays(-20).ToString("yyyy-MM-dd 00:00:00"));
                //    Session["DateTo"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.AddDays(10).ToString("yyyy-MM-dd 23:59:59"));
                //}

            }

            if ((User.IsInRole("Администраторы")
                || User.IsInRole("Журналы - Транспорт - Служебный вход")))
            {
                ASPxButtonTransportPrint.Visible = true;
                TransportReportViewPopup.Visible = true;
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            Page.Title = "Журналы - Транспорт (развоз сотрудников)";
        }

        protected void ASPxCallbackRefresh_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (ASPxCallbackRefresh.IsCallback)
            {
                Session["DateFromTransport"] = Convert.ToDateTime(ASPxDateEditGridFrom.Date.ToString("yyyy-MM-dd 00:00:00"));
                Session["DateToTransport"] = Convert.ToDateTime(ASPxDateEditGridTo.Date.ToString("yyyy-MM-dd 23:59:59"));
            }
        }
    }
}