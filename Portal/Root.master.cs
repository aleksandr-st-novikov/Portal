using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using Microsoft.AspNet.Identity;
using Portal.Models.EFContext;
using Portal.Models.Entities;

namespace Portal
{
    public partial class RootMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ASPxLabel2.Text = "Portal [версия " + System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString() + "]";  //DateTime.Now.Year + Server.HtmlDecode(" &copy; Copyright by [company name]");

            if(!Page.IsCallback && !Page.IsPostBack)
            {
                if (Context.User.Identity.IsAuthenticated)
                {
                    using (EmployeeContext context = new EmployeeContext())
                    {
                        Employee employee = context.GetEmployeeByUser(Context.User.Identity.Name);
                        if (employee != null)
                        {
                            ASPxLabelEmployee.Text = employee.Lastname + " " + employee.Firstname + " " + employee.Patronymic;
                        }
                    }
                }
            }

            if (Context.Request.Path.Contains("Login"))
            {
                ASPxMenuMain.Visible = false;
                HeadLoginView.Visible = false;
                return;
            }

            if (!Page.IsCallback && !Page.IsPostBack)
            {
                DevExpress.Web.MenuItem itemJournal = new DevExpress.Web.MenuItem();
                bool itemJournalAdd = false;

                if (!Context.User.Identity.IsAuthenticated)
                {
                    ASPxMenuMain.Visible = false;
                    return;
                }
                else
                {
                    itemJournal.Text = "Журналы";
                    itemJournal.Image.IconID = "layout_paneloff_16x16devav";
                }

                if ((Context.User.IsInRole("Администраторы")
                    || Context.User.IsInRole("Заявка на принадлежности - Сотрудник")
                    || Context.User.IsInRole("Заявка на принадлежности - Управление")
                    || Context.User.IsInRole("Заявка на принадлежности - Утверждение")
                    || Context.User.IsInRole("Заявка на принадлежности - Склад")) && false)
                {
                    DevExpress.Web.MenuItem itemJournalAccesories = new DevExpress.Web.MenuItem()
                    {
                        Text = "Заявка на принадлежности",
                        NavigateUrl = "~/Pages/Journal/Accessories/ManageAccessories.aspx"
                    };
                    itemJournalAccesories.Image.IconID = "print_tasklist_16x16devav";
                    itemJournal.Items.Add(itemJournalAccesories);
                    itemJournal.DropDownMode = true;

                    if (itemJournalAdd == false)
                    {
                        ASPxMenuMain.Items.Add(itemJournal);
                        itemJournalAdd = true;
                    }

                };

                if (Context.User.IsInRole("Администраторы")
                    || Context.User.IsInRole("Допуски сотрудников"))
                {
                    DevExpress.Web.MenuItem itemJournalAdmission = new DevExpress.Web.MenuItem()
                    {
                        Text = "Допуски сотрудников",
                        NavigateUrl = "~/Pages/Journal/Admission/ManageAdmission.aspx"
                    };
                    itemJournalAdmission.Image.IconID = "print_tasklist_16x16devav";
                    itemJournal.Items.Add(itemJournalAdmission);
                    itemJournal.DropDownMode = true;

                    if (itemJournalAdd == false)
                    {
                        ASPxMenuMain.Items.Add(itemJournal);
                        itemJournalAdd = true;
                    }

                };

                if (Context.User.IsInRole("Администраторы")
                    || Context.User.IsInRole("Транспорт - Руководители")
                    || Context.User.IsInRole("Транспорт - Служебный вход"))
                {
                    DevExpress.Web.MenuItem itemJournalTransport = new DevExpress.Web.MenuItem()
                    {
                        Text = "Транспорт",
                        NavigateUrl = "~/Pages/Journal/Transport/ManageTransport.aspx"
                    };
                    itemJournalTransport.Image.IconID = "actions_driving_16x16devav";
                    itemJournal.Items.Add(itemJournalTransport);
                    itemJournal.DropDownMode = true;

                    if (itemJournalAdd == false)
                    {
                        ASPxMenuMain.Items.Add(itemJournal);
                        itemJournalAdd = true;
                    }

                };

                if (Context.User.IsInRole("Администраторы"))
                {
                    DevExpress.Web.MenuItem itemMaintenance = new DevExpress.Web.MenuItem()
                    {
                        Text = "Поддержка",
                        DropDownMode = true
                    };
                    itemMaintenance.Image.IconID = "actions_viewsetting_16x16devav";

                    DevExpress.Web.MenuItem itemMaintenanceDepartmentWork = new DevExpress.Web.MenuItem()
                    {
                        Text = "Работа отдела",
                        NavigateUrl = "~/Pages/Maintenance/DepartmentWork/ManageDepartmentWork.aspx"
                    };
                    itemMaintenanceDepartmentWork.Image.IconID = "view_meeting_16x16devav";
                    itemMaintenance.Items.Add(itemMaintenanceDepartmentWork);

                    DevExpress.Web.MenuItem itemMaintenanceUKM = new DevExpress.Web.MenuItem()
                    {
                        Text = "УКМ, кассы",
                        NavigateUrl = "~/Pages/Maintenance/UKM/Setting.aspx"
                    };
                    itemMaintenanceUKM.Image.IconID = "actions_buy_16x16devav";
                    itemMaintenance.Items.Add(itemMaintenanceUKM);

                    //DevExpress.Web.MenuItem itemMaintenanceUKMPosSetting = new DevExpress.Web.MenuItem()
                    //{
                    //    Text = "Настройка кассы",
                    //    NavigateUrl = "~/Pages/Maintenance/UKM/PosSetting/PosSetting.aspx"
                    //};
                    ////itemMaintenanceUKMReboot.Image.IconID = "people_usergroup_16x16office2013";
                    //itemMaintenanceUKM.Items.Add(itemMaintenanceUKMPosSetting);

                    //DevExpress.Web.MenuItem itemMaintenanceUKMSettings = new DevExpress.Web.MenuItem()
                    //{
                    //    Text = "Параметры",
                    //    NavigateUrl = "~/Pages/Maintenance/UKM/Setting.aspx"
                    //};
                    //itemMaintenanceUKMSettings.Image.IconID = "actions_viewsetting_16x16devav";
                    //itemMaintenanceUKM.Items.Add(itemMaintenanceUKMSettings);

                    DevExpress.Web.MenuItem itemAdmin = new DevExpress.Web.MenuItem()
                    {
                        Text = "Администрирование",
                        DropDownMode = true
                    };
                    itemAdmin.Image.IconID = "setup_properties_16x16office2013";

                    DevExpress.Web.MenuItem itemAdminUsers = new DevExpress.Web.MenuItem()
                    {
                        Text = "Управление пользователями",
                        NavigateUrl = "~/Pages/Admin/Users/ManageUsers.aspx"
                    };
                    itemAdminUsers.Image.IconID = "people_usergroup_16x16office2013";
                    itemAdmin.Items.Add(itemAdminUsers);

                    DevExpress.Web.MenuItem itemAdminEmployee = new DevExpress.Web.MenuItem()
                    {
                        Text = "Сотрудники предприятия",
                        NavigateUrl = "~/Pages/Admin/Employee/ManageEmployee.aspx"
                    };
                    itemAdminEmployee.Image.IconID = "people_team_16x16office2013";
                    itemAdmin.Items.Add(itemAdminEmployee);

                    ASPxMenuMain.Items.Add(itemMaintenance);
                    ASPxMenuMain.Items.Add(itemAdmin);
                }
            }
        }

        protected void HeadLoginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }
    }
}