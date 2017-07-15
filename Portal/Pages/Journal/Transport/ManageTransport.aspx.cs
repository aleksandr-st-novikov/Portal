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
                || User.IsInRole("Журналы - Транспорт - Служебный вход")))
            {
                HttpContext.Current.Response.Redirect(ResolveUrl("~/"), false);
                return;
            }

            if (!Page.IsPostBack && !Page.IsCallback)
            {
                Page.Title = "Транспорт (развоз сотрудников)";


                using (DepartmentContext context = new DepartmentContext())
                {
                    Department department = await context.GetDepartmentByUserAsync(User.Identity.Name);
                    if (department != null)
                    {
                        if (!User.IsInRole("Журналы - Транспорт - Служебный вход"))
                        {
                            ASPxLabelDepartment.Text = "Транспорт (развоз сотрудников): " + department.Name;
                        }
                        Session["DepartmentId"] = department.Id;
                        Session["DepartmentNode"] = String.Join(",", (await context.GetNodeDepartmentAsync(department.Id)).ToArray());
                    }
                }

                if (User.IsInRole("Журналы - Транспорт - Служебный вход"))
                {
                    Session["DateFrom"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd 00:00:00"));
                    Session["DateTo"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.AddDays(1).ToString("yyyy-MM-dd 23:59:59"));
                }
                else
                {
                    Session["DateFrom"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.AddDays(-20).ToString("yyyy-MM-dd 00:00:00"));
                    Session["DateTo"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.AddDays(10).ToString("yyyy-MM-dd 23:59:59"));
                }

            }

            if ((User.IsInRole("Администраторы")
                || User.IsInRole("Журналы - Транспорт - Служебный вход")))
            {
                ASPxButtonTransportPrint.Visible = true;
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
    }
}