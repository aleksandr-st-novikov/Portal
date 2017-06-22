namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DepartmentWork1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.DepartmentWork", "DepartmentId", c => c.Int(nullable: false));
            AlterColumn("dbo.DepartmentWork", "RegisterUserId", c => c.String());
            AlterColumn("dbo.DepartmentWork", "CloseUserId", c => c.String());
            CreateIndex("dbo.DepartmentWork", "DepartmentId");
            AddForeignKey("dbo.DepartmentWork", "DepartmentId", "dbo.Department", "Id", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.DepartmentWork", "DepartmentId", "dbo.Department");
            DropIndex("dbo.DepartmentWork", new[] { "DepartmentId" });
            AlterColumn("dbo.DepartmentWork", "CloseUserId", c => c.Int(nullable: false));
            AlterColumn("dbo.DepartmentWork", "RegisterUserId", c => c.Int(nullable: false));
            DropColumn("dbo.DepartmentWork", "DepartmentId");
        }
    }
}
