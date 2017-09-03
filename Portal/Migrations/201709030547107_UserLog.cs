namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UserLog : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.UserLog",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserName = c.String(),
                        IPv4 = c.String(maxLength: 15),
                        Request = c.String(maxLength: 1000),
                        VisitDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.UserLog");
        }
    }
}
