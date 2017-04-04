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
    public class AdmissionContext : ApplicationContext
    {
        public async Task PopulateByDepartmentAsync(int departmentId)
        {
            List<int> departments = null;
            using (DepartmentContext dc = new DepartmentContext())
            {
                departments = await dc.GetNodeDepartmentAsync(departmentId);
            }

            List<Employee> employees = await context.Employee.Where(d => departments.Contains((int)d.DepartmentId)).ToListAsync();
            foreach (Employee empl in employees)
            {
                Admission entry = await context.Admission.Where(a => a.DepartmentId == empl.DepartmentId && a.EmployeeId == empl.Id).FirstOrDefaultAsync();
                if (entry == null)
                {
                    context.Admission.Add(new Admission()
                    {
                        EmployeeId = empl.Id,
                        DepartmentId = empl.DepartmentId,
                        PositionId = empl.PositionId,
                        IsWork = empl.IsWork
                    });
                }
                else
                {
                    entry.DepartmentId = empl.DepartmentId;
                    entry.PositionId = empl.PositionId;
                    entry.IsWork = empl.IsWork;
                }
            }
        }

        public List<AdmissionReportViewModel> GetDataForReport(DateTime dateFrom, DateTime dateTo, int departmentId = 0)
        {
            List<int> departments = null;
            using (DepartmentContext dc = new DepartmentContext())
            {
                departments = dc.GetNodeDepartment(departmentId);
            }
            return (from a in context.Admission
                    join e in context.Employee on a.EmployeeId equals e.Id
                    join p in context.Position on a.PositionId equals p.Id
                    where ((a.DateFlu >= dateFrom && a.DateFlu <= dateTo)
                    || (a.Dopusk >= dateFrom && a.Dopusk <= dateTo)
                    || (a.MedOsm >= dateFrom && a.MedOsm <= dateTo)
                    || (a.SanMin >= dateFrom && a.SanMin <= dateTo))
                    && departments.Contains((int)a.DepartmentId)
                    select new AdmissionReportViewModel
                    {
                        Commentary = a.Commentary,
                        DateFlu = a.DateFlu,
                        Dopusk = a.Dopusk,
                        FIO = e.Lastname + " " + e.Firstname + " " + e.Patronymic,
                        MedOsm = a.MedOsm,
                        NumFlu = a.NumFlu,
                        PositionName = p.Name,
                        SanMin = a.SanMin
                    }).ToList();
        }

    }
}