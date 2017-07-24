using Microsoft.AspNet.Identity.EntityFramework;
using Portal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Admin.Users
{
    public partial class ChangePasswordPopup : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void ASPxCallbackPanelPassword_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            ApplicationDbContext mycontext = new ApplicationDbContext();
            UserStore<ApplicationUser> userStore = new UserStore<ApplicationUser>(mycontext);
            ApplicationUserManager UserManager = new ApplicationUserManager(userStore);

            string userName = (await UserManager.FindByIdAsync(e.Parameter)).UserName;
            ASPxLabelUser.Text = "Имя пользователя: " + userName;
            Session["UserIdToEdit"] = e.Parameter;
        }
    }
}