using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.Accessories
{
    public partial class ManageAccessoriesDepartment : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && !Page.IsCallback)
            {
                using (AccessoriesContext accessoriesContext = new AccessoriesContext())
                {
                    AccessoriesType at = await accessoriesContext.getFirstAccessoriesTypeAsync();
                    if (at != null)
                    {
                        Session["AccessoriesTypeId"] = at.Id;
                        ASPxComboBoxAccessoriesType.Text = at.Name;
                    }
                }

                if (!ClientScript.IsStartupScriptRegistered("onKeyDownAccessoriesDepartment"))
                {
                    string script = @"
                        document.onkeydown = onKeyDownAccessoriesDepartment;
                        function onKeyDownAccessoriesDepartment() {
                            if (event.keyCode == 13) {
                                if (ASPxClientGridViewAccessoriesDepartment.IsEditing())
                                ASPxClientGridViewAccessoriesDepartment.UpdateEdit();
                            }
                        }";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "onKeyDownAccessoriesDepartment", script, true);
                }
            }
        }

        protected void ASPxGridViewAccessoriesDepartment_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["AccessoriesTypeId"] = Session["AccessoriesTypeId"]; // ASPxComboBoxAccessoriesType.Value;
        }

        protected void ASPxCallbackRefreshGrid_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            Session["AccessoriesTypeId"] = ASPxComboBoxAccessoriesType.Value;
        }

        protected void ASPxGridViewAccessoriesDepartment_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int id = (int)e.Values[0];
            using (AccessoriesContext accessoriesContext = new AccessoriesContext())
            {
                if (!accessoriesContext.CheckDeleteAccessoriesDepartment(id))
                {
                    e.Cancel = false;
                }
            }
        }

        protected void ASPxGridViewAccessoriesDepartment_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "DepartmentId")
                e.Editor.SetClientSideEventHandler("Init", "function(s, e) { setTimeout(function() {s.Focus();}, 0); }");
        }

        protected void ASPxGridViewAccessoriesDepartment_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["AccessoriesTypeId"] = Session["AccessoriesTypeId"];
        }
    }
}