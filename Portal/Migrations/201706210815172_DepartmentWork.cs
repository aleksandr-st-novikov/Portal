namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DepartmentWork : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.DepartmentWork",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        RegisterUserId = c.Int(nullable: false),
                        RegisterEmployeeId = c.Int(nullable: false),
                        RegisterDate = c.DateTime(nullable: false),
                        CloseDate = c.DateTime(nullable: false),
                        FromWhom = c.String(maxLength: 150),
                        RegisterDescription = c.String(),
                        CloseUserId = c.Int(nullable: false),
                        CloseEmployeeId = c.Int(nullable: false),
                        CloseDescription = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Employee", t => t.CloseEmployeeId, cascadeDelete: false)
                .ForeignKey("dbo.Employee", t => t.RegisterEmployeeId, cascadeDelete: false)
                .Index(t => t.RegisterEmployeeId)
                .Index(t => t.CloseEmployeeId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.DepartmentWork", "RegisterEmployeeId", "dbo.Employee");
            DropForeignKey("dbo.DepartmentWork", "CloseEmployeeId", "dbo.Employee");
            DropIndex("dbo.DepartmentWork", new[] { "CloseEmployeeId" });
            DropIndex("dbo.DepartmentWork", new[] { "RegisterEmployeeId" });
            DropTable("dbo.DepartmentWork");
        }
    }
}
