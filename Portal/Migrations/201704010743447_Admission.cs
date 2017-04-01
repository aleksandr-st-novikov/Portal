namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Admission : DbMigration
    {
        public override void Up()
        {
            RenameTable(name: "dbo.AdmissionSRT", newName: "Admission");
            AddColumn("dbo.Admission", "MedOsm", c => c.DateTime());
            AddColumn("dbo.Admission", "IsWork", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Admission", "IsWork");
            DropColumn("dbo.Admission", "MedOsm");
            RenameTable(name: "dbo.Admission", newName: "AdmissionSRT");
        }
    }
}
