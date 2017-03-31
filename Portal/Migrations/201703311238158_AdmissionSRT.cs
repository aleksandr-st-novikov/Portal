namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AdmissionSRT : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.AdmissionSRT",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        DateFlu = c.DateTime(nullable: false),
                        NumFlu = c.String(maxLength: 20),
                        Dopusk = c.DateTime(nullable: false),
                        SanMin = c.DateTime(nullable: false),
                        Commentary = c.String(maxLength: 300),
                        EmployeeId = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Employee", t => t.EmployeeId)
                .Index(t => t.EmployeeId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.AdmissionSRT", "EmployeeId", "dbo.Employee");
            DropIndex("dbo.AdmissionSRT", new[] { "EmployeeId" });
            DropTable("dbo.AdmissionSRT");
        }
    }
}
