using Portal.Models.EFContext;
using System;
using Portal.BL.Core;

namespace Portal.Pages.Journal.Transport
{
    public partial class TransportGrid : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.IsInRole("Журналы - Транспорт - Служебный вход"))
            {
                ASPxGridViewTransport.Columns[0].Visible = false;
                DSTransportSelectCommandEntrance();
                DSEmployeeSelectCommandEntrance();
            }
            if (Context.User.IsInRole("Журналы - Транспорт - Руководители"))
            {
                DSTransportSelectCommand();
                DSEmployeeSelectCommand();
            }
            if (Context.User.IsInRole("Администраторы")
                || Context.User.IsInRole("Журналы - Транспорт - Руководители - Все сотрудники"))
            {
                DSTransportSelectCommandEntrance();
                DSEmployeeSelectCommandEntrance();
            }
            if (!Page.IsPostBack && !Page.IsCallback)
            {
                ASPxTimerTransport.Interval = Data.TimeoutRefresh * 1000;
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
            e.NewValues["DateTransport"] = Convert.ToDateTime((DateTime.Now).ToString("yyyy-MM-dd 00:00:00"));
        }


        protected void SqlDataSourceEmployee_Init(object sender, EventArgs e)
        {
            if (Context.User.IsInRole("Журналы - Транспорт - Служебный вход") 
                || Context.User.IsInRole("Администраторы")
                || Context.User.IsInRole("Журналы - Транспорт - Руководители - Все сотрудники"))
            {
                DSEmployeeSelectCommandEntrance();
            }
            else
            {
                DSEmployeeSelectCommand();
            }
        }

        protected void SqlDataSourceTransport_Init(object sender, EventArgs e)
        {
            if (Context.User.IsInRole("Журналы - Транспорт - Служебный вход") 
                || Context.User.IsInRole("Администраторы")
                || Context.User.IsInRole("Журналы - Транспорт - Руководители - Все сотрудники"))
            {
                DSTransportSelectCommandEntrance();
            }
            else
            {
                DSTransportSelectCommand();
            }
        }


        #region SelectCommand
        private void DSEmployeeSelectCommand()
        {
            SqlDataSourceEmployee.SelectCommand = "SELECT [Id], concat([Lastname], ' ', [Firstname], ' ', [Patronymic]) as FIO FROM [Employee] WHERE [DepartmentId] IN (" + (String)Session["DepartmentNode"] + ") AND [IsWork] = 1";
        }

        private void DSTransportSelectCommand()
        {
            SqlDataSourceTransport.SelectCommand = "SELECT * FROM [Transport] INNER JOIN [Employee] ON [Transport].[EmployeeId] = [Employee].[Id] WHERE [Employee].[IsWork] = 1 AND (([Transport].[DateTransport] >= @DateTransport) AND ([Transport].[DateTransport] <= @DateTransport2)) AND [Transport].[DepartmentId] IN (" + (String)Session["DepartmentNode"] + ")";
        }

        private void DSEmployeeSelectCommandEntrance()
        {
            SqlDataSourceEmployee.SelectCommand = "SELECT [Id], concat([Lastname], ' ', [Firstname], ' ', [Patronymic]) as FIO FROM [Employee] WHERE [IsWork] = 1";
        }

        private void DSTransportSelectCommandEntrance()
        {
            SqlDataSourceTransport.SelectCommand = "SELECT * FROM [Transport] INNER JOIN [Employee] ON [Transport].[EmployeeId] = [Employee].[Id] WHERE [Employee].[IsWork] = 1 AND (([Transport].[DateTransport] >= @DateTransport) AND ([Transport].[DateTransport] <= @DateTransport2))";
        }
        #endregion

    }
}