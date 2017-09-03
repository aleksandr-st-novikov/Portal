namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UserLog1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.UserLog", "PCName", c => c.String(maxLength: 100));
            AlterColumn("dbo.UserLog", "UserName", c => c.String(maxLength: 100));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.UserLog", "UserName", c => c.String());
            DropColumn("dbo.UserLog", "PCName");
        }
    }
}
