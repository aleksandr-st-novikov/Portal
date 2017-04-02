using Microsoft.AspNet.Identity.EntityFramework;
using Portal.Models.Entities;
using Portal.Pages.Admin.Employee;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Portal.Models.EFContext
{
    public class DepartmentContext : ApplicationContext
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
            foreach(var dat in data)
            {
                Department dep = await context.Department.FirstOrDefaultAsync(d => d.Name == dat.Department);
                Employee empl = await context.Employee.FirstOrDefaultAsync(e => e.TabN == dat.TabNo);
                if(dep != null)
                {
                    dep.HeadId = empl.Id;
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
    }
}