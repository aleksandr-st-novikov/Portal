using Portal.Models.EFContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Maintenance.Manual
{
    public partial class ViewManual : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void ASPxCallbackPanelViewManual_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            using (ManualContext manualContext = new ManualContext())
            {
                int id = 0;
                Int32.TryParse(e.Parameter,out id);
                if (id == 0) return;

                Models.Entities.Manual manual = await manualContext.FindByIdAsync(id);

                if (manual == null) return;
                ASPxHiddenFieldManual.Set("IsCategory", manual.IsCategory != true ? "0" : "1");

                if (manual.IsCategory == true) return;
                ASPxLabelAuthorDate.Text = $"{manual.Employee.FIO} / {((DateTime)manual.DateCreate).ToString("g")}";
                ASPxLabelTitle.Text = manual.Name;
                LiteralMainText.Text = manual.MainText;
            }
        }
    }
}