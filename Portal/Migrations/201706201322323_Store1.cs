namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Store1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Store", "StoreName", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Store", "StoreName");
        }
    }
}
