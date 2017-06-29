namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Manual : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Manual",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        ParentId = c.Int(),
                        IsCategory = c.Boolean(),
                        EmployeeId = c.Int(),
                        MainText = c.String(),
                        Attachment = c.String(),
                        DateCreate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Employee", t => t.EmployeeId)
                .Index(t => t.EmployeeId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Manual", "EmployeeId", "dbo.Employee");
            DropIndex("dbo.Manual", new[] { "EmployeeId" });
            DropTable("dbo.Manual");
        }
    }
}
