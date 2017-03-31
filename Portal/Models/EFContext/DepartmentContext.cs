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
    public class DepartmentContext : IDisposable
    {
        private ApplicationDbContext context = new ApplicationDbContext();

        bool disposed = false;

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposed)
                return;

            if (disposing)
            {
                context.Dispose();
            }

            // Free any unmanaged objects here. 
            //
            disposed = true;
        }

        public async Task AddDepartment(Department department)
        {
            Department entry = await context.Department.FirstOrDefaultAsync(d => d.Name == department.Name);
            if (entry == null)
            {
                context.Department.Add(department);
            }
        }

        public async Task AddRangeDepartment(List<string> departments)
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

        public async Task SetHeadDepartment(List<MidData> data)
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

        public async Task<bool> SaveChanges()
        {
            try
            {
                await context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public string GetDepartmentByUser(string userName)
        {
            ApplicationDbContext mycontext = new ApplicationDbContext();
            UserStore<ApplicationUser> userStore = new UserStore<ApplicationUser>(mycontext);
            ApplicationUserManager UserManager = new ApplicationUserManager(userStore);

            return user.Employee.Department.Name;
        }
    }
}