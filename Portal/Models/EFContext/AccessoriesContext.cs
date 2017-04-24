using Portal.Models.Entities;
using Portal.Models.ViewModel;
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
        internal async Task<bool> CheckDeleteAccessoriesTypeAsync(int accessoriesTypeId)
        {
            bool res = false;

            if (await context.Accessories.FirstOrDefaultAsync(a => a.AccessoriesTypeId == accessoriesTypeId) != null) res = true;
            if (await context.AccessoriesProduct.FirstOrDefaultAsync(a => a.AccessoriesTypeId == accessoriesTypeId) != null) res = true;
            if (await context.AccessoriesDepartment.FirstOrDefaultAsync(a => a.AccessoriesTypeId == accessoriesTypeId) != null) res = true;

            return res;
        }

        internal async Task<AccessoriesDepartmentViewModel> GetDepartmentAsync(int employeeId)
        {
            AccessoriesDepartmentViewModel res = await (from ad in context.AccessoriesDepartment
                                                        join d in context.Department on ad.DepartmentId equals d.Id
                                                        where ad.EmployeeId == employeeId
                                                        select new AccessoriesDepartmentViewModel { Id = ad.Id, Name = d.Name, ShortName = d.ShortName })
                                                        .FirstOrDefaultAsync();
            return res;
        }

        internal async Task<AccessoriesType> getFirstAccessoriesTypeAsync()
        {
            return await context.AccessoriesType.OrderBy(a => a.Id).FirstOrDefaultAsync();
        }

        internal bool CheckDeleteAccessoriesType(int accessoriesTypeId)
        {
            bool res = false;
            if (context.Accessories.FirstOrDefault(a => a.AccessoriesTypeId == accessoriesTypeId) != null) res = true;
            if (context.AccessoriesProduct.FirstOrDefault(a => a.AccessoriesTypeId == accessoriesTypeId) != null) res = true;
            if (context.AccessoriesDepartment.FirstOrDefault(a => a.AccessoriesTypeId == accessoriesTypeId) != null) res = true;
            return res;
        }

        internal bool CheckDeleteAccessoriesProduct(int accessoriesProductId)
        {
            bool res = false;
            if (context.AccessoriesTable.FirstOrDefault(a => a.AccessoriesProductId == accessoriesProductId) != null) res = true;
            return res;
        }

        internal bool CheckDeleteAccessoriesDepartment(int accessoriesDepartmentId)
        {
            bool res = false;
            if (context.Accessories.FirstOrDefault(a => a.AccessoriesDepartmentId == accessoriesDepartmentId) != null) res = true;
            return res;
        }

        internal int PopulateAccessoriesProduct(int departmentId, int typeId, DateTime dateAccessories)
        {
            //создаем заявку
            Accessories accessories = new Accessories()
            {
                AccessoriesDepartmentId = departmentId,
                AccessoriesTypeId = typeId,
                DateDocument = dateAccessories,
                Status = (int)StatusAccessories.Created
            };
            Accessories entry = context.Accessories.FirstOrDefault(a => a.AccessoriesDepartmentId == accessories.AccessoriesDepartmentId &&
                a.AccessoriesTypeId == accessories.AccessoriesTypeId && a.DateDocument == accessories.DateDocument);
            if (entry != null)
            {
                accessories = entry;
            }
            else
            {
                context.Accessories.Add(accessories);
                context.SaveChanges();
            }

            if (accessories.Status == (int)StatusAccessories.Agreed)
            {
                return accessories.Id;
            }

            //отбираем товары для категории
            List<AccessoriesProduct> accessoriesProductList = context.AccessoriesProduct
                .Where(a => a.AccessoriesTypeId == typeId && a.IsActive == true)
                .ToList();

            //заполняем спецификацию заявки
            List<AccessoriesTable> accessoriesTableList = new List<AccessoriesTable>();
            if (entry == null)
            {
                foreach (AccessoriesProduct item in accessoriesProductList)
                {
                    accessoriesTableList.Add(new AccessoriesTable()
                    {
                        AccessoriesId = accessories.Id,
                        AccessoriesProductId = item.Id
                    });
                }
            }
            else
            {
                List<int> accessoriesTableListEntry = context.AccessoriesTable
                    .Where(a => a.AccessoriesId == accessories.Id)
                    .Select(a => a.AccessoriesProductId)
                    .ToList();
                foreach (AccessoriesProduct item in accessoriesProductList)
                {
                    if (!accessoriesTableListEntry.Contains(item.Id))
                    {
                        accessoriesTableList.Add(new AccessoriesTable()
                        {
                            AccessoriesId = accessories.Id,
                            AccessoriesProductId = item.Id
                        });
                    }
                }
            }
            context.AccessoriesTable.AddRange(accessoriesTableList);
            context.SaveChanges();

            return accessories.Id;
        }
    }
}