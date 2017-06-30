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
    public class EmployeeContext : ApplicationContext<Employee>
    {
        public async Task AddEmployeeAsync(MidData employee)
        {
            Employee entry = await context.Employee.FirstOrDefaultAsync(d => d.TabN == employee.TabNo);
            Department department = await context.Department.FirstOrDefaultAsync(d => d.Name == employee.Department);
            Position position = await context.Position.FirstOrDefaultAsync(p => p.Name == employee.Position);
            if (entry == null)
            {
                context.Employee.Add(new Employee
                {
                    TabN = employee.TabNo,
                    Lastname = employee.LastName,
                    Firstname = employee.FirstName,
                    Patronymic = employee.Patronymic,
                    DateIn = employee.DateIn,
                    DateBirth = employee.DateBirth,
                    DepartmentId = department == null ? (int?)null : department.Id,
                    PositionId = position == null ? (int?)null : position.Id,
                    IsWork = true
                });
            }
            else
            {
                entry.DateBirth = employee.DateBirth;
                entry.DateIn = employee.DateIn;
                entry.Firstname = employee.FirstName;
                entry.Lastname = employee.LastName;
                entry.Patronymic = employee.Patronymic;
                entry.DepartmentId = department.Id;
                entry.PositionId = position.Id;
            }
        }

        public async Task SetFiredAsync(List<MidData> data)
        {
            List<string> dataTabN = data.Select(d => d.TabNo).ToList();
            List<Employee> uv = await context.Employee.Where(e => !dataTabN.Contains(e.TabN)).ToListAsync();
            foreach (Employee empl in uv)
            {
                empl.IsWork = false;
            }
        }

        public async Task<Employee> GetEmployeeByUserAsync(string userName)
        {
            ApplicationDbContext mycontext = new ApplicationDbContext();
            UserStore<ApplicationUser> userStore = new UserStore<ApplicationUser>(mycontext);
            ApplicationUserManager UserManager = new ApplicationUserManager(userStore);
            ApplicationUser user = await UserManager.FindByNameAsync(userName);

            return user.Employee;
        }

        public Employee GetEmployeeByUser(string userName)
        {
            ApplicationDbContext mycontext = new ApplicationDbContext();
            UserStore<ApplicationUser> userStore = new UserStore<ApplicationUser>(mycontext);
            ApplicationUserManager UserManager = new ApplicationUserManager(userStore);
            ApplicationUser user = (UserManager.FindByNameAsync(userName)).Result;

            return user.Employee;
        }
    }
}