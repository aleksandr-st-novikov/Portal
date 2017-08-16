using DevExpress.Web;
using Portal.BL.Core;
using Portal.BL.Tabel.Models;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.Exit
{
    public partial class ExitGrid : System.Web.UI.UserControl
    {
        ASPxLabel labelFIO, labelPosition, labelDepartment, labelJobTime, labelOne, labelTwo, labelThree;
        ASPxImage imagePhoto;

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
            e.NewValues["RunType"] = Enums.RunType.Exit;
            e.NewValues["PetmitEmployeeId"] = Session["PetmitEmployeeId"];
            using (EmployeeContext employeeContext = new EmployeeContext())
            {
                e.NewValues["DepartmentId"] = employeeContext.FindById((int)e.NewValues["EmployeeId"]).DepartmentId;
            }
            e.NewValues["DateCreate"] = DateTime.Now;
        }

        protected void ASPxGridViewExit_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            ASPxGridViewExit.SettingsText.PopupEditFormCaption = "Согласовать выход сотрудника";
            GetElements(out labelFIO, out labelPosition, out labelDepartment, out imagePhoto);
            labelFIO.Text = labelPosition.Text = labelDepartment.Text = imagePhoto.ImageUrl = labelJobTime.Text
                = labelOne.Text = labelTwo.Text = labelThree.Text = String.Empty;
            e.NewValues["DateFrom"] = DateTime.Now.AddMinutes(5);
        }

        protected void ASPxGridViewExit_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            ASPxGridViewExit.SettingsText.PopupEditFormCaption = "Согласование выхода сотрудника";
        }

        protected void ASPxGridViewExit_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (!Context.User.IsInRole("Администраторы"))
            {
                if (e.VisibleIndex > -1)
                {
                    DateTime dateFrom = (DateTime)ASPxGridViewExit.GetRowValues(e.VisibleIndex, "DateFrom");
                    if (dateFrom <= DateTime.Now)
                    {
                        if (e.Column.FieldName == "DateFrom")
                        {
                            (e.Editor as ASPxDateEdit).Enabled = false;
                        }
                        if (e.Column.FieldName == "DateTo")
                        {
                            (e.Editor as ASPxDateEdit).Enabled = false;
                        }
                        if (e.Column.FieldName == "EmployeeId")
                        {
                            (e.Editor as ASPxComboBox).Enabled = false;
                        }
                        if (e.Column.FieldName == "ExitPurposeId")
                        {
                            (e.Editor as ASPxComboBox).Enabled = false;
                        }
                        if (e.Column.FieldName == "DescriptionOne")
                        {
                            (e.Editor as ASPxMemo).Enabled = false;
                        }
                    }
                }

                if (e.Column.FieldName == "DateFrom")
                {
                    (e.Editor as ASPxDateEdit).MinDate = DateTime.Now.Date;
                }
                if (e.Column.FieldName == "DateTo")
                {
                    (e.Editor as ASPxDateEdit).MinDate = DateTime.Now.Date;
                }
            }
        }

        protected void ASPxGridViewExit_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (!Context.User.IsInRole("Администраторы"))
            {
                if (e.VisibleIndex > -1)
                {
                    var obj = ASPxGridViewExit.GetRowValues(e.VisibleIndex, "DateFrom");
                    if (obj != null)
                    {
                        DateTime dateFrom = (DateTime)obj;
                        if (dateFrom <= DateTime.Now && e.ButtonType == ColumnCommandButtonType.Delete)
                            e.Enabled = false;
                    }
                }
            }
        }

        protected void ASPxGridViewExit_Init(object sender, EventArgs e)
        {
            if (Context.User.IsInRole("Журналы - Согласование выходов - Служебный вход"))
            {
                ASPxGridViewExit.FormatConditions.Clear();
            }
        }

        protected void ASPxGridViewExit_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if(e.DataColumn.FieldName == "EmployeeId")
            {
                e.Cell.ToolTip = e.GetValue("EmployeeId").ToString();
            }
        }

        protected async void ASPxCallbackPanelDescription_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            int id = Int32.Parse(e.Parameter);
            await SetElemetsValue(id);
        }

        protected void ASPxGridViewExit_HtmlEditFormCreated(object sender, ASPxGridViewEditFormEventArgs e)
        {
            if (ASPxGridViewExit.EditingRowVisibleIndex > -1)
            {
                int employeeId = (int)ASPxGridViewExit.GetRowValues(ASPxGridViewExit.EditingRowVisibleIndex, "EmployeeId");
                int id = (int)ASPxGridViewExit.GetRowValues(ASPxGridViewExit.EditingRowVisibleIndex, "Id");

                GetElements(out labelFIO, out labelPosition, out labelDepartment, out imagePhoto);
                using (EmployeeContext employeeContext = new EmployeeContext())
                using (ExitContext exitContext = new ExitContext())
                using (ConstantContext constantContext = new ConstantContext())
                {
                    Employee employee = employeeContext.FindById(employeeId);
                    Portal.Models.Entities.Exit exit = exitContext.FindById(id);

                    labelFIO.Text = employee.FullName;
                    labelPosition.Text = employee.Position.Name;
                    labelDepartment.Text = employee.Department.Name;
                    imagePhoto.ImageUrl = @"~\Content\Photo\" + employee.FullName.Trim() + ".jpg";

                    if ((String.IsNullOrEmpty(constantContext.GetConstString("ConnectToTabel")) ?
                        Data.ConnectToTabel : constantContext.GetConstString("ConnectToTabel")) == "1")
                    {
                        List<string> tabelData = GetDataTabel(exit.DateFrom, employee.TabN.Remove(employee.TabN.Length - 3));
                        if (tabelData.Count() > 0)
                        {
                            labelJobTime.Text = "Время работы по графику:";
                            labelOne.Text = tabelData[0];
                            labelTwo.Text = tabelData[1];
                            labelThree.Text = tabelData[2];
                        }
                    }
                }

            }
        }


        private async System.Threading.Tasks.Task SetElemetsValue(int id)
        {
            GetElements(out labelFIO, out labelPosition, out labelDepartment, out imagePhoto);

            using (EmployeeContext employeeContext = new EmployeeContext())
            using (ConstantContext constantContext = new ConstantContext())
            {
                Employee employee = await employeeContext.FindByIdAsync(id);

                labelFIO.Text = employee.FullName;
                labelPosition.Text = employee.Position.Name;
                labelDepartment.Text = employee.Department.Name;
                imagePhoto.ImageUrl = @"~\Content\Photo\" + employee.FullName.Trim() + ".jpg";

                if ((String.IsNullOrEmpty(constantContext.GetConstString("ConnectToTabel")) ?
                        Data.ConnectToTabel : constantContext.GetConstString("ConnectToTabel")) == "1")
                {
                    List<string> tabelData = await GetDataTabelAsync(DateTime.Now, employee.TabN.Remove(employee.TabN.Length - 3));
                    if (tabelData.Count() > 0)
                    {
                        labelJobTime.Text = "Время работы по графику:";
                        labelOne.Text = tabelData[0];
                        labelTwo.Text = tabelData[1];
                        labelThree.Text = tabelData[2];
                    }
                }
            }
        }

        private async Task<List<string>> GetDataTabelAsync(DateTime date, string tabN)
        {
            List<string> result = new List<string>();
            List<DataTabelEmployee3Days> rawData = await BL.Tabel.Methods.GetDataTabelEmployee3DaysAsync(date, tabN);
            if (rawData != null)
            {
                int count = 1;
                string firstTime = "", secondTime = "";
                foreach (var d in rawData)
                {
                    if (count % 2 != 0)
                    {
                        firstTime = d.DataTabel != null ? ((DateTime)d.DataTabel).ToString("HH:mm") : String.Empty;
                    }
                    else
                    {
                        secondTime = d.DataTabel != null ? ((DateTime)d.DataTabel).ToString("HH:mm") : String.Empty;
                        if (String.IsNullOrEmpty(firstTime))
                        {
                            result.Add(date.ToShortDateString() + ": " + "Выходной");
                        }
                        else
                        {
                            result.Add(date.ToShortDateString() + ": " + firstTime + " - " + secondTime);
                        }
                        date = date.AddDays(1);
                    }
                    count++;
                }
            }
            return result;
        }

        private List<string> GetDataTabel(DateTime date, string tabN)
        {
            List<string> result = new List<string>();
            List<DataTabelEmployee3Days> rawData = BL.Tabel.Methods.GetDataTabelEmployee3Days(date, tabN);
            if (rawData.Count() > 0)
            {
                int count = 1;
                string firstTime = "", secondTime = "";
                foreach (var d in rawData)
                {
                    if (count % 2 != 0)
                    {
                        firstTime = d.DataTabel != null ? ((DateTime)d.DataTabel).ToString("HH:mm") : String.Empty;
                    }
                    else
                    {
                        secondTime = d.DataTabel != null ? ((DateTime)d.DataTabel).ToString("HH:mm") : String.Empty;
                        if (String.IsNullOrEmpty(firstTime))
                        {
                            result.Add(date.ToShortDateString() + ": " + "Выходной");
                        }
                        else
                        {
                            result.Add(date.ToShortDateString() + ": " + firstTime + " - " + secondTime);
                        }
                        date = date.AddDays(1);
                    }
                    count++;
                }
            }
            return result;
        }

        private void GetElements(out ASPxLabel labelFIO, out ASPxLabel labelPosition, out ASPxLabel labelDepartment, out ASPxImage imagePhoto)
        {
            ASPxCallbackPanel cp = ASPxGridViewExit.FindEditFormTemplateControl("ASPxCallbackPanelDescription") as ASPxCallbackPanel;
            labelFIO = cp.FindControl("ASPxLabelFIO") as ASPxLabel;
            labelPosition = cp.FindControl("ASPxLabelPosition") as ASPxLabel;
            labelDepartment = cp.FindControl("ASPxLabelDepartment") as ASPxLabel;
            imagePhoto = cp.FindControl("ASPxImagePhoto") as ASPxImage;

            labelJobTime = cp.FindControl("ASPxLabelJobTime") as ASPxLabel;
            labelOne = cp.FindControl("ASPxLabelOne") as ASPxLabel;
            labelTwo = cp.FindControl("ASPxLabelTwo") as ASPxLabel;
            labelThree = cp.FindControl("ASPxLabelThree") as ASPxLabel;
        }
    }
}