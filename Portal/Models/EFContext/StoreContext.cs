using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using BLUKM = Portal.BL.UKM;

namespace Portal.Models.EFContext
{
    public class StoreContext : ApplicationContext<Store>
    {
        public async Task PopulateStoreAsync(List<BLUKM.Models.Store> stores)
        {
            if (stores.Count < 1) return;
            foreach (var s in stores)
            {
                List<Store> toAdd = new List<Store>();
                Store store = await context.Store.FirstOrDefaultAsync(st => st.StoreId == s.StoreId);
                if (store == null)
                {
                    toAdd.Add(new Store
                    {
                        StoreId = s.StoreId,
                        Name = s.Name
                    });
                    context.Store.AddRange(toAdd);
                }
                else
                {
                    store.Name = s.Name;
                }
            }
        }
    }
}