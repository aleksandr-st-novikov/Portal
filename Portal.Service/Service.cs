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

namespace Portal.Service
{
    public partial class Service : ServiceBase
    {
        private System.Timers.Timer timer = null;

        public Service()
        {
            InitializeComponent();

            timer = new System.Timers.Timer(60000);//создаём объект таймера 
            timer.Elapsed += new ElapsedEventHandler(timer_Elapsed);
        }

        private void timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            throw new NotImplementedException();
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
