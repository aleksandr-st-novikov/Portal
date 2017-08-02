using Microsoft.AspNet.Identity.EntityFramework;
using Portal.Models.Entities;
using Portal.Models.ViewModel;
using Portal.Pages.Admin.Employee;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Portal.Models.EFContext
{
    public class DepartmentContext : ApplicationContext<Department>
    {
        public async Task AddDepartmentAsync(Department department)
        {
            Department entry = await context.Department.FirstOrDefaultAsync(d => d.Name == department.Name);
            if (entry == null)
            {
                context.Department.Add(department);
            }
        }

        public async Task AddRangeDepartmentAsync(List<string> departments)
        {
            foreach (string dep in departments)
            {
                Department entry = await context.Department.FirstOrDefaultAsync(d => d.Name == dep);
                if (entry == null)
                {
                    Department forAdd = new Department()
                    {
                        Name = dep,
                        IsActive = true
                    };
                    context.Department.Add(forAdd);
                }
                else
                {
                    entry.Name = dep;
                    entry.IsActive = true;
                }
            }
        }

        public async Task SetHeadDepartmentAsync(List<MidData> data)
        {
            foreach (var dat in data)
            {
                Department dep = await context.Department.FirstOrDefaultAsync(d => d.Name == dat.Department);
                if (dep != null && dep.NotChangeHead != true)
                {
                    Employee empl = await context.Employee.FirstOrDefaultAsync(e => e.TabN == dat.TabNo);
                    if (dep != null)
                    {
                        dep.HeadId = empl.Id;
                    }
                }
            }
        }

        public async Task<Department> GetDepartmentByUserAsync(string userName)
        {
            ApplicationDbContext mycontext = new ApplicationDbContext();
            UserStore<ApplicationUser> userStore = new UserStore<ApplicationUser>(mycontext);
            ApplicationUserManager UserManager = new ApplicationUserManager(userStore);
            ApplicationUser user = await UserManager.FindByNameAsync(userName);

            return user.Employee.Department;
        }

        public Department GetDepartmentByUser(string userName)
        {
            ApplicationDbContext mycontext = new ApplicationDbContext();
            UserStore<ApplicationUser> userStore = new UserStore<ApplicationUser>(mycontext);
            ApplicationUserManager UserManager = new ApplicationUserManager(userStore);
            ApplicationUser user = (UserManager.FindByNameAsync(userName)).Result;

            return user.Employee.Department;
        }

        public async Task<List<int>> GetNodeDepartmentAsync(int departmentId = 0)
        {
            List<int> departments = new List<int>();
            //если 0 - все подразделения
            if (departmentId == 0)
            {
                List<Department> tmpDep = await context.Department.Where(d => d.ParentId == null).ToListAsync();
                if (tmpDep.Count() != 0)
                {
                    departments.AddRange(tmpDep.Select(d => d.Id).ToList());
                    foreach (Department dep in tmpDep)
                    {
                        List<Department> tmpDep1 = await context.Department.Where(d => d.ParentId == dep.Id).ToListAsync();
                        if (tmpDep1.Count() != 0)
                        {
                            departments.AddRange(tmpDep1.Select(d => d.Id).ToList());
                            foreach (Department dep1 in tmpDep1)
                            {
                                List<Department> tmpDep2 = await context.Department.Where(d => d.ParentId == dep1.Id).ToListAsync();
                                if (tmpDep2.Count() != 0)
                                {
                                    departments.AddRange(tmpDep2.Select(d => d.Id).ToList());
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                departments.Add(departmentId);

                List<Department> tmpDep = await context.Department.Where(d => d.ParentId == departmentId).ToListAsync();
                if (tmpDep.Count() != 0)
                {
                    departments.AddRange(tmpDep.Select(d => d.Id).ToList());
                    foreach (Department dep in tmpDep)
                    {
                        List<Department> tmpDep1 = await context.Department.Where(d => d.ParentId == dep.Id).ToListAsync();
                        if (tmpDep1.Count() != 0)
                        {
                            departments.AddRange(tmpDep1.Select(d => d.Id).ToList());
                        }
                    }
                }
            }
            return departments;
        }

        public List<int> GetNodeDepartment(int departmentId = 0)
        {
            List<int> departments = new List<int>();
            //если 0 - все подразделения
            if (departmentId == 0)
            {
                List<Department> tmpDep = context.Department.Where(d => d.ParentId == null).ToList();
                if (tmpDep.Count() != 0)
                {
                    departments.AddRange(tmpDep.Select(d => d.Id).ToList());
                    foreach (Department dep in tmpDep)
                    {
                        List<Department> tmpDep1 = context.Department.Where(d => d.ParentId == dep.Id).ToList();
                        if (tmpDep1.Count() != 0)
                        {
                            departments.AddRange(tmpDep1.Select(d => d.Id).ToList());
                            foreach (Department dep1 in tmpDep1)
                            {
                                List<Department> tmpDep2 = context.Department.Where(d => d.ParentId == dep1.Id).ToList();
                                if (tmpDep2.Count() != 0)
                                {
                                    departments.AddRange(tmpDep2.Select(d => d.Id).ToList());
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                departments.Add(departmentId);

                List<Department> tmpDep = context.Department.Where(d => d.ParentId == departmentId).ToList();
                if (tmpDep.Count() != 0)
                {
                    departments.AddRange(tmpDep.Select(d => d.Id).ToList());
                    foreach (Department dep in tmpDep)
                    {
                        List<Department> tmpDep1 = context.Department.Where(d => d.ParentId == dep.Id).ToList();
                        if (tmpDep1.Count() != 0)
                        {
                            departments.AddRange(tmpDep1.Select(d => d.Id).ToList());
                        }
                    }
                }
            }
            return departments;
        }

    }
}