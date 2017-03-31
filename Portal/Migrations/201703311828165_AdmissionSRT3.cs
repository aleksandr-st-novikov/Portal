namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AdmissionSRT3 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AdmissionSRT", "PositionId", c => c.Int());
            CreateIndex("dbo.AdmissionSRT", "PositionId");
            AddForeignKey("dbo.AdmissionSRT", "PositionId", "dbo.Position", "Id");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.AdmissionSRT", "PositionId", "dbo.Position");
            DropIndex("dbo.AdmissionSRT", new[] { "PositionId" });
            DropColumn("dbo.AdmissionSRT", "PositionId");
        }
    }
}
