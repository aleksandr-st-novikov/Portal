using Portal.BL.Core;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using Portal.Models.ViewModel;
using Portal.Pages.Admin.Employee;
using Quartz;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Portal.Service.Jobs
{
    

    class ImportFrom1C : IJob
    {
        public async void Execute(IJobExecutionContext context)
        {
            using (ConstantContext constantContext = new ConstantContext())
            using (JobContext jobContext = new JobContext())
            using (JobResultContext jobResultContext = new JobResultContext())
            {
                //Id job = 1
                Job job = await jobContext.FindByIdAsync(1);
                job.Status = Enums.Status.Running;

                JobResult jobResultStart = new JobResult() { JobId = 1, DateRun = DateTime.Now, Result = Enums.Result.Start };

                try
                {
                    string filePath = String.IsNullOrEmpty(constantContext.GetConstString("PathFileImport1C")) ?
                                Data.PathFileImport1C : constantContext.GetConstString("PathFileImport1C");
                    await ImportEmployees.ExecuteAsync(filePath);
                }
                catch (Exception ex)
                {
                    JobResult jobResultError = new JobResult() { JobId = 1, DateRun = DateTime.Now, Result = Enums.Result.Error, Description = ex.Message };
                }
                finally
                {
                    job.Status = Enums.Status.Ready;
                }
                JobResult jobResultSuccess = new JobResult() { JobId = 1, DateRun = DateTime.Now, Result = Enums.Result.Success };
                await jobContext.SaveChangesAsync();
                await jobResultContext.SaveChangesAsync();
            }
            
        }
    }
}
