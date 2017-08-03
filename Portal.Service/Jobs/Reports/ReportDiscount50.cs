using Portal.BL.Core;
using Portal.BL.UKM.Models;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using Quartz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Portal.Service.Jobs.Reports
{
    public class ReportDiscount50 : IJob
    {
        public async void Execute(IJobExecutionContext context)
        {
            using (JobContext jobContext = new JobContext())
            using (JobResultContext jobResultContext = new JobResultContext())
            {
                //Id job = 2
                Job job = await jobContext.FindByIdAsync(2);
                job.Status = Enums.Status.Running;
                await jobContext.SaveChangesAsync();

                JobResult jobResultStart = new JobResult() { JobId = 2, DateRun = DateTime.Now, Result = Enums.Result.Start };
                await jobResultContext.AddOrUpdateAsync(jobResultStart, -1);

                try
                {
                    //work with parameters
                    List<string> parametersList = job.Parameters.Split(';').ToList();
                    if(parametersList.Count < 3 || String.IsNullOrEmpty(parametersList[0]) || String.IsNullOrEmpty(parametersList[1]) || String.IsNullOrEmpty(parametersList[2]))
                    {
                        throw new ArgumentException("Parameter cannot be null");
                    }
                    //get data
                    List<ReportDiscount50Data> data = await BL.UKM.Methods.GetDataRepDiscount50Async(parametersList[0], parametersList[1]);
                    //prepare message
                    string message = "";
                    foreach(var d in data)
                    {
                        message += d.Article.PadRight(10) + d.Name.PadRight(40) + d.Quantity + "/n";
                    }
                    //send message
                    await Task.Run(() => Portal.BL.Utils.Service.SendMessage(parametersList[2], "Реализации акционных товаров (-50%)", message));

                    JobResult jobResultSuccess = new JobResult() { JobId = 2, DateRun = DateTime.Now, Result = Enums.Result.Success };
                    await jobResultContext.AddOrUpdateAsync(jobResultSuccess, -1);
                }
                catch (Exception ex)
                {
                    JobResult jobResultError = new JobResult() { JobId = 2, DateRun = DateTime.Now, Result = Enums.Result.Error, Description = ex.Message };
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
