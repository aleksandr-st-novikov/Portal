using DevExpress.Web;
using Portal.BL.Core;
using System;

namespace Portal.Pages.Journal.Exit
{
    public partial class ExitGrid : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.IsInRole("Журналы - Согласование выходов - Руководители"))
            {
                DSExitSelectCommand();
                DSEmployeeSelectCommand();
            }
            if (Context.User.IsInRole("Администраторы")
                || Context.User.IsInRole("Журналы - Согласование выходов - Руководители - Все сотрудники")
                || Context.User.IsInRole("Журналы - Согласование выходов - Служебный вход"))
            {
                DSExitAllSelectCommand();
                DSEmployeeAllSelectCommand();
            }
        }


        protected void SqlDataSourcePetmitEmployee_Init(object sender, EventArgs e)
        {
            DSPermitEmployeeSelectCommand();
        }

        #region SelectCommand

        private void DSEmployeeSelectCommand()
        {
            SqlDataSourceEmployee.SelectCommand = "SELECT [Id], concat([Lastname], ' ', [Firstname], ' ', [Patronymic]) as FIO FROM [Employee] WHERE [DepartmentId] IN (" + Session["DepartmentNode"] + ") AND [IsWork] = 1 ORDER BY concat([Lastname], ' ', [Firstname], ' ', [Patronymic])";
        }

        private void DSEmployeeAllSelectCommand()
        {
            SqlDataSourceEmployee.SelectCommand = "SELECT [Id], concat([Lastname], ' ', [Firstname], ' ', [Patronymic]) as FIO FROM [Employee] WHERE [IsWork] = 1 ORDER BY concat([Lastname], ' ', [Firstname], ' ', [Patronymic])";
        }

        private void DSPermitEmployeeSelectCommand()
        {
            SqlDataSourcePetmitEmployee.SelectCommand = "SELECT [Id], concat([Lastname], ' ', left([Firstname],1), '.', left([Patronymic],1), '.') as FIO FROM [Employee] WHERE [IsWork] = 1";
        }

        private void DSExitSelectCommand()
        {
            SqlDataSourceExit.SelectCommand = "SELECT * FROM [Exit] LEFT JOIN [Employee] ON [Exit].[EmployeeId] = [Employee].[Id] WHERE [Exit].[RunType] = 0 AND [Employee].[IsWork] = 1 AND [Exit].[DateFrom] >= @DateFrom AND (([Exit].[DateTo] IS NULL) OR ([Exit].[DateTo] <= @DateTo)) AND ([Exit].[DepartmentId] IN (" + Session["DepartmentNode"] + "))";
        }

        private void DSExitAllSelectCommand()
        {
            SqlDataSourceExit.SelectCommand = "SELECT * FROM [Exit] LEFT JOIN [Employee] ON [Exit].[EmployeeId] = [Employee].[Id] WHERE [Exit].[RunType] = 0 AND [Employee].[IsWork] = 1 AND (([Exit].[DateFrom] >= @DateFrom) AND ([Exit].[DateTo] IS NULL OR ([Exit].[DateTo] <= @DateTo)))";
        }
        #endregion

        protected void SqlDataSourceEmployee_Init(object sender, EventArgs e)
        {
            if (Context.User.IsInRole("Журналы - Согласование выходов - Руководители - Все сотрудники")
                || Context.User.IsInRole("Администраторы")
                || Context.User.IsInRole("Журналы - Согласование выходов - Служебный вход"))
            {
                DSEmployeeAllSelectCommand();
            }
            else if (Context.User.IsInRole("Журналы - Согласование выходов - Руководители"))
            {
                DSEmployeeSelectCommand();
            }
        }

        protected void SqlDataSourceExit_Init(object sender, EventArgs e)
        {
            if (Context.User.IsInRole("Журналы - Согласование выходов - Руководители - Все сотрудники")
                || Context.User.IsInRole("Администраторы")
                || Context.User.IsInRole("Журналы - Согласование выходов - Служебный вход"))
            {
                DSExitAllSelectCommand();
            }
            else if (Context.User.IsInRole("Журналы - Согласование выходов - Руководители"))
            {
                DSExitSelectCommand();
            }
        }

        protected void ASPxGridViewExit_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Helper.OnRowInserting(Enums.RunType.Exit, e);
        }

        protected void ASPxGridViewExit_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            Helper.OnInitNewRow(ASPxGridViewExit, "Согласовать выход сотрудника", e);
        }

        protected void ASPxGridViewExit_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Helper.OnStartRowEditing(ASPxGridViewExit);
        }

        protected void ASPxGridViewExit_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            Helper.OnCellEditorInitialize(ASPxGridViewExit, e);
        }

        protected void ASPxGridViewExit_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            Helper.OnCommandButtonInitialize(ASPxGridViewExit, e);
        }

        protected void ASPxGridViewExit_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Helper.OnRowUpdating(e);
        }

        protected void ASPxGridViewExit_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {
            Helper.OnCustomButtonInitialize(ASPxGridViewExit, e);
        }

        protected void ASPxGridViewExit_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            Helper.OnHtmlDataCellPrepared(e);
        }

        protected async void ASPxCallbackPanelDescription_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            await Helper.OnCallBack_PanelDescription(ASPxGridViewExit, e);
        }

        protected void ASPxGridViewExit_HtmlEditFormCreated(object sender, ASPxGridViewEditFormEventArgs e)
        {
            Helper.OnHtmlEditFormCreated(ASPxGridViewExit);
        }

        protected async void ASPxCallbackExit_Callback(object source, CallbackEventArgs e)
        {
            await Helper.SetCheckDateAsync(1, e);
        }

        protected async void ASPxCallbackEntrance_Callback(object source, CallbackEventArgs e)
        {
            await Helper.SetCheckDateAsync(2, e);
        }

    }
}