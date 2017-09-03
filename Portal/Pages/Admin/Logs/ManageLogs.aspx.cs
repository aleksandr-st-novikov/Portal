using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Admin.Logs
{
    public partial class ManageLogs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("Администраторы") && User.Identity.Name != "anovikov")
            {
                Response.Redirect("/");
                return;
            }
        }
    }
}