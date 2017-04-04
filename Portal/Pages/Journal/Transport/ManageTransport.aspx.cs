using DevExpress.Web;
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
                Session["DateFrom"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.AddDays(-3).ToString("yyyy-MM-dd 00:00:00"));
                Session["DateTo"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.AddDays(1).ToString("yyyy-MM-dd 00:00:00"));
                //Session["DateFrom"] = DateTime.Now.AddDays(-3).ToString("yyyy-MM-dd");
                //Session["DateTo"] = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

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
                ASPxGridViewHeadDepartment.DataSourceID = "SqlDataSourceTransportHeadDepartment";
                ((GridViewDataComboBoxColumn)ASPxGridViewHeadDepartment.Columns["EmployeeId"]).PropertiesComboBox.DataSourceID = "SqlDataSourceEmployeeHeadDepartment";
            }

            if (User.IsInRole("Администраторы")
                || User.IsInRole("Транспорт - Служебный вход"))
            {
                ASPxComboBoxEmployee.DataSourceID = "SqlDataSourceEmployeeEntrance";
                ASPxGridViewHeadDepartment.DataSourceID = "SqlDataSourceTransportEntrance";
                ((GridViewDataComboBoxColumn)ASPxGridViewHeadDepartment.Columns["EmployeeId"]).PropertiesComboBox.DataSourceID = "SqlDataSourceEmployeeEntrance";
            }
        }

        protected async void ASPxCallbackAdd_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (Page.IsValid)
            {
                using (TransportContext context = new TransportContext())
                {
                    Portal.Models.Entities.Transport transport = new Portal.Models.Entities.Transport()
                    {
                        EmployeeId = Convert.ToInt32(ASPxComboBoxEmployee.Value),
                        DateTransport = Convert.ToDateTime(ASPxDateEditTransport.Value),
                        Address = Convert.ToString(ASPxTextBoxAddress.Value)
                    };
                    await context.AddTransportAsync(transport);
                    await context.SaveChangesAsync();
                }
            }
        }

        protected void ASPxCallbackRefreshData_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            Session["DateFrom"] = Convert.ToDateTime(((DateTime)ASPxDateEditGridFrom.Value).ToString("yyyy-MM-dd 00:00:00"));
            Session["DateTo"] = Convert.ToDateTime(((DateTime)ASPxDateEditGridTo.Value).ToString("yyyy-MM-dd 00:00:00"));
        }

        protected void ASPxPopupControlAddRecord_Load(object sender, EventArgs e)
        {
            ASPxDateEditTransport.Value = Convert.ToDateTime((DateTime.Now).ToString("yyyy-MM-dd 00:00:00"));
        }
    }
}