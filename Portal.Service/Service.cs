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
using Portal.Service.Jobs.Reports;
using Portal.Service.Jobs.General;

namespace Portal.Service
{
    public partial class Service : ServiceBase
    {
        private System.Timers.Timer timer = null;
        private bool IsFirstStart = true;

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

            using (JobContext jobContext = new JobContext())
            {
                if (!IsFirstStart)
                {
                    //1.Delete jobs that are not in the scheduler.
                    //select all not runnig jobs in service - jobsServiseNotRunning
                    List<JobKey> jobsServiseNotRunning = Helper.GetJobKeysForDelete(scheduler);

                    //select all active jobs in scheduler - jobsSchedulerActive
                    List<Job> jobsSchedulerActive = await jobContext.GetJobAllActiveAsync();
                    List<JobKey> jobsServiseForDelete = new List<JobKey>();
                    foreach (Job j in jobsSchedulerActive)
                    {
                        jobsServiseForDelete.Add(new JobKey(j.Id.ToString() + jobContext.GetTaskName(j.TaskListId)));
                    }

                    //delete jobs that are not in jobsSchedulerActive from jobsServiseNotRunning
                    foreach (var js in jobsServiseNotRunning)
                    {
                        if (!jobsServiseForDelete.Contains(js)) scheduler.DeleteJob(js);
                    }

                    //2. Add all other jobs in service.
                    //select all not IsAdded jobs in the scheduler - jobsForAdd
                    List<Job> jobsForAdd = await jobContext.GetJobForServiceAsync();
                    foreach (Job j in jobsForAdd)
                    {
                        var jobKey = new JobKey(j.Id.ToString() + jobContext.GetTaskName(j.TaskListId));

                        //if job exists in service then deleting
                        if (scheduler.CheckExists(jobKey)) scheduler.DeleteJob(jobKey);

                        IJobDetail jobDetail = null;
                        ITrigger trigger = null;
                        CreateJob(jobContext, j, ref jobDetail, ref trigger);
                        if (!scheduler.CheckExists(jobDetail.Key)) scheduler.ScheduleJob(jobDetail, trigger);
                        j.IsAdded = true;
                    }
                    await jobContext.SaveChangesAsync();
                }
                else
                {
                    List<Job> jobsForAdd = await jobContext.GetJobForServiceFirstStartAsync();
                    foreach (Job j in jobsForAdd)
                    {
                        IJobDetail jobDetail = null;
                        ITrigger trigger = null;
                        CreateJob(jobContext, j, ref jobDetail, ref trigger);
                        if(!scheduler.CheckExists(jobDetail.Key)) scheduler.ScheduleJob(jobDetail, trigger);
                    }
                    IsFirstStart = false;
                }
                if (scheduler.InStandbyMode || !scheduler.IsStarted)
                {
                    scheduler.Start();
                }
            }
        }

        private static void CreateJob(JobContext jobContext, Job j, ref IJobDetail jobDetail, ref ITrigger trigger)
        {
            switch (j.TaskListId)
            {
                case 1:
                    jobDetail.JobDataMap["Id"] = j.Id;
                    jobDetail = JobBuilder.Create<ImportFrom1C>()
                        .WithIdentity(j.Id.ToString() + jobContext.GetTaskName(j.TaskListId))
                        .Build();
                    trigger = TriggerBuilder.Create()
                        .ForJob(jobDetail)
                        .WithCronSchedule(j.CronSchedule)
                        .WithIdentity(j.Id.ToString() + jobContext.GetTaskName(j.TaskListId))
                        .StartNow()
                        .Build();
                    break;
                case 2:
                    jobDetail.JobDataMap["Id"] = j.Id;
                    jobDetail = JobBuilder.Create<ReportDiscount50>()
                        .WithIdentity(j.Id.ToString() + jobContext.GetTaskName(j.TaskListId))
                        .Build();
                    trigger = TriggerBuilder.Create()
                        .ForJob(jobDetail)
                        .WithCronSchedule(j.CronSchedule)
                        .WithIdentity(j.Id.ToString() + jobContext.GetTaskName(j.TaskListId))
                        .StartNow()
                        .Build();
                    break;
                case 3:
                    jobDetail.JobDataMap["Id"] = j.Id;
                    jobDetail = JobBuilder.Create<BackupDB>()
                        .WithIdentity(j.Id.ToString() + jobContext.GetTaskName(j.TaskListId))
                        .Build();
                    trigger = TriggerBuilder.Create()
                        .ForJob(jobDetail)
                        .WithCronSchedule(j.CronSchedule)
                        .WithIdentity(j.Id.ToString() + jobContext.GetTaskName(j.TaskListId))
                        .StartNow()
                        .Build();
                    break;
            }
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
