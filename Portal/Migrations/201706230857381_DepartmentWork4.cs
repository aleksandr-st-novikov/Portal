namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DepartmentWork4 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.DepartmentWork", "RegisterEmployeeId", c => c.Int());
            AlterColumn("dbo.DepartmentWork", "CloseEmployeeId", c => c.Int());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.DepartmentWork", "CloseEmployeeId", c => c.Int(nullable: false));
            AlterColumn("dbo.DepartmentWork", "RegisterEmployeeId", c => c.Int(nullable: false));
        }
    }
}
