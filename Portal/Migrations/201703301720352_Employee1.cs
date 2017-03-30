namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Employee1 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Employee", "TabN", c => c.String());
            AlterColumn("dbo.Employee", "Lastname", c => c.String());
            AlterColumn("dbo.Employee", "Firstname", c => c.String());
            AlterColumn("dbo.Employee", "Patronymic", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Employee", "Patronymic", c => c.String(maxLength: 150));
            AlterColumn("dbo.Employee", "Firstname", c => c.String(maxLength: 150));
            AlterColumn("dbo.Employee", "Lastname", c => c.String(nullable: false, maxLength: 150));
            AlterColumn("dbo.Employee", "TabN", c => c.String(nullable: false, maxLength: 150));
        }
    }
}
