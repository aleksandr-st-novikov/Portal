﻿using DevExpress.Web;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.Transport_old
{
    public partial class ManageTransport_old : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!(User.IsInRole("Администраторы")
                || User.IsInRole("Транспорт - Руководители")
                || User.IsInRole("Транспорт - Служебный вход")))
            {
                HttpContext.Current.Response.Redirect(ResolveUrl("~/"), false);
                return;
            }

            if (!Page.IsPostBack && !Page.IsCallback)
            {
                Page.Title = "Транспорт";


                using (DepartmentContext context = new DepartmentContext())
                {
                    Department department = await context.GetDepartmentByUserAsync(User.Identity.Name);
                    if (department != null)
                    {
                        ASPxLabelDepartment.Text = "Транспорт: " + department.Name;
                        Session["DepartmentId"] = department.Id;
                        Session["DepartmentNode"] = String.Join(",", (await context.GetNodeDepartmentAsync(department.Id)).ToArray());
                    }
                }
                InitData();

                if (!User.IsInRole("Администраторы"))
                {
                    TimeSpan start = new TimeSpan(0, 0, 0);
                    TimeSpan end = new TimeSpan(5, 0, 0);
                    TimeSpan now = DateTime.Now.TimeOfDay;

                    if ((now > start) && (now < end))
                    {
                        ASPxDateEditTransport.MinDate = new DateTime(DateTime.Now.AddDays(-1).Year, DateTime.Now.AddDays(-1).Month, DateTime.Now.AddDays(-1).Day, 0, 0, 0);
                    }
                    else
                    {
                        ASPxDateEditTransport.MinDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0);
                    }
                }
                else
                {
                    ASPxDateEditTransport.MinDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0);
                }


                if ((User.IsInRole("Администраторы")
                    || User.IsInRole("Транспорт - Служебный вход")))
                {
                    string script = @"setInterval(function () {ASPxClientCallbackRefreshData.PerformCallback()}, 60000)";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ManageTransport", script, true);
                }

                ASPxDateEditTransport.Value = Convert.ToDateTime((DateTime.Now).ToString("yyyy-MM-dd 00:00:00"));

                if (!ClientScript.IsStartupScriptRegistered("onKeyDownTransport"))
                {
                    string script = @"
                        document.onkeydown = onKeyDownTransport;
                        function onKeyDownTransport() {
                            if (event.keyCode == 13) {
                                if (ASPxClientGridViewHeadDepartment.IsEditing())
                                    ASPxClientGridViewHeadDepartment.UpdateEdit();
                            }
                        }";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "onKeyDownTransport", script, true);
                }
                Page.Form.DefaultButton = null;
            }
        }

        private void InitData()
        {
            if (User.IsInRole("Транспорт - Руководители"))
            {
                ASPxComboBoxEmployee.DataSourceID = "SqlDataSourceEmployeeHeadDepartment";
                ASPxGridViewHeadDepartment.DataSourceID = "SqlDataSourceTransportHeadDepartment";
                ((GridViewDataComboBoxColumn)ASPxGridViewHeadDepartment.Columns["EmployeeId"]).PropertiesComboBox.DataSourceID = "SqlDataSourceEmployeeHeadDepartment";
                SqlDataSourceTransportHeadDepartment.SelectCommand = "SELECT * FROM [Transport] WHERE (([DepartmentId] IN (" + (String)Session["DepartmentNode"] + ")) AND ([DateTransport] BETWEEN @DateTransport AND @DateTransport2)) ORDER BY [DateTransport] DESC, [Id] DESC";
                SqlDataSourceEmployeeHeadDepartment.SelectCommand = "SELECT [Id], CONCAT([Lastname], ' ', [Firstname], ' ', [Patronymic]) AS FIO FROM [Employee] WHERE ([IsWork] = @IsWork) AND ([DepartmentId] IN (" + (String)Session["DepartmentNode"] + ")) ORDER BY [FIO]";
                ASPxButtonPrint.Visible = false;

                Session["DateFrom"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.AddDays(-3).ToString("yyyy-MM-dd 00:00:00"));
                Session["DateTo"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.AddDays(1).ToString("yyyy-MM-dd 23:59:59"));
            }

            if (User.IsInRole("Администраторы")
                || User.IsInRole("Транспорт - Служебный вход"))
            {
                ASPxComboBoxEmployee.DataSourceID = "SqlDataSourceEmployeeEntrance";
                ASPxGridViewHeadDepartment.DataSourceID = "SqlDataSourceTransportEntrance";
                ((GridViewDataComboBoxColumn)ASPxGridViewHeadDepartment.Columns["EmployeeId"]).PropertiesComboBox.DataSourceID = "SqlDataSourceEmployeeEntrance";
                ASPxButtonPrint.Visible = true;

                TimeSpan start = new TimeSpan(0, 0, 0);
                TimeSpan end = new TimeSpan(5, 0, 0);
                TimeSpan now = DateTime.Now.TimeOfDay;

                if ((now > start) && (now < end))
                {
                    Session["DateFrom"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd 00:00:00"));
                    Session["DateTo"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd 23:59:59"));
                }
                else
                {
                    Session["DateFrom"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd 00:00:00"));
                    Session["DateTo"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd 23:59:59"));
                }
            }
            ASPxComboBoxAddress.DataBind();
        }

        protected async void ASPxCallbackAdd_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (Page.IsValid && ASPxCallbackAdd.IsCallback)
            {
                if (!User.IsInRole("Администраторы"))
                {
                    if (Convert.ToDateTime(ASPxDateEditTransport.Value) < new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0))
                    {
                        return;
                    }
                }
                using (TransportContext context = new TransportContext())
                {
                    Portal.Models.Entities.Transport transport = new Portal.Models.Entities.Transport()
                    {
                        EmployeeId = Convert.ToInt32(ASPxComboBoxEmployee.Value),
                        DateTransport = Convert.ToDateTime(ASPxDateEditTransport.Value),
                        Address = Convert.ToString(ASPxComboBoxAddress.Value)
                    };
                    await context.AddTransportAsync(transport);
                    await context.SaveChangesAsync();
                }
            }
        }

        protected void ASPxCallbackRefreshData_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (ASPxCallbackRefreshData.IsCallback)
            {
                Session["DateFrom"] = Convert.ToDateTime(((DateTime)ASPxDateEditGridFrom.Value).ToString("yyyy-MM-dd 00:00:00"));
                Session["DateTo"] = Convert.ToDateTime(((DateTime)ASPxDateEditGridTo.Value).ToString("yyyy-MM-dd 23:59:59"));
            }
        }

        protected void SqlDataSourceEmployeeHeadDepartment_Init(object sender, EventArgs e)
        {
            if (User.IsInRole("Транспорт - Руководители"))
            {
                ((GridViewDataComboBoxColumn)ASPxGridViewHeadDepartment.Columns["EmployeeId"]).PropertiesComboBox.DataSourceID = "SqlDataSourceEmployeeHeadDepartment";
                SqlDataSourceTransportHeadDepartment.SelectCommand = "SELECT * FROM [Transport] WHERE (([DepartmentId] IN (" + (String)Session["DepartmentNode"] + ")) AND ([DateTransport] BETWEEN @DateTransport AND @DateTransport2)) ORDER BY [DateTransport] DESC, [Id] DESC";
                SqlDataSourceEmployeeHeadDepartment.SelectCommand = "SELECT [Id], CONCAT([Lastname], ' ', [Firstname], ' ', [Patronymic]) AS FIO FROM [Employee] WHERE ([IsWork] = @IsWork) AND ([DepartmentId] IN (" + (String)Session["DepartmentNode"] + ")) ORDER BY [FIO]";
            }
        }

        protected void ASPxGridViewHeadDepartment_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (!User.IsInRole("Администраторы"))
            {
                TimeSpan start = new TimeSpan(0, 0, 0);
                TimeSpan end = new TimeSpan(5, 0, 0);
                TimeSpan now = DateTime.Now.TimeOfDay;

                if ((now > start) && (now < end))
                {
                    if (e.Column.FieldName == "DateTransport")
                        (e.Editor as ASPxDateEdit).MinDate = new DateTime(DateTime.Now.AddDays(-1).Year, DateTime.Now.AddDays(-1).Month, DateTime.Now.AddDays(-1).Day, 0, 0, 0);
                }
                else
                {
                    if (e.Column.FieldName == "DateTransport")
                        (e.Editor as ASPxDateEdit).MinDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0);
                }
            }

            if (e.Column.FieldName == "DateTransport")
                e.Editor.SetClientSideEventHandler("Init", "function(s, e) { setTimeout(function() {s.Focus();}, 0); }");
        }

        protected void ASPxCallbackPanelPopup_Callback(object sender, CallbackEventArgsBase e)
        {
            if (!Ok2Run("TransportAdd", 2) && !Ok2Run("TransportAdd", 3) && ASPxCallbackPanelPopup.IsCallback)
            {
                if (!User.IsInRole("Администраторы"))
                {
                    TimeSpan start = new TimeSpan(0, 0, 0);
                    TimeSpan end = new TimeSpan(5, 0, 0);
                    TimeSpan now = DateTime.Now.TimeOfDay;

                    if ((now > start) && (now < end))
                    {
                        ASPxDateEditTransport.MinDate = new DateTime(DateTime.Now.AddDays(-1).Year, DateTime.Now.AddDays(-1).Month, DateTime.Now.AddDays(-1).Day, 0, 0, 0);
                    }
                    else
                    {
                        ASPxDateEditTransport.MinDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0);
                    }
                }
                ASPxDateEditTransport.Date = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0);
                //ASPxDateEditTransport.SetClientSideEventHandler("Init", "function(s, e) { setTimeout(function() {s.Focus();}, 0); }");
            }
        }

        private bool Ok2Run(string sessionName, int bypassCount)
        {
            Session[sessionName] = Session[sessionName] == null ? 0 : Session[sessionName];
            return !((int)(Session[sessionName] = (((int)Session[sessionName]) + 1) % bypassCount) == 0);
        }


    }
}