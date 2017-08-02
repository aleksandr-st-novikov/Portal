namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class JobResult : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.JobResult", "Description", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.JobResult", "Description");
        }
    }
}
