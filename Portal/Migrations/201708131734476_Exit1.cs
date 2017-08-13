namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Exit1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Exit", "DateCreate", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Exit", "DateCreate");
        }
    }
}
