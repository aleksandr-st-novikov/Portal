using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using System.Data.Entity;

namespace Portal.Models.EFContext
{
    public class DepartmentWorkContext : ApplicationContext<DepartmentWork>
    {
        internal async Task<int> GetDepartmentIdByIdAsync(int id)
        {
            if(id > 0)
            {
                return (await context.DepartmentWork.FindAsync(id)).DepartmentId;
            }
            return 0;
        }
    }
}