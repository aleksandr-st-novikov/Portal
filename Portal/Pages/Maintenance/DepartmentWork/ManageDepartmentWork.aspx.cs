using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                {
                    Department department = await context.GetDepartmentByUserAsync(User.Identity.Name);
                    if (department != null)
                    {
                        ASPxLabelDepartmentWork.Text = "Работа отдела: " + department.Name;
                        Session["DepartmentId"] = department.Id;
                        Session["DepartmentNode"] = String.Join(",", (await context.GetNodeDepartmentAsync(department.Id)).ToArray());
                    }
                }



            }
        }

        protected void ASPxCallbackSaveWork_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (Page.IsValid && ASPxCallbackSaveWork.IsCallback)
            {
                //if (!User.IsInRole("Администраторы"))
                //{
                //    if (Convert.ToDateTime(ASPxDateEditTransport.Value) < new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0))
                //    {
                //        return;
                //    }
                //}
                //using (TransportContext context = new TransportContext())
                //{
                //    Portal.Models.Entities.Transport transport = new Portal.Models.Entities.Transport()
                //    {
                //        EmployeeId = Convert.ToInt32(ASPxComboBoxEmployee.Value),
                //        DateTransport = Convert.ToDateTime(ASPxDateEditTransport.Value),
                //        Address = Convert.ToString(ASPxComboBoxAddress.Value)
                //    };
                //    await context.AddTransportAsync(transport);
                //    await context.SaveChangesAsync();
                //}
            }
        }
    }
}