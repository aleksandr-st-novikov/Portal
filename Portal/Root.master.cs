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
            //����
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

                ASPxMenuMain.Items.Add(itemAdmin);
            }

            ASPxLabel2.Text = DateTime.Now.Year + Server.HtmlDecode(" &copy; Copyright by [company name]");
        }
        protected void HeadLoginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }
    }
}