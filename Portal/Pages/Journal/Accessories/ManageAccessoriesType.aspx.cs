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
    }
}