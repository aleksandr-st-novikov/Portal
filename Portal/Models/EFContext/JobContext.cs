using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Portal.Models.EFContext
{
    public class JobContext : ApplicationContext<Job>
    {
        public Task<List<Job>> GetJobForServiceAsync()
        {
            return context.Job
                .Where(j => j.IsActive == true && j.IsAdded == false && j.Status != BL.Core.Enums.Status.Running)
                .ToListAsync();
        }

        public Task<List<Job>> GetJobAllActiveAsync()
        {
            return context.Job
                .Where(j => j.IsActive == true && j.Status != BL.Core.Enums.Status.Running)
                .ToListAsync();
        }
    }
}