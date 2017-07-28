namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Job1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Job", "Parameters", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Job", "Parameters");
        }
    }
}
