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
                int? parentId = (int?)null;
                if (!String.IsNullOrEmpty(e.Parameter)) parentId = Int32.Parse(e.Parameter);

                using (ManualContext manualContext = new ManualContext())
                {
                    Models.Entities.Manual manual = await manualContext.FindByIdAsync((int)parentId);

                    if (manual.IsCategory != true && ASPxHiddenFieldEdit.Get("IsEdit").ToString() == "1")
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
                        }, (int)parentId);
                    }

                    if (ASPxHiddenFieldEdit.Get("IsEdit").ToString() == "0")
                    {
                        await manualContext.AddOrUpdateAsync(new Models.Entities.Manual
                        {
                            DateCreate = DateTime.Now,
                            EmployeeId = (int?)Session["EmployeeId"],
                            Name = ASPxTextBoxName.Text,
                            MainText = ASPxHtmlEditorMainText.Html,
                            ParentId = manual.IsCategory == true ? parentId : null,
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
                }
                else
                {
                    int id = 0;
                    if (!String.IsNullOrEmpty(e.Parameter))
                    {
                        id = Int32.Parse(e.Parameter);
                    }
                    else
                    {
                        return;
                    }

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