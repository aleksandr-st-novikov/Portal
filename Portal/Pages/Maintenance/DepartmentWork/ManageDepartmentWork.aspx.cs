using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Portal.BL.Utils;
using System.Threading.Tasks;

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

                    //send e-mail
                    string message = $"<pre><p><b>От кого заявка:</b>{ASPxComboBoxFromWhom.Text}</p><p><b>Описание:</b></br>{ASPxMemoDescription.Text}</p></pre>";
                    await Task.Run(() => Service.SendMessage("novikov.it@bobruysk.korona.by", "Новое задание", message));
                }
            }
        }

        protected async void ASPxCallbackSaveClose_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (Page.IsValid && ASPxCallbackSaveClose.IsCallback && ASPxHiddenFieldId.Get("Id") != null)
            {
                int id = 0;
                if (Int32.TryParse(ASPxHiddenFieldId.Get("Id").ToString(), out id))
                    {
                    using (DepartmentWorkContext departmentWorkContext = new DepartmentWorkContext())
                    {
                        Models.Entities.DepartmentWork departmentWork = await departmentWorkContext.FindByIdAsync(id);
                        departmentWork.CloseDate = DateTime.Now;
                        departmentWork.CloseEmployeeId = departmentWork.CloseEmployeeId ?? (int)Session["EmployeeId"];
                        departmentWork.CloseUserId = User.Identity.GetUserId();
                        departmentWork.CloseDescription = ASPxMemoCloseDescription.Text;

                        await departmentWorkContext.AddOrUpdateAsync(departmentWork, id);
                    }
                }
            }
        }
    }
}