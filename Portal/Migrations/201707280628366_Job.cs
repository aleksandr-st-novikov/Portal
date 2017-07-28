namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Job : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Job",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TaskListId = c.Int(nullable: false),
                        CronSchedule = c.String(maxLength: 300),
                        Status = c.Int(nullable: false),
                        IsActive = c.Boolean(nullable: false),
                        IsAdded = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.JobResult",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        JobId = c.Int(nullable: false),
                        DateRun = c.DateTime(nullable: false),
                        Result = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Job", t => t.JobId, cascadeDelete: true)
                .Index(t => t.JobId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.JobResult", "JobId", "dbo.Job");
            DropIndex("dbo.JobResult", new[] { "JobId" });
            DropTable("dbo.JobResult");
            DropTable("dbo.Job");
        }
    }
}
