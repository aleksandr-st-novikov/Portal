using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Portal.Models.EFContext
{
    public class AdmissionSRTContext : ApplicationContext
    {
        public async Task PopulateByDepartmentAsync(int departmentId)
        {
            //отбираем все подчиненные подразделения / 3 уровня вложения / без рекурсии
            List<int> departments = new List<int>();
            departments.Add(departmentId);

            List<Department> tmpDep = await context.Department.Where(d => d.ParentId == departmentId).ToListAsync();
            if(tmpDep.Count() != 0)
            {
                departments.AddRange(tmpDep.Select(d => d.Id).ToList());
                foreach(Department dep in tmpDep)
                {
                    List<Department> tmpDep1 = await context.Department.Where(d => d.ParentId == dep.Id).ToListAsync();
                    if(tmpDep1.Count() != 0)
                    {
                        departments.AddRange(tmpDep1.Select(d => d.Id).ToList());
                    }
                }
            }

            List<Employee> employees = await context.Employee.Where(d => departments.Contains((int)d.DepartmentId) && d.IsWork == true).ToListAsync();
            foreach(Employee empl in employees)
            {
                AdmissionSRT entry = await context.AdmissionSRT.Where(a => a.DepartmentId == empl.DepartmentId && a.EmployeeId == empl.Id).FirstOrDefaultAsync();
                if(entry == null)
                {
                    context.AdmissionSRT.Add(new AdmissionSRT()
                    {
                        EmployeeId = empl.Id,
                        DepartmentId = empl.DepartmentId,
                        PositionId = empl.PositionId
                    });
                }
                else
                {
                    entry.DepartmentId = empl.DepartmentId;
                    entry.PositionId = empl.PositionId;
                }
            }
        }
       
    }
}