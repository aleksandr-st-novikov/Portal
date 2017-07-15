using Portal.Models.EFContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.Transport
{
    public partial class TransportGrid : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.IsInRole("Журналы - Транспорт - Служебный вход"))
            {
                ASPxGridViewTransport.Columns[0].Visible = false;
                SqlDataSourceTransport.SelectCommand = "SELECT * FROM [Transport] WHERE (([DateTransport] >= @DateTransport) AND ([DateTransport] <= @DateTransport2)) ORDER BY [DateTransport] DESC";
            }
            else
            {
                SqlDataSourceTransport.SelectCommand = "SELECT * FROM [Transport] WHERE (([DateTransport] >= @DateTransport) AND ([DateTransport] <= @DateTransport2)) AND [DepartmentId] IN (" + (String)Session["DepartmentNode"] + ") ORDER BY [DateTransport] DESC";
                SqlDataSourceEmployee.SelectCommand = "SELECT[Id], concat([Lastname], ' ', [Firstname], ' ', [Patronymic]) as FIO FROM[Employee] WHERE [DepartmentId] IN (" + (String)Session["DepartmentNode"] + ") AND ([IsWork] = 1)";
            }
        }

        protected void ASPxGridViewTransport_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            using (EmployeeContext employeeContext = new EmployeeContext())
            {
                e.NewValues["DepartmentId"] = employeeContext.FindById((int)e.NewValues["EmployeeId"]).DepartmentId;
            }
        }

        protected void ASPxGridViewTransport_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["DateTransport"] = DateTime.Now;
        }
    }
}