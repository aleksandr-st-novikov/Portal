namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AdmissionSRT1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AdmissionSRT", "DepartmentId", c => c.Int());
            CreateIndex("dbo.AdmissionSRT", "DepartmentId");
            AddForeignKey("dbo.AdmissionSRT", "DepartmentId", "dbo.Department", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.AdmissionSRT", "DepartmentId", "dbo.Department");
            DropIndex("dbo.AdmissionSRT", new[] { "DepartmentId" });
            DropColumn("dbo.AdmissionSRT", "DepartmentId");
        }
    }
}
