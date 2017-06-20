using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLUKM = Portal.BL.UKM;

namespace Portal.Pages.Maintenance.UKM
{
    public partial class Setting : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            List<Store> stores = new List<Store>();
            using (StoreContext storeContext = new StoreContext())
            {
                await storeContext.PopulateStoreAsync(await BLUKM.Methods.GetDataAsync());
                await storeContext.SaveChangesAsync();
            }
        }

    }
}