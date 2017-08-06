namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Exit : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Exit",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        RunType = c.Int(nullable: false),
                        DateFrom = c.DateTime(nullable: false),
                        DateFromCheck = c.DateTime(),
                        DateTo = c.DateTime(),
                        DateToCheck = c.DateTime(),
                        EmployeeId = c.Int(),
                        DepartmentId = c.Int(),
                        PetmitEmployeeId = c.Int(),
                        ExitPurposeId = c.Int(),
                        DescriptionOne = c.String(maxLength: 500),
                        DescriptionTwo = c.String(maxLength: 500),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Department", t => t.DepartmentId)
                .ForeignKey("dbo.Employee", t => t.EmployeeId)
                .ForeignKey("dbo.ExitPurpose", t => t.ExitPurposeId)
                .Index(t => t.EmployeeId)
                .Index(t => t.DepartmentId)
                .Index(t => t.ExitPurposeId);
            
            CreateTable(
                "dbo.ExitPurpose",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        Description = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Exit", "ExitPurposeId", "dbo.ExitPurpose");
            DropForeignKey("dbo.Exit", "EmployeeId", "dbo.Employee");
            DropForeignKey("dbo.Exit", "DepartmentId", "dbo.Department");
            DropIndex("dbo.Exit", new[] { "ExitPurposeId" });
            DropIndex("dbo.Exit", new[] { "DepartmentId" });
            DropIndex("dbo.Exit", new[] { "EmployeeId" });
            DropTable("dbo.ExitPurpose");
            DropTable("dbo.Exit");
        }
    }
}
