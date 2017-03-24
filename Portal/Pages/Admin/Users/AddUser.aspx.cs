using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Portal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Admin.Users
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxButtonSave_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = new ApplicationUser() { UserName = ASPxTextBoxUserName.Text, Email = ASPxTextBoxEMail.Text };
            IdentityResult result = manager.Create(user, ASPxTextBoxPassword.Text);
            if (!result.Succeeded)
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}