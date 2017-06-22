namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DepartmentWork3 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.DepartmentWork", "CloseEmployeeId", "dbo.Employee");
            DropForeignKey("dbo.DepartmentWork", "RegisterEmployeeId", "dbo.Employee");
            DropIndex("dbo.DepartmentWork", new[] { "RegisterEmployeeId" });
            DropIndex("dbo.DepartmentWork", new[] { "CloseEmployeeId" });
        }
        
        public override void Down()
        {
            CreateIndex("dbo.DepartmentWork", "CloseEmployeeId");
            CreateIndex("dbo.DepartmentWork", "RegisterEmployeeId");
            AddForeignKey("dbo.DepartmentWork", "RegisterEmployeeId", "dbo.Employee", "Id", cascadeDelete: true);
            AddForeignKey("dbo.DepartmentWork", "CloseEmployeeId", "dbo.Employee", "Id", cascadeDelete: true);
        }
    }
}
