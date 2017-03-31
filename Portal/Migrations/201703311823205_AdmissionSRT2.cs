namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AdmissionSRT2 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.AdmissionSRT", "DateFlu", c => c.DateTime());
            AlterColumn("dbo.AdmissionSRT", "Dopusk", c => c.DateTime());
            AlterColumn("dbo.AdmissionSRT", "SanMin", c => c.DateTime());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.AdmissionSRT", "SanMin", c => c.DateTime(nullable: false));
            AlterColumn("dbo.AdmissionSRT", "Dopusk", c => c.DateTime(nullable: false));
            AlterColumn("dbo.AdmissionSRT", "DateFlu", c => c.DateTime(nullable: false));
        }
    }
}
