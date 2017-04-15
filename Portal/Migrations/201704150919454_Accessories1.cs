namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Accessories1 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Accessories", "AccessoriesType_Id", "dbo.AccessoriesType");
            DropForeignKey("dbo.AccessoriesProduct", "AccessoriesType_Id", "dbo.AccessoriesType");
            DropIndex("dbo.Accessories", new[] { "AccessoriesType_Id" });
            DropIndex("dbo.AccessoriesProduct", new[] { "AccessoriesType_Id" });
            RenameColumn(table: "dbo.Accessories", name: "AccessoriesType_Id", newName: "AccessoriesTypeId");
            RenameColumn(table: "dbo.AccessoriesProduct", name: "AccessoriesType_Id", newName: "AccessoriesTypeId");
            AlterColumn("dbo.Accessories", "AccessoriesTypeId", c => c.Int(nullable: false));
            AlterColumn("dbo.AccessoriesProduct", "AccessoriesTypeId", c => c.Int(nullable: false));
            CreateIndex("dbo.Accessories", "AccessoriesTypeId");
            CreateIndex("dbo.AccessoriesProduct", "AccessoriesTypeId");
            AddForeignKey("dbo.Accessories", "AccessoriesTypeId", "dbo.AccessoriesType", "Id", cascadeDelete: false);
            AddForeignKey("dbo.AccessoriesProduct", "AccessoriesTypeId", "dbo.AccessoriesType", "Id", cascadeDelete: false);
            DropColumn("dbo.Accessories", "StationeyTypeId");
            DropColumn("dbo.AccessoriesProduct", "AccessoriesId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.AccessoriesProduct", "AccessoriesId", c => c.Int(nullable: false));
            AddColumn("dbo.Accessories", "StationeyTypeId", c => c.Int(nullable: false));
            DropForeignKey("dbo.AccessoriesProduct", "AccessoriesTypeId", "dbo.AccessoriesType");
            DropForeignKey("dbo.Accessories", "AccessoriesTypeId", "dbo.AccessoriesType");
            DropIndex("dbo.AccessoriesProduct", new[] { "AccessoriesTypeId" });
            DropIndex("dbo.Accessories", new[] { "AccessoriesTypeId" });
            AlterColumn("dbo.AccessoriesProduct", "AccessoriesTypeId", c => c.Int());
            AlterColumn("dbo.Accessories", "AccessoriesTypeId", c => c.Int());
            RenameColumn(table: "dbo.AccessoriesProduct", name: "AccessoriesTypeId", newName: "AccessoriesType_Id");
            RenameColumn(table: "dbo.Accessories", name: "AccessoriesTypeId", newName: "AccessoriesType_Id");
            CreateIndex("dbo.AccessoriesProduct", "AccessoriesType_Id");
            CreateIndex("dbo.Accessories", "AccessoriesType_Id");
            AddForeignKey("dbo.AccessoriesProduct", "AccessoriesType_Id", "dbo.AccessoriesType", "Id");
            AddForeignKey("dbo.Accessories", "AccessoriesType_Id", "dbo.AccessoriesType", "Id");
        }
    }
}
