namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class User : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "EmployeeId", c => c.Int());
            CreateIndex("dbo.AspNetUsers", "EmployeeId");
            AddForeignKey("dbo.AspNetUsers", "EmployeeId", "dbo.Employee", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.AspNetUsers", "EmployeeId", "dbo.Employee");
            DropIndex("dbo.AspNetUsers", new[] { "EmployeeId" });
            DropColumn("dbo.AspNetUsers", "EmployeeId");
        }
    }
}
