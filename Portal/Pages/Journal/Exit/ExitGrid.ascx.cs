using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.Exit
{
    public partial class ExitGrid : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSourcePetmitEmployee_Init(object sender, EventArgs e)
        {
            DSPermitEmployeeSelectCommand();
        }

        #region SelectCommand
        private void DSEmployeeSelectCommand()
        {
            SqlDataSourceEmployee.SelectCommand = "SELECT [Id], concat([Lastname], ' ', [Firstname], ' ', [Patronymic]) as FIO FROM [Employee] WHERE [DepartmentId] IN (" + (String)Session["DepartmentNode"] + ") AND [IsWork] = 1";
        }

        private void DSEmployeeAllSelectCommand()
        {
            SqlDataSourceEmployee.SelectCommand = "SELECT [Id], concat([Lastname], ' ', [Firstname], ' ', [Patronymic]) as FIO FROM [Employee] WHERE [IsWork] = 1";
        }

        private void DSPermitEmployeeSelectCommand()
        {
            SqlDataSourcePetmitEmployee.SelectCommand = "SELECT [Id], concat([Lastname], ' ', left([Firstname],1), '.', left([Patronymic],1), '.') as FIO FROM [Employee] WHERE [IsWork] = 1";
        }

        //private void DSTransportSelectCommand()
        //{
        //    SqlDataSourceTransport.SelectCommand = "SELECT * FROM [Transport] INNER JOIN [Employee] ON [Transport].[EmployeeId] = [Employee].[Id] WHERE [Employee].[IsWork] = 1 AND (([Transport].[DateTransport] >= @DateTransport) AND ([Transport].[DateTransport] <= @DateTransport2)) AND [Transport].[DepartmentId] IN (" + (String)Session["DepartmentNode"] + ")";
        //}

        //private void DSTransportSelectCommandEntrance()
        //{
        //    SqlDataSourceTransport.SelectCommand = "SELECT * FROM [Transport] INNER JOIN [Employee] ON [Transport].[EmployeeId] = [Employee].[Id] WHERE [Employee].[IsWork] = 1 AND (([Transport].[DateTransport] >= @DateTransport) AND ([Transport].[DateTransport] <= @DateTransport2))";
        //}
        #endregion

        protected void SqlDataSourceEmployee_Init(object sender, EventArgs e)
        {
            if (Context.User.IsInRole("Журналы - Согласование выходов - Руководители - Все сотрудники")
                || Context.User.IsInRole("Администраторы")
                || Context.User.IsInRole("Журналы - Согласование выходов - Служебный вход"))
            {
                DSEmployeeAllSelectCommand();
            }
            else
            {
                DSEmployeeSelectCommand();
            }
        }
    }
}