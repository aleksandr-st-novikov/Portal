using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Portal.Models.EFContext
{
    public class AccessoriesContext : ApplicationContext
    {
        /// <summary>
        /// Проверка возможности удаления AccessoriesType
        /// </summary>
        /// <param name="accessoriesTypeId"></param>
        /// <returns>true, если можно удялять</returns>
        public async Task<bool> CheckDeleteAccessoriesTypeAsync(int accessoriesTypeId)
        {
            bool res = false;

            if (await context.Accessories.FirstOrDefaultAsync(a => a.AccessoriesTypeId == accessoriesTypeId) != null) res = true;
            if (await context.AccessoriesProduct.FirstOrDefaultAsync(a => a.AccessoriesTypeId == accessoriesTypeId) != null) res = true;
            if (await context.AccessoriesDepartment.FirstOrDefaultAsync(a => a.AccessoriesTypeId == accessoriesTypeId) != null) res = true;

            return res;
        }

        internal async Task<AccessoriesType> getFirstAccessoriesTypeAsync()
        {
            AccessoriesType at = await context.AccessoriesType.OrderBy(a => a.Id).FirstOrDefaultAsync();
            return at;
        }

        public bool CheckDeleteAccessoriesType(int accessoriesTypeId)
        {
            bool res = false;

            if (context.Accessories.FirstOrDefault(a => a.AccessoriesTypeId == accessoriesTypeId) != null) res = true;
            if (context.AccessoriesProduct.FirstOrDefault(a => a.AccessoriesTypeId == accessoriesTypeId) != null) res = true;
            if (context.AccessoriesDepartment.FirstOrDefault(a => a.AccessoriesTypeId == accessoriesTypeId) != null) res = true;

            return res;
        }

    }
}