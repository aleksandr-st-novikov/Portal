namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Employee2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Employee", "IsWork", c => c.Boolean(nullable: false, defaultValue: true));
            AlterColumn("dbo.Employee", "TabN", c => c.String(maxLength: 15));
            AlterColumn("dbo.Employee", "Lastname", c => c.String(maxLength: 150));
            AlterColumn("dbo.Employee", "Firstname", c => c.String(maxLength: 150));
            AlterColumn("dbo.Employee", "Patronymic", c => c.String(maxLength: 150));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Employee", "Patronymic", c => c.String());
            AlterColumn("dbo.Employee", "Firstname", c => c.String());
            AlterColumn("dbo.Employee", "Lastname", c => c.String());
            AlterColumn("dbo.Employee", "TabN", c => c.String());
            DropColumn("dbo.Employee", "IsWork");
        }
    }
}
