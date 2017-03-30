namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Employee : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Department",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ParentId = c.Int(),
                        HeadId = c.Int(),
                        Name = c.String(nullable: false, maxLength: 300),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Employee", t => t.HeadId)
                .Index(t => t.HeadId);
            
            CreateTable(
                "dbo.Employee",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TabN = c.String(nullable: false, maxLength: 150),
                        Lastname = c.String(nullable: false, maxLength: 150),
                        Firstname = c.String(maxLength: 150),
                        Patronymic = c.String(maxLength: 150),
                        Prof = c.String(maxLength: 150),
                        DepartmentId = c.Int(),
                        DateIn = c.DateTime(),
                        DateBirth = c.DateTime(),
                        Category = c.String(),
                        Department_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Department", t => t.DepartmentId)
                .ForeignKey("dbo.Department", t => t.Department_Id)
                .Index(t => t.DepartmentId)
                .Index(t => t.Department_Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Department", "HeadId", "dbo.Employee");
            DropForeignKey("dbo.Employee", "Department_Id", "dbo.Department");
            DropForeignKey("dbo.Employee", "DepartmentId", "dbo.Department");
            DropIndex("dbo.Employee", new[] { "Department_Id" });
            DropIndex("dbo.Employee", new[] { "DepartmentId" });
            DropIndex("dbo.Department", new[] { "HeadId" });
            DropTable("dbo.Employee");
            DropTable("dbo.Department");
        }
    }
}
