namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class OfTransport : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.OfTransport",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Date = c.DateTime(nullable: false),
                        Customer = c.String(maxLength: 300),
                        Route = c.String(maxLength: 1000),
                        Purpose = c.String(maxLength: 1000),
                        Attendant = c.String(maxLength: 300),
                        EmployeeId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Employee", t => t.EmployeeId, cascadeDelete: true)
                .Index(t => t.EmployeeId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.OfTransport", "EmployeeId", "dbo.Employee");
            DropIndex("dbo.OfTransport", new[] { "EmployeeId" });
            DropTable("dbo.OfTransport");
        }
    }
}
