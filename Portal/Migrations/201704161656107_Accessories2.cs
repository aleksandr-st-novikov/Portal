namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Accessories2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AccessoriesTable", "QuantityAgreed", c => c.Int());
            AlterColumn("dbo.AccessoriesTable", "Quantity", c => c.Int());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.AccessoriesTable", "Quantity", c => c.Int(nullable: false));
            DropColumn("dbo.AccessoriesTable", "QuantityAgreed");
        }
    }
}
