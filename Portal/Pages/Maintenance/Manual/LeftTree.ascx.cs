using Portal.Models.EFContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Maintenance.DepartmentWork
{
    public partial class LeftTree : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void ASPxCallbackSaveCategory_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (Page.IsValid && ASPxCallbackSaveCategory.IsCallback)
            {
                using (ManualContext manualContext = new ManualContext())
                {
                    await manualContext.AddOrUpdateAsync(new Models.Entities.Manual
                    {
                        Name = ASPxTextBoxNameCategory.Text,
                        ParentId = ASPxComboBoxParentCategory.Value == null? (int?)null: Convert.ToInt32(ASPxComboBoxParentCategory.Value),
                        IsCategory = true
                    }, -1);

                }
            }
        }

        protected void ASPxTreeListCategory_CustomDataCallback(object sender, DevExpress.Web.ASPxTreeList.TreeListCustomDataCallbackEventArgs e)
        {
            ASPxTreeListCategory.DataBind();
        }
    }
}