using DevExpress.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Portal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Portal.Pages.Admin.Users
{
    public partial class manageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("Администраторы"))
            {
                Response.Redirect("/");
                return;
            }

            if (Page.IsCallback)
            {
                BindRepeaterRoles();
            }

            string script = @"
                    Admin = function () {
                        var keyValue;
                    }

                    Admin.prototype =
                    {
                        ManageUsersRolesClick: function (key) {
                            ASPxClientCallbackPanelRoles.SetContentHtml('');
                            ASPxClientPopupControlRoles.Show();
                            keyValue = key;
                        },
                        ManageUsersRolesPopupShown: function(s, e) {
                            ASPxClientCallbackPanelRoles.PerformCallback(keyValue);
                        },
                        ManageUsersRolesPopupHide: function(s, e) {
                            ASPxClientPopupControlRoles.Hide();
                        },
                        ManageUsersPasswordClick: function (key) {
                            ASPxClientCallbackPanelPassword.SetContentHtml('');
                            ASPxClientPopupControlPassword.Show();
                            keyValue = key;
                        },
                        ManageUsersPasswordPopupShown: function(s, e) {
                            ASPxClientCallbackPanelPassword.PerformCallback(keyValue);
                        },
                        ManageUsersPasswordPopupHide: function(s, e) {
                            ASPxClientPopupControlPassword.Hide();
                        }
                    }

                    window.admin = new Admin();
                ";

            //if (!ClientScript.IsStartupScriptRegistered("admin"))
            //{
            //    Page.ClientScript.RegisterStartupScript(this.GetType(),
            //        "admin", script, true);
            //}

            if (!ClientScript.IsClientScriptBlockRegistered("admin"))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "admin", script, true);
            }
        }

        protected async void ASPxCallbackPanelRoles_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            ApplicationDbContext mycontext = new ApplicationDbContext();
            UserStore<ApplicationUser> userStore = new UserStore<ApplicationUser>(mycontext);
            ApplicationUserManager UserManager = new ApplicationUserManager(userStore);

            RoleStore<IdentityRole> roleStore = new RoleStore<IdentityRole>(mycontext);
            RoleManager<IdentityRole> RoleManager = new RoleManager<IdentityRole>(roleStore);

            string userName = (await UserManager.FindByIdAsync(e.Parameter)).UserName;
            ASPxLabelUser.Text = "Имя пользователя: " + userName;
            Session["UserIdToEdit"] = e.Parameter;
            CheckRolesForSelectedUser();
        }

        private void BindRepeaterRoles()
        {
                ApplicationDbContext mycontext = new ApplicationDbContext();
                RoleStore<IdentityRole> roleStore = new RoleStore<IdentityRole>(mycontext);
                RoleManager<IdentityRole> RoleManager = new RoleManager<IdentityRole>(roleStore);

                string[] roles = RoleManager.Roles.OrderBy(r => r.Name).Select(r => r.Name).ToArray();
                RepeaterRoles.DataSource = roles;
                RepeaterRoles.DataBind();
        }

        private async void CheckRolesForSelectedUser()
        {
            if (Session["UserIdToEdit"] != null)
            {
                ApplicationDbContext mycontext = new ApplicationDbContext();
                UserStore<ApplicationUser> userStore = new UserStore<ApplicationUser>(mycontext);
                ApplicationUserManager UserManager = new ApplicationUserManager(userStore);

                RoleStore<IdentityRole> roleStore = new RoleStore<IdentityRole>(mycontext);
                RoleManager<IdentityRole> RoleManager = new RoleManager<IdentityRole>(roleStore);

                var userRoles = await UserManager.GetRolesAsync(Session["UserIdToEdit"].ToString());

                foreach (RepeaterItem ri in RepeaterRoles.Items)
                {
                    ASPxCheckBox RoleCheckBox = ri.FindControl("ASPxCheckBoxRole") as ASPxCheckBox;
                    if (userRoles.Contains<string>(RoleCheckBox.Text))
                        RoleCheckBox.Checked = true;
                    else
                        RoleCheckBox.Checked = false;
                }
            }
        }

        protected async void ASPxCallbackUpdateRoles_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (Session["UserIdToEdit"] != null)
            {
                //отбираем выбранные роли
                List<string> selectedRole = new List<string>();

                for (int i = 0; i < RepeaterRoles.Items.Count; i++)
                {
                    ASPxCheckBox chk = (ASPxCheckBox)RepeaterRoles.Items[i].FindControl("ASPxCheckBoxRole");
                    if (chk.Checked)
                    {
                        selectedRole.Add(chk.Text);
                    }
                }

                //записываем
                ApplicationDbContext mycontext = new ApplicationDbContext();
                UserStore<ApplicationUser> userStore = new UserStore<ApplicationUser>(mycontext);
                ApplicationUserManager UserManager = new ApplicationUserManager(userStore);

                var userRoles = await UserManager.GetRolesAsync(Session["UserIdToEdit"].ToString());
                await UserManager.AddToRolesAsync(Session["UserIdToEdit"].ToString(), selectedRole.Except(userRoles).ToArray<string>());
                await UserManager.RemoveFromRolesAsync(Session["UserIdToEdit"].ToString(), userRoles.Except(selectedRole).ToArray<string>());
            }
        }

    }
}