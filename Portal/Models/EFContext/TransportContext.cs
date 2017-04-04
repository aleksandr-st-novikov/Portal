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
    public class TransportContext : ApplicationContext
    {
        public async Task AddTransportAsync(Transport transport)
        {
            Employee employee = await context.Employee.FirstOrDefaultAsync(e => e.Id == transport.EmployeeId);
            transport.DepartmentId = employee.DepartmentId;
            context.Transport.Add(transport);
        }

        public async Task<List<Transport>> GetDataForReportAsync()
        {
            return await context.Transport.ToListAsync();
        }

        public List<TransportReportViewModel> GetDataForReport(DateTime dateFrom, DateTime dateTo, int departmentId = 0)
        {
            List<int> departments = null;
            using (DepartmentContext dc = new DepartmentContext())
            {
                departments = dc.GetNodeDepartment(departmentId);
            }
            return (from t in context.Transport
                    join e in context.Employee on t.EmployeeId equals e.Id
                    join d in context.Department on t.DepartmentId equals d.Id
                    where t.DateTransport >= dateFrom && t.DateTransport <= dateTo
                    && departments.Contains((int)t.DepartmentId)
                    select new TransportReportViewModel {
                        Address = t.Address,
                        DateTransport = t.DateTransport,
                        DepartmentShortName = d.ShortName,
                        FIO = e.Lastname + " " + e.Firstname + " " + e.Patronymic
                    }).ToList();
        }
    }
}