using Portal.Models.EFContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.Accessories
{
    public partial class ManageAccessoriesType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && !Page.IsCallback)
            {
                if (!ClientScript.IsStartupScriptRegistered("onKeyDownAccessoriesType"))
                {
                    string script = @"
                        document.onkeydown = onKeyDownAccessoriesType;
                        function onKeyDownAccessoriesType() {
                            if (event.keyCode == 13) {
                                if (ASPxClientGridViewAccessoriesType.IsEditing())
                                ASPxClientGridViewAccessoriesType.UpdateEdit();
                            }
                        }";

                    Page.ClientScript.RegisterStartupScript(this.GetType(),"onKeyDownAccessoriesType", script, true);
                }
            }
        }

        protected void ASPxGridViewAccessoriesType_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int id = (int)e.Values[0];
            using (AccessoriesContext accessoriesContext = new AccessoriesContext())
            {
                if (!accessoriesContext.CheckDeleteAccessoriesType(id))
                {
                    e.Cancel = false;
                }
            }
        }

        protected void ASPxGridViewAccessoriesType_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "Name")
                e.Editor.SetClientSideEventHandler("Init", "function(s, e) { setTimeout(function() {s.Focus();}, 0); }");
        }
    }
}