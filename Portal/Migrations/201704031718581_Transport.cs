namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Transport : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Transport",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Address = c.String(maxLength: 300),
                        DateTransport = c.DateTime(nullable: false),
                        EmployeeId = c.Int(),
                        DepartmentId = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Department", t => t.DepartmentId)
                .ForeignKey("dbo.Employee", t => t.EmployeeId)
                .Index(t => t.EmployeeId)
                .Index(t => t.DepartmentId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Transport", "EmployeeId", "dbo.Employee");
            DropForeignKey("dbo.Transport", "DepartmentId", "dbo.Department");
            DropIndex("dbo.Transport", new[] { "DepartmentId" });
            DropIndex("dbo.Transport", new[] { "EmployeeId" });
            DropTable("dbo.Transport");
        }
    }
}
