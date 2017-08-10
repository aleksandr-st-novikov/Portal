using DevExpress.Web;
using Portal.BL.Core;
using Portal.Models.EFContext;
using Portal.Models.Entities;
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
            SqlDataSourceEmployee.SelectCommand = "SELECT [Id], concat([Lastname], ' ', [Firstname], ' ', [Patronymic]) as FIO FROM [Employee] WHERE [DepartmentId] IN (" + (String)Session["DepartmentNode"] + ") AND [IsWork] = 1 ORDER BY concat([Lastname], ' ', [Firstname], ' ', [Patronymic])";
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
            SqlDataSourceExit.SelectCommand = "SELECT * FROM [Exit] LEFT JOIN [Employee] ON [Exit].[EmployeeId] = [Employee].[Id] WHERE [Exit].[RunType] = 0 AND [Employee].[IsWork] = 1 AND (([Exit].[DateFrom] >= @DateFrom) AND ([Exit].[DateTo] IS NULL OR [Exit].[DateTo] <= @DateTo)) AND [Exit].[DepartmentId] IN (" + (String)Session["DepartmentNode"] + ")";
        }

        private void DSExitAllSelectCommand()
        {
            SqlDataSourceExit.SelectCommand = "SELECT * FROM [Exit] LEFT JOIN [Employee] ON [Exit].[EmployeeId] = [Employee].[Id] WHERE [Exit].[RunType] = 0 AND [Employee].[IsWork] = 1 AND (([Exit].[DateFrom] >= @DateFrom) AND ([Exit].[DateTo] IS NULL OR ([Exit].[DateTo] <= @DateTo)))";
            //SqlDataSourceExit.SelectCommand = "SELECT * FROM [Exit] LEFT JOIN [Employee] ON [Exit].[EmployeeId] = [Employee].[Id]";
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
            else
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
            else
            {
                DSExitSelectCommand();
            }
        }

        protected void ASPxGridViewExit_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["RunType"] = Enums.RunType.Exit;
            e.NewValues["PetmitEmployeeId"] = Session["PetmitEmployeeId"];
            using (EmployeeContext employeeContext = new EmployeeContext())
            {
                e.NewValues["DepartmentId"] = employeeContext.FindById((int)e.NewValues["EmployeeId"]).DepartmentId;
            }
        }

        protected void ASPxGridViewExit_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            ASPxGridViewExit.SettingsText.PopupEditFormCaption = "Согласовать выход сотрудника";
        }

        protected void ASPxGridViewExit_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            ASPxGridViewExit.SettingsText.PopupEditFormCaption = "Согласование выхода сотрудника";
        }

        protected async void ASPxCallbackPanelDescription_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            int id = Int32.Parse(e.Parameter);
            ASPxCallbackPanel cp = ASPxGridViewExit.FindEditFormTemplateControl("ASPxCallbackPanelDescription") as ASPxCallbackPanel;
            ASPxLabel labelFIO = cp.FindControl("ASPxLabelFIO") as ASPxLabel;
            ASPxLabel labelPosition = cp.FindControl("ASPxLabelPosition") as ASPxLabel;
            ASPxLabel labelDepartment = cp.FindControl("ASPxLabelDepartment") as ASPxLabel;
            ASPxImage imagePhoto = cp.FindControl("ASPxImagePhoto") as ASPxImage;
            using (EmployeeContext employeeContext = new EmployeeContext())
            {
                Employee employee = await employeeContext.FindByIdAsync(id);
                labelFIO.Text = employee.FullName;
                labelPosition.Text = employee.Position.Name;
                labelDepartment.Text = employee.Department.Name;
                imagePhoto.ImageUrl = @"~\Content\Photo\" + employee.FullName.Trim() + ".jpg";
            }
        }
    }
}