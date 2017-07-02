namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Manual1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Manual", "Name", c => c.String(maxLength: 500));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Manual", "Name");
        }
    }
}
