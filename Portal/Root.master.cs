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
            //ASPxLabel2.Text = DateTime.Now.Year + Server.HtmlDecode(" &copy; Copyright by [company name]");

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
                    itemJournal.Text = "�������";
                    itemJournal.Image.IconID = "layout_paneloff_16x16devav";
                }

                if (Context.User.IsInRole("��������������")
                    || Context.User.IsInRole("������ �� ���������� - ���������")
                    || Context.User.IsInRole("������ �� ���������� - ����������")
                    || Context.User.IsInRole("������ �� ���������� - �����������"))
                {
                    DevExpress.Web.MenuItem itemJournalCants = new DevExpress.Web.MenuItem()
                    {
                        Text = "������ �� ����������",
                        NavigateUrl = "~/Pages/Journal/Stationery/ManageStationery.aspx"
                    };
                    itemJournalCants.Image.IconID = "print_tasklist_16x16devav";
                    itemJournal.Items.Add(itemJournalCants);
                    itemJournal.DropDownMode = true;

                    if (itemJournalAdd == false)
                    {
                        ASPxMenuMain.Items.Add(itemJournal);
                        itemJournalAdd = true;
                    }

                };

                if (Context.User.IsInRole("��������������")
                    || Context.User.IsInRole("������� �����������"))
                {
                    DevExpress.Web.MenuItem itemJournalAdmission = new DevExpress.Web.MenuItem()
                    {
                        Text = "������� �����������",
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

                if (Context.User.IsInRole("��������������")
                    || Context.User.IsInRole("��������� - ������������")
                    || Context.User.IsInRole("��������� - ��������� ����"))
                {
                    DevExpress.Web.MenuItem itemJournalTransport = new DevExpress.Web.MenuItem()
                    {
                        Text = "���������",
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

                if (Context.User.IsInRole("��������������"))
                {
                    DevExpress.Web.MenuItem itemAdmin = new DevExpress.Web.MenuItem()
                    {
                        Text = "�����������������",
                        DropDownMode = true
                    };
                    itemAdmin.Image.IconID = "setup_properties_16x16office2013";

                    DevExpress.Web.MenuItem itemAdminUsers = new DevExpress.Web.MenuItem()
                    {
                        Text = "���������� ��������������",
                        NavigateUrl = "~/Pages/Admin/Users/ManageUsers.aspx"
                    };
                    itemAdminUsers.Image.IconID = "people_usergroup_16x16office2013";
                    itemAdmin.Items.Add(itemAdminUsers);

                    DevExpress.Web.MenuItem itemAdminEmployee = new DevExpress.Web.MenuItem()
                    {
                        Text = "���������� �����������",
                        NavigateUrl = "~/Pages/Admin/Employee/ManageEmployee.aspx"
                    };
                    itemAdminEmployee.Image.IconID = "people_team_16x16office2013";
                    itemAdmin.Items.Add(itemAdminEmployee);

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