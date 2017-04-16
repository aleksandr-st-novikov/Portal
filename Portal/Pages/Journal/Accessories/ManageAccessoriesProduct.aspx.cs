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
    public partial class ManageAccessoriesProduct : System.Web.UI.Page
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
            }
        }

        protected void ASPxCallbackRefreshGrid_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            Session["AccessoriesTypeId"] = ASPxComboBoxAccessoriesType.Value;
        }

        protected void ASPxGridViewAccessoriesProduct_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["AccessoriesTypeId"] = Session["AccessoriesTypeId"];
        }

        protected void ASPxGridViewAccessoriesProduct_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int id = (int)e.Values[0];
            using (AccessoriesContext accessoriesContext = new AccessoriesContext())
            {
                if (!accessoriesContext.CheckDeleteAccessoriesProduct(id))
                {
                    e.Cancel = false;
                }
            }
        }

        protected void ASPxGridViewAccessoriesProduct_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["Price"] = 0;
            e.NewValues["IsActive"] = true;
            e.NewValues["Unit"] = "шт.";
            e.NewValues["QuantityPerOne"] = 1;
        }
    }
}