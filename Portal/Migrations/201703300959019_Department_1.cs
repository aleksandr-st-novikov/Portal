namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Department_1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Department", "ParentId", c => c.Int());
            DropColumn("dbo.Department", "NodeNum");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Department", "NodeNum", c => c.String());
            DropColumn("dbo.Department", "ParentId");
        }
    }
}
