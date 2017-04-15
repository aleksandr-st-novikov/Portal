namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Position : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Position",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 300),
                        IsActive = c.Boolean(nullable: false, defaultValue: true),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.Department", "IsActive", c => c.Boolean(nullable: false, defaultValue: true));
            AddColumn("dbo.Employee", "PositionId", c => c.Int());
            AddColumn("dbo.Accessories", "IsActive", c => c.Boolean(nullable: false, defaultValue: true));
            CreateIndex("dbo.Employee", "PositionId");
            AddForeignKey("dbo.Employee", "PositionId", "dbo.Position", "Id");
            DropColumn("dbo.Employee", "Prof");
            DropColumn("dbo.Accessories", "GroupId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Accessories", "GroupId", c => c.Int(nullable: false));
            AddColumn("dbo.Employee", "Prof", c => c.String(maxLength: 150));
            DropForeignKey("dbo.Employee", "PositionId", "dbo.Position");
            DropIndex("dbo.Employee", new[] { "PositionId" });
            DropColumn("dbo.Accessories", "IsActive");
            DropColumn("dbo.Employee", "PositionId");
            DropColumn("dbo.Department", "IsActive");
            DropTable("dbo.Position");
        }
    }
}
