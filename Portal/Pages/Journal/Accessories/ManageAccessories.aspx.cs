using Portal.Models.EFContext;
using Portal.Models.Entities;
using Portal.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.Accessories
{
    public partial class ManageAccessories : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && !Page.IsCallback)
            {
                using (AccessoriesContext accessoriesContext = new AccessoriesContext())
                using (EmployeeContext employeeContext = new EmployeeContext())
                {
                    Employee employee = await employeeContext.GetEmployeeByUserAsync(User.Identity.Name);
                    Session["EmployeeFIO"] = employee.Lastname + " " + employee.Firstname + " " + employee.Patronymic;

                    AccessoriesDepartmentViewModel ad = await accessoriesContext.GetDepartmentAsync(employee.Id);
                    if (ad != null)
                    {
                        Session["AccessoriesDepartmentId"] = ad.Id;
                        Session["AccessoriesDepartmentName"] = String.IsNullOrEmpty(ad.ShortName) ? ad.Name : ad.ShortName;
                    }

                    AccessoriesType at = await accessoriesContext.getFirstAccessoriesTypeAsync();
                    if (at != null)
                    {
                        Session["AccessoriesTypeId"] = at.Id;
                        Session["AccessoriesTypeName"] = ASPxComboBoxAccessoriesType.Text = at.Name;
                    }
                }

                DateTime fromDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, Models.Data.AccessoriesFirstDay, 0, 0, 0);
                DateTime toDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, Models.Data.AccessoriesLastDay, 0, 0, 0);
                if (DateTime.Now >= fromDate && DateTime.Now <= toDate)
                {
                    ASPxButtonCreate.Visible = true;
                }

                ASPxGridViewAccessories.FocusedRowIndex = 0;
            }
        }

        protected void ASPxCallbackRefreshGrid_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            Session["AccessoriesTypeId"] = ASPxComboBoxAccessoriesType.Value;
            Session["AccessoriesTypeName"] = ASPxComboBoxAccessoriesType.Text;
        }

        protected void ASPxGridViewAccessories_FocusedRowChanged(object sender, EventArgs e)
        {
            Session["AccessoriesId"] = ASPxGridViewAccessories.GetRowValues(ASPxGridViewAccessories.FocusedRowIndex, "Id");
            Session["AccessoriesCanEdit"] =
                int.Parse(ASPxGridViewAccessories.GetRowValues(ASPxGridViewAccessories.FocusedRowIndex, "Status").ToString()) == (int)AccessoriesStatus.Agreed ? "0" : "1";
            Session["AccessoriesCanEdit"] =
                DateTime.Now.Month >= ((DateTime)ASPxGridViewAccessories.GetRowValues(ASPxGridViewAccessories.FocusedRowIndex, "DateDocument")).Month ? "0" : Session["AccessoriesCanEdit"];
        }

    }
}