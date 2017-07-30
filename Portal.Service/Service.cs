using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using Portal.Service.Jobs;
using Quartz;
using Quartz.Impl;
using Quartz.Impl.Matchers;

namespace Portal.Service
{
    public partial class Service : ServiceBase
    {
        private System.Timers.Timer timer = null;

        static ISchedulerFactory schedulerFactory = new StdSchedulerFactory();
        IScheduler scheduler = schedulerFactory.GetScheduler();

        public Service()
        {
            InitializeComponent();

            timer = new System.Timers.Timer(30000);//создаём объект таймера 
            timer.Elapsed += new ElapsedEventHandler(timer_Elapsed);
        }

        private async void timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            scheduler.Standby();
            
            //delete all not runnig jobs
            List<JobKey> jobKeys = Helper.GetJobKeysForDelete(scheduler);
            scheduler.DeleteJobs(jobKeys);
            //scheduler.Clear();

            using (JobContext jobContext = new JobContext())
            {
                List<Job> jobs = await jobContext.GetJobForServiceAsync();
                foreach (Job j in jobs)
                {
                    var jobKey = new JobKey(j.TaskList.Name);
                    if (!scheduler.CheckExists(jobKey))
                    {
                        IJobDetail jobDetail = JobBuilder.Create<ImportFrom1C>()
                            .WithIdentity(j.TaskList.Name)
                            .Build();
                        ITrigger trigger = TriggerBuilder.Create()
                            .ForJob(jobDetail)
                            .WithCronSchedule(j.CronSchedule)
                            .WithIdentity(j.TaskList.Name)
                            .StartNow()
                            .Build();
                        scheduler.ScheduleJob(jobDetail, trigger);
                        j.IsAdded = true;
                    }
                }
                await jobContext.SaveChangesAsync();
            }
            if(!scheduler.IsStarted) scheduler.Start();
        }

        protected override void OnStart(string[] args)
        {
            timer.Start();
        }

        protected override void OnStop()
        {
            timer.Stop();
            scheduler.Shutdown();
        }

    }

}
