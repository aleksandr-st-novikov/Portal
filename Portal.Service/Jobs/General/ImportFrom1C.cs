using Portal.BL.Core;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using Portal.Pages.Admin.Employee;
using Quartz;
using System;

namespace Portal.Service.Jobs.General
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
                Job job = await jobContext.FindByTaskIdAsync(1);
                job.Status = Enums.Status.Running;
                await jobContext.SaveChangesAsync();

                JobResult jobResultStart = new JobResult() { JobId = job.Id, DateRun = DateTime.Now, Result = Enums.Result.Start };
                await jobResultContext.AddOrUpdateAsync(jobResultStart, -1);

                try
                {
                    string filePath = String.IsNullOrEmpty(job.Parameters) ? String.IsNullOrEmpty(constantContext.GetConstString("PathFileImport1C")) ?
                                Data.PathFileImport1C : constantContext.GetConstString("PathFileImport1C") : job.Parameters;
                    await ImportEmployees.ExecuteAsync(filePath);

                    JobResult jobResultSuccess = new JobResult() { JobId = job.Id, DateRun = DateTime.Now, Result = Enums.Result.Success };
                    await jobResultContext.AddOrUpdateAsync(jobResultSuccess, -1);
                }
                catch (Exception ex)
                {
                    JobResult jobResultError = new JobResult() { JobId = job.Id, DateRun = DateTime.Now, Result = Enums.Result.Error, Description = ex.Message };
                    await jobResultContext.AddOrUpdateAsync(jobResultError, -1);
                }
                finally
                {
                    job.Status = Enums.Status.Ready;
                    await jobContext.SaveChangesAsync();
                }
            }
            
        }
    }
}
