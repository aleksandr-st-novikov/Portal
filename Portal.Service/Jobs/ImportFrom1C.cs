using Quartz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Portal.Service.Jobs
{
    class ImportFrom1C : IJob
    {
        public void Execute(IJobExecutionContext context)
        {
            System.IO.File.WriteAllText(@"e:\WriteLines.txt", DateTime.Now.ToString());
        }
    }
}
