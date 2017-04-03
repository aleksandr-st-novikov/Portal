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
    }
}