using System;
using System.Web;

namespace Portal.Pages.Report.Birthday
{
    public partial class ManageBirthday : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(User.IsInRole("Администраторы")
                || User.IsInRole("Отчеты - Дни рождения")) && User.Identity.Name != "anovikov") 
            {
                HttpContext.Current.Response.Redirect(ResolveUrl("~/"), false);
                return;
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            Page.Title = "Отчеты - Дни рождения";
        }
    }
}