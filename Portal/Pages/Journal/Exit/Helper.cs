﻿using DevExpress.Web;
using Portal.BL.Core;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using BLTabel = Portal.BL.Tabel;

namespace Portal.Pages.Journal.Exit
{
    internal class Helper
    {
        internal static ASPxLabel labelFIO, labelPosition, labelDepartment, labelJobTime, labelOne, labelTwo, labelThree;
        internal static ASPxImage imagePhoto;

        internal static void OnCustomButtonInitialize(ASPxGridViewCustomButtonEventArgs e)
        {
            if (HttpContext.Current.User.IsInRole("Журналы - Согласование выходов - Служебный вход"))
            {
                if (e.ButtonID == "ButtonCheckExit" || e.ButtonID == "ButtonCheckEntrance")
                {
                    e.Visible = DevExpress.Utils.DefaultBoolean.True;
                }
            }
            else
            {
                if (e.ButtonID == "ButtonCheckExit" || e.ButtonID == "ButtonCheckEntrance")
                {
                    e.Visible = DevExpress.Utils.DefaultBoolean.False;
                }
            }
        }

        internal static void OnRowUpdating(DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            using (EmployeeContext employeeContext = new EmployeeContext())
            {
                e.NewValues["DepartmentId"] = employeeContext.FindById((int)e.NewValues["EmployeeId"]).DepartmentId;
            }
        }

        internal static void OnCommandButtonInitialize(ASPxGridView ASPxGridViewExit, ASPxGridViewCommandButtonEventArgs e)
        {
            if (HttpContext.Current.User.IsInRole("Журналы - Согласование выходов - Служебный вход"))
            {
                if (e.ButtonType == ColumnCommandButtonType.New || e.ButtonType == ColumnCommandButtonType.Delete)
                    e.Visible = false;
            }

            if (!HttpContext.Current.User.IsInRole("Администраторы"))
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

        internal static void OnCellEditorInitialize(ASPxGridView ASPxGridViewExit, ASPxGridViewEditorEventArgs e)
        {
            if (!HttpContext.Current.User.IsInRole("Администраторы"))
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
                            (e.Editor as ASPxMemo).ForeColor = System.Drawing.ColorTranslator.FromHtml("#BBBBBB");
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

        internal static void OnRowInserting(Enums.RunType runType, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["RunType"] = runType;
            e.NewValues["PetmitEmployeeId"] = HttpContext.Current.Session["PetmitEmployeeId"];
            using (EmployeeContext employeeContext = new EmployeeContext())
            {
                e.NewValues["DepartmentId"] = employeeContext.FindById((int)e.NewValues["EmployeeId"]).DepartmentId;
            }
            e.NewValues["DateCreate"] = DateTime.Now;
        }

        internal static void OnInitNewRow(ASPxGridView ASPxGridViewExit, string title, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            ASPxGridViewExit.SettingsText.PopupEditFormCaption = title;
            GetElements(ASPxGridViewExit, out labelFIO, out labelPosition, out labelDepartment, out imagePhoto);
            labelFIO.Text = labelPosition.Text = labelDepartment.Text = imagePhoto.ImageUrl = labelJobTime.Text
                = labelOne.Text = labelTwo.Text = labelThree.Text = String.Empty;
            e.NewValues["DateFrom"] = DateTime.Now.AddMinutes(5);
        }

        internal static void GetElements(ASPxGridView ASPxGridViewExit, out ASPxLabel labelFIO, out ASPxLabel labelPosition, out ASPxLabel labelDepartment, out ASPxImage imagePhoto)
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

        internal static async Task SetElemetsValue(ASPxGridView ASPxGridViewExit, int id)
        {
            GetElements(ASPxGridViewExit, out labelFIO, out labelPosition, out labelDepartment, out imagePhoto);

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
                    List<string> tabelData = await BLTabel.Methods.GetDataTabelAsync(DateTime.Now, employee.TabN.Remove(employee.TabN.Length - 3));
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

        internal static void OnHtmlEditFormCreated(ASPxGridView ASPxGridViewExit)
        {
            if (ASPxGridViewExit.EditingRowVisibleIndex > -1)
            {
                int employeeId = (int)ASPxGridViewExit.GetRowValues(ASPxGridViewExit.EditingRowVisibleIndex, "EmployeeId");
                int id = (int)ASPxGridViewExit.GetRowValues(ASPxGridViewExit.EditingRowVisibleIndex, "Id");

                GetElements(ASPxGridViewExit, out labelFIO, out labelPosition, out labelDepartment, out imagePhoto);
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
                        List<string> tabelData = BLTabel.Methods.GetDataTabel(exit.DateFrom, employee.TabN.Remove(employee.TabN.Length - 3));
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

        internal static async Task OnCallBack_PanelDescription(ASPxGridView ASPxGridViewExit, CallbackEventArgsBase e)
        {
            int id = Int32.Parse(e.Parameter);
            await SetElemetsValue(ASPxGridViewExit, id);
        }

        internal static void OnHtmlDataCellPrepared(ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "EmployeeId")
            {
                e.Cell.Attributes.Add("onclick", "ASPxClientCallbackInfo.PerformCallback('" +
                    e.GetValue("EmployeeId") + ";" + e.GetValue("PetmitEmployeeId") + ";" + e.GetValue("Id") + "');");
            }
        }

        internal static void OnStartRowEditing(ASPxGridView ASPxGridViewExit)
        {
            ASPxGridViewExit.SettingsText.PopupEditFormCaption = "Согласование выхода сотрудника";

            if (HttpContext.Current.User.IsInRole("Журналы - Согласование выходов - Служебный вход"))
            {
                ((GridViewDataColumn)ASPxGridViewExit.Columns["DateFromCheck"]).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.True;
                ((GridViewDataColumn)ASPxGridViewExit.Columns["DateToCheck"]).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.True;
                ((GridViewDataColumn)ASPxGridViewExit.Columns["DescriptionOne"]).CellStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#BBBBBB");
                //((GridViewDataColumn)ASPxGridViewExit.Columns["DescriptionTwo"]).CellStyle.Border.BorderColor
                //    = ((GridViewDataColumn)ASPxGridViewExit.Columns["DateFromCheck"]).CellStyle.Border.BorderColor
                //    = System.Drawing.ColorTranslator.FromHtml("#484848");
                //((GridViewDataColumn)ASPxGridViewExit.Columns["DateToCheck"]).EditFormSettings. = true;

            }
            if (HttpContext.Current.User.IsInRole("Администраторы"))
            {
                ((GridViewDataColumn)ASPxGridViewExit.Columns["DateFromCheck"]).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.True;
                ((GridViewDataColumn)ASPxGridViewExit.Columns["DateToCheck"]).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.True;
            }
        }
    }
}