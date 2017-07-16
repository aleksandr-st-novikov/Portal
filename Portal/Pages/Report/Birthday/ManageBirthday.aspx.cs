using System;

namespace Portal.Pages.Report.Birthday
{
    public partial class ManageBirthday : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            Page.Title = "Отчеты - Дни рождения";
        }
    }
}