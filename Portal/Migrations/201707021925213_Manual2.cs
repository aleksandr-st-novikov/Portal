namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Manual2 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Manual", "DateCreate", c => c.DateTime());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Manual", "DateCreate", c => c.DateTime(nullable: false));
        }
    }
}
