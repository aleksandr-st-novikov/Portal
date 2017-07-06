using Portal.Models.EFContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Maintenance.Manual
{
    public partial class AddManual : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void ASPxCallbackSaveManual_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (Page.IsValid && ASPxCallbackSaveManual.IsCallback)
            {
                using (ManualContext manualContext = new ManualContext())
                {
                    await manualContext.AddOrUpdateAsync(new Models.Entities.Manual
                    {
                        DateCreate = DateTime.Now,
                        EmployeeId = (int?)Session["EmployeeId"],
                        Name = ASPxTextBoxName.Text,
                        MainText = ASPxHtmlEditorMainText.Html
                    }, -1);
                }
            }
        }

    }
}