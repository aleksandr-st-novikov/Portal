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
                int parentId = 0;
                Int32.TryParse(e.Parameter, out parentId);

                using (ManualContext manualContext = new ManualContext())
                {
                    Models.Entities.Manual manual = await manualContext.FindByIdAsync(parentId);

                    if (manual != null && manual.IsCategory != true && ASPxHiddenFieldEdit.Get("IsEdit").ToString() == "1")
                    {
                        await manualContext.AddOrUpdateAsync(new Models.Entities.Manual
                        {
                            Id = (int)parentId,
                            DateCreate = DateTime.Now,
                            Name = ASPxTextBoxName.Text,
                            MainText = ASPxHtmlEditorMainText.Html,
                            EmployeeId = manual.EmployeeId,
                            IsCategory = false,
                            ParentId = manual.ParentId
                        }, parentId);
                    }

                    if (ASPxHiddenFieldEdit.Get("IsEdit").ToString() == "0")
                    {
                        await manualContext.AddOrUpdateAsync(new Models.Entities.Manual
                        {
                            DateCreate = DateTime.Now,
                            EmployeeId = (int?)Session["EmployeeId"],
                            Name = ASPxTextBoxName.Text,
                            MainText = ASPxHtmlEditorMainText.Html,
                            ParentId = parentId != 0 ? manual != null ? manual.IsCategory == true ? (int?)parentId : null : null : null,
                            IsCategory = false
                        }, -1);
                    }
                }
            }
        }

        protected async void ASPxCallbackPanelAddManual_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (ASPxCallbackPanelAddManual.IsCallback)
            {
                if (ASPxHiddenFieldEdit.Get("IsEdit").ToString() == "0")
                {
                    ASPxPopupControlAddManual.HeaderText = "Создание инструкции";
                    ASPxTextBoxName.Text = ASPxHtmlEditorMainText.Html = null;
                }
                else
                {
                    int id = 0;
                    Int32.TryParse(e.Parameter, out id);
                    if (id == 0) return;

                    using (ManualContext manualContext = new ManualContext())
                    {
                        Models.Entities.Manual manual = await manualContext.FindByIdAsync(id);
                        if (manual == null || manual.IsCategory == true) return;

                        ASPxTextBoxName.Text = manual.Name;
                        ASPxHtmlEditorMainText.Html = manual.MainText;

                        ASPxPopupControlAddManual.HeaderText = "Редактирование";
                    }
                }
            }
        }
    }
}