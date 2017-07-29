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
using NCron.Service;
using NCron.Fluent.Crontab;

namespace Portal.Service
{
    public partial class Service : ServiceBase
    {
        private System.Timers.Timer timer = null;
        SchedulingService schedulingService = new SchedulingService();

        public Service()
        {
            InitializeComponent();

            timer = new System.Timers.Timer(30000);//создаём объект таймера 
            timer.Elapsed += new ElapsedEventHandler(timer_Elapsed);
        }

        private async void timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            using (JobContext jobContext = new JobContext())
            {
                List<Job> jobs = await jobContext.GetJobForServiceAsync();
                foreach(Job j in jobs)
                {
                    schedulingService.At("0 12 * * 1").Run<ImportFrom1C>();
                }
                
            }
            schedulingService.Start();
        }

        protected override void OnStart(string[] args)
        {
            timer.Start();
        }

        protected override void OnStop()
        {
            timer.Stop();
        }
    }
}
