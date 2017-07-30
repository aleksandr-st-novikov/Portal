using Quartz;
using Quartz.Impl.Matchers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Service.Jobs
{
    internal static class Helper
    {
        internal static List<IJobDetail> GetJobs(IScheduler scheduler)
        {
            List<IJobDetail> jobs = new List<IJobDetail>();

            foreach (JobKey jobKey in scheduler.GetJobKeys(GroupMatcher<JobKey>.AnyGroup()))
            {
                jobs.Add(scheduler.GetJobDetail(jobKey));
            }

            return jobs;
        }

        internal static List<JobKey> GetJobKeys(IScheduler scheduler)
        {
            List<JobKey> jobKeys = new List<JobKey>();

            foreach (JobKey jobKey in scheduler.GetJobKeys(GroupMatcher<JobKey>.AnyGroup()))
            {
                jobKeys.Add(jobKey);
            }

            return jobKeys;
        }

        internal static List<JobKey> GetRunnigJobKeys(IScheduler scheduler)
        {
            List<JobKey> runnigJobKeys = new List<JobKey>();

            var dd = scheduler.GetCurrentlyExecutingJobs();
            foreach (var d in dd)
            {
                runnigJobKeys.Add(d.JobDetail.Key);
            }
            return runnigJobKeys;
        }

        internal static List<JobKey> GetJobKeysForDelete(IScheduler scheduler)
        {
            List<JobKey> runnigJobKeys = GetRunnigJobKeys(scheduler);
            List<JobKey> jobKeys = GetJobKeys(scheduler);
            return jobKeys.Except(runnigJobKeys).ToList();
        }
    }
}
