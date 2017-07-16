namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Department1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Department", "NotChangeHead", c => c.Boolean());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Department", "NotChangeHead");
        }
    }
}
