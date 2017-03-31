namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Department : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Department", "ShortName", c => c.String(maxLength: 100));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Department", "ShortName");
        }
    }
}
