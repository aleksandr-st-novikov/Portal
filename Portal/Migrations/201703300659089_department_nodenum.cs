namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class department_nodenum : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Department", "NodeNum", c => c.String());
            DropColumn("dbo.Department", "ParentId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Department", "ParentId", c => c.Int());
            DropColumn("dbo.Department", "NodeNum");
        }
    }
}
