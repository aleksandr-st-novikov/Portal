namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DepartmentWork2 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.DepartmentWork", "RegisterDate", c => c.DateTime());
            AlterColumn("dbo.DepartmentWork", "CloseDate", c => c.DateTime());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.DepartmentWork", "CloseDate", c => c.DateTime(nullable: false));
            AlterColumn("dbo.DepartmentWork", "RegisterDate", c => c.DateTime(nullable: false));
        }
    }
}
