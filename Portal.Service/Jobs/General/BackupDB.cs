using Portal.BL.Core;
using Portal.Models;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using Quartz;
using System;
using System.Data.SqlClient;
using System.IO;
using System.IO.Compression;

namespace Portal.Service.Jobs.General
{
    public class BackupDB : IJob
    {
        public async void Execute(IJobExecutionContext context)
        {
            using (JobContext jobContext = new JobContext())
            using (JobResultContext jobResultContext = new JobResultContext())
            using (ApplicationDbContext ctxt = new ApplicationDbContext())
            {
                //Id job = 3
                Job job = await jobContext.FindByIdAsync(3);
                job.Status = Enums.Status.Running;
                await jobContext.SaveChangesAsync();

                JobResult jobResultStart = new JobResult() { JobId = 3, DateRun = DateTime.Now, Result = Enums.Result.Start };
                await jobResultContext.AddOrUpdateAsync(jobResultStart, -1);

                try
                {
                    //work
                    using (SqlConnection connection = (SqlConnection)ctxt.Database.Connection)
                    {
                        connection.Open();
                        string script = "BACKUP DATABASE [portal] TO  DISK = N'" + job.Parameters + "' WITH NOFORMAT, INIT,  NAME = N'portal-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10, CHECKSUM " +
                            "GO " +
                            "declare @backupSetId as int " +
                            "select @backupSetId = position from msdb..backupset where database_name = N'portal' and backup_set_id = (select max(backup_set_id) from msdb..backupset where database_name = N'portal' ) " +
                            "if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''portal'' not found.', 16, 1) end " +
                            "RESTORE VERIFYONLY FROM  DISK = N'" + job.Parameters + "' WITH FILE = @backupSetId, NOUNLOAD, NOREWIND " +
                            "GO";
                        SqlCommand com = new SqlCommand(script, connection);
                        com.ExecuteNonQuery();
                        //if (File.Exists(job.Parameters))
                        //{
                        //    using (ZipArchive zip = ZipFile.Open(Path.ChangeExtension(job.Parameters, "zip"), ZipArchiveMode.Create))
                        //    {
                        //        zip.CreateEntryFromFile(job.Parameters, Path.GetFileName(job.Parameters));
                        //    }
                        //    File.Delete(job.Parameters);
                        //}
                    }
                    JobResult jobResultSuccess = new JobResult() { JobId = 3, DateRun = DateTime.Now, Result = Enums.Result.Success };
                    await jobResultContext.AddOrUpdateAsync(jobResultSuccess, -1);
                }
                catch (Exception ex)
                {
                    JobResult jobResultError = new JobResult() { JobId = 3, DateRun = DateTime.Now, Result = Enums.Result.Error, Description = ex.Message };
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
