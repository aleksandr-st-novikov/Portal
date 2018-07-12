using DevExpress.Web;
using Portal.Models.EFContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Admin.Employee
{
    public partial class ManageEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(User.IsInRole("Администраторы")))
            {
                HttpContext.Current.Response.Redirect(ResolveUrl("~/"), false);
                return;
            }
        }

        protected void ASPxGridViewEmployee_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridViewEditFormEventArgs e)
        {
            ASPxImage imagePhoto = ASPxGridViewEmployee.FindEditFormTemplateControl("ASPxImagePhoto") as ASPxImage;
            using (EmployeeContext employeeContext = new EmployeeContext())
            {
                int id = (int)ASPxGridViewEmployee.GetRowValues(ASPxGridViewEmployee.EditingRowVisibleIndex, "Id");
                Portal.Models.Entities.Employee employee = employeeContext.FindById(id);

                imagePhoto.ImageUrl = @"~\Content\Photo\" + employee.FullName.Trim() + ".jpg";
            }
        }
    }
}