﻿using Portal.Models.Entities;
using Portal.Pages.Admin.Employee;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Portal.Models.EFContext
{
    public class EmployeeContext : IDisposable
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

        public async Task AddEmployee(MidData employee)
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
                    PositionId = position == null ? (int?)null : position.Id
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

        public async Task SetFired(List<MidData> data)
        {
            List<string> dataTabN = data.Select(d => d.TabNo).ToList();
            List<Employee> uv = await context.Employee.Where(e => !dataTabN.Contains(e.TabN)).ToListAsync();
            foreach(Employee empl in uv)
            {
                empl.IsWork = false;
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
    }
}