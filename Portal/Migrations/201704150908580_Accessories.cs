namespace Portal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Accessories : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.StationeryDepartment", "DepartmentId", "dbo.Department");
            DropForeignKey("dbo.StationeryDepartment", "EmployeeId", "dbo.Employee");
            DropForeignKey("dbo.Stationery", "StationeryDepartmentId", "dbo.StationeryDepartment");
            DropForeignKey("dbo.StationeryTable", "StationeryId", "dbo.Stationery");
            DropForeignKey("dbo.StationeryTable", "StationeryProductId", "dbo.StationeryProduct");
            DropForeignKey("dbo.StationeryDepartment", "StationeryTypeId", "dbo.StationeryType");
            DropForeignKey("dbo.StationeryProduct", "StationeryType_Id", "dbo.StationeryType");
            DropForeignKey("dbo.Stationery", "StationeryType_Id", "dbo.StationeryType");
            DropIndex("dbo.StationeryDepartment", new[] { "DepartmentId" });
            DropIndex("dbo.StationeryDepartment", new[] { "EmployeeId" });
            DropIndex("dbo.StationeryDepartment", new[] { "StationeryTypeId" });
            DropIndex("dbo.Stationery", new[] { "StationeryDepartmentId" });
            DropIndex("dbo.Stationery", new[] { "StationeryType_Id" });
            DropIndex("dbo.StationeryTable", new[] { "StationeryId" });
            DropIndex("dbo.StationeryTable", new[] { "StationeryProductId" });
            DropIndex("dbo.StationeryProduct", new[] { "StationeryType_Id" });
            CreateTable(
                "dbo.Accessories",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        DateDocument = c.DateTime(nullable: false),
                        StationeyTypeId = c.Int(nullable: false),
                        AccessoriesDepartmentId = c.Int(nullable: false),
                        Status = c.Int(nullable: false),
                        AccessoriesType_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AccessoriesDepartment", t => t.AccessoriesDepartmentId, cascadeDelete: true)
                .ForeignKey("dbo.AccessoriesType", t => t.AccessoriesType_Id)
                .Index(t => t.AccessoriesDepartmentId)
                .Index(t => t.AccessoriesType_Id);
            
            CreateTable(
                "dbo.AccessoriesDepartment",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        DepartmentId = c.Int(nullable: false),
                        EmployeeId = c.Int(nullable: false),
                        Description = c.String(maxLength: 150),
                        AccessoriesTypeId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AccessoriesType", t => t.AccessoriesTypeId, cascadeDelete: true)
                .ForeignKey("dbo.Department", t => t.DepartmentId, cascadeDelete: true)
                .ForeignKey("dbo.Employee", t => t.EmployeeId, cascadeDelete: true)
                .Index(t => t.DepartmentId)
                .Index(t => t.EmployeeId)
                .Index(t => t.AccessoriesTypeId);
            
            CreateTable(
                "dbo.AccessoriesType",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 20),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.AccessoriesProduct",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 150),
                        Unit = c.String(maxLength: 20),
                        QuantityPerOne = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Price = c.Double(nullable: false),
                        IsActive = c.Boolean(nullable: false),
                        AccessoriesId = c.Int(nullable: false),
                        AccessoriesType_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.AccessoriesType", t => t.AccessoriesType_Id)
                .Index(t => t.AccessoriesType_Id);
            
            CreateTable(
                "dbo.AccessoriesTable",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        AccessoriesId = c.Int(nullable: false),
                        AccessoriesProductId = c.Int(nullable: false),
                        Quantity = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Accessories", t => t.AccessoriesId, cascadeDelete: true)
                .ForeignKey("dbo.AccessoriesProduct", t => t.AccessoriesProductId, cascadeDelete: true)
                .Index(t => t.AccessoriesId)
                .Index(t => t.AccessoriesProductId);
            
            DropTable("dbo.StationeryDepartment");
            DropTable("dbo.Stationery");
            DropTable("dbo.StationeryTable");
            DropTable("dbo.StationeryProduct");
            DropTable("dbo.StationeryType");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.StationeryType",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 20),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.StationeryProduct",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 150),
                        Unit = c.String(maxLength: 20),
                        QuantityPerOne = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Price = c.Double(nullable: false),
                        IsActive = c.Boolean(nullable: false),
                        StationeryId = c.Int(nullable: false),
                        StationeryType_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.StationeryTable",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        StationeryId = c.Int(nullable: false),
                        StationeryProductId = c.Int(nullable: false),
                        Quantity = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Stationery",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        DateDocument = c.DateTime(nullable: false),
                        StationeyTypeId = c.Int(nullable: false),
                        StationeryDepartmentId = c.Int(nullable: false),
                        Status = c.Int(nullable: false),
                        StationeryType_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.StationeryDepartment",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        DepartmentId = c.Int(nullable: false),
                        EmployeeId = c.Int(nullable: false),
                        Description = c.String(maxLength: 150),
                        StationeryTypeId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            DropForeignKey("dbo.Accessories", "AccessoriesType_Id", "dbo.AccessoriesType");
            DropForeignKey("dbo.AccessoriesDepartment", "EmployeeId", "dbo.Employee");
            DropForeignKey("dbo.AccessoriesDepartment", "DepartmentId", "dbo.Department");
            DropForeignKey("dbo.AccessoriesProduct", "AccessoriesType_Id", "dbo.AccessoriesType");
            DropForeignKey("dbo.AccessoriesTable", "AccessoriesProductId", "dbo.AccessoriesProduct");
            DropForeignKey("dbo.AccessoriesTable", "AccessoriesId", "dbo.Accessories");
            DropForeignKey("dbo.AccessoriesDepartment", "AccessoriesTypeId", "dbo.AccessoriesType");
            DropForeignKey("dbo.Accessories", "AccessoriesDepartmentId", "dbo.AccessoriesDepartment");
            DropIndex("dbo.AccessoriesTable", new[] { "AccessoriesProductId" });
            DropIndex("dbo.AccessoriesTable", new[] { "AccessoriesId" });
            DropIndex("dbo.AccessoriesProduct", new[] { "AccessoriesType_Id" });
            DropIndex("dbo.AccessoriesDepartment", new[] { "AccessoriesTypeId" });
            DropIndex("dbo.AccessoriesDepartment", new[] { "EmployeeId" });
            DropIndex("dbo.AccessoriesDepartment", new[] { "DepartmentId" });
            DropIndex("dbo.Accessories", new[] { "AccessoriesType_Id" });
            DropIndex("dbo.Accessories", new[] { "AccessoriesDepartmentId" });
            DropTable("dbo.AccessoriesTable");
            DropTable("dbo.AccessoriesProduct");
            DropTable("dbo.AccessoriesType");
            DropTable("dbo.AccessoriesDepartment");
            DropTable("dbo.Accessories");
            CreateIndex("dbo.StationeryProduct", "StationeryType_Id");
            CreateIndex("dbo.StationeryTable", "StationeryProductId");
            CreateIndex("dbo.StationeryTable", "StationeryId");
            CreateIndex("dbo.Stationery", "StationeryType_Id");
            CreateIndex("dbo.Stationery", "StationeryDepartmentId");
            CreateIndex("dbo.StationeryDepartment", "StationeryTypeId");
            CreateIndex("dbo.StationeryDepartment", "EmployeeId");
            CreateIndex("dbo.StationeryDepartment", "DepartmentId");
            AddForeignKey("dbo.Stationery", "StationeryType_Id", "dbo.StationeryType", "Id");
            AddForeignKey("dbo.StationeryProduct", "StationeryType_Id", "dbo.StationeryType", "Id");
            AddForeignKey("dbo.StationeryDepartment", "StationeryTypeId", "dbo.StationeryType", "Id", cascadeDelete: true);
            AddForeignKey("dbo.StationeryTable", "StationeryProductId", "dbo.StationeryProduct", "Id", cascadeDelete: true);
            AddForeignKey("dbo.StationeryTable", "StationeryId", "dbo.Stationery", "Id", cascadeDelete: true);
            AddForeignKey("dbo.Stationery", "StationeryDepartmentId", "dbo.StationeryDepartment", "Id", cascadeDelete: true);
            AddForeignKey("dbo.StationeryDepartment", "EmployeeId", "dbo.Employee", "Id", cascadeDelete: true);
            AddForeignKey("dbo.StationeryDepartment", "DepartmentId", "dbo.Department", "Id", cascadeDelete: true);
        }
    }
}
