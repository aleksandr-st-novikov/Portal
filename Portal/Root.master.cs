using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using Microsoft.AspNet.Identity;

namespace Portal
{
    public partial class RootMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ASPxLabel2.Text = DateTime.Now.Year + Server.HtmlDecode(" &copy; Copyright by [company name]");

            if (Context.Request.Path.Contains("Login"))
            {
                ASPxMenuMain.Visible = false;
                HeadLoginView.Visible = false;
                return;
            }

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

            if (Context.User.IsInRole("Администраторы")
                || Context.User.IsInRole("Заявка на канцтовары - Сотрудник") 
                || Context.User.IsInRole("Заявка на канцтовары - Управление") 
                || Context.User.IsInRole("Заявка на канцтовары - Утверждение"))
            {
                DevExpress.Web.MenuItem itemJournalCants = new DevExpress.Web.MenuItem()
                {
                    Text = "Заявка на канцтовары",
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

            if (Context.User.IsInRole("Администраторы")
                || Context.User.IsInRole("Допуски работников СРТ"))
            {
                DevExpress.Web.MenuItem itemJournalAdmissionSRT = new DevExpress.Web.MenuItem()
                {
                    Text = "Допуски работников СРТ",
                    NavigateUrl = "~/Pages/Journal/AdmissionSRT/ManageAdmissionSRT.aspx"
                };
                itemJournalAdmissionSRT.Image.IconID = "print_tasklist_16x16devav";
                itemJournal.Items.Add(itemJournalAdmissionSRT);
                itemJournal.DropDownMode = true;

                if (itemJournalAdd == false)
                {
                    ASPxMenuMain.Items.Add(itemJournal);
                    itemJournalAdd = true;
                }

            };

            //меню
            if (Context.User.IsInRole("Администраторы"))
            {
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

                ASPxMenuMain.Items.Add(itemAdmin);
            }
        }

        protected void HeadLoginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }
    }
}