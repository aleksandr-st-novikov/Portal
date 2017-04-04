using Portal.Models.Entities;
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

        public List<Transport> GetDataForReport()
        {
            return (from t in context.Transport
                    join e in context.Employee on t.EmployeeId equals e.Id
                    join d in context.Department on t.DepartmentId equals d.Id
                    select t).ToList();
        }
    }
}