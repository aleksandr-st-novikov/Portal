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
                        //ASPxComboBoxAccessoriesType.Value = Session["AccessoriesTypeId"] = at.Id;
                        Session["AccessoriesTypeId"] = at.Id;
                        ASPxComboBoxAccessoriesType.Text = at.Name;
                    }

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

    }
}