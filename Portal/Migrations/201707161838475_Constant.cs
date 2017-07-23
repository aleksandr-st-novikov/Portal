namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Constant : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Constant",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 300),
                        Value = c.String(maxLength: 1000),
                        Description = c.String(maxLength: 500),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Constant");
        }
    }
}
