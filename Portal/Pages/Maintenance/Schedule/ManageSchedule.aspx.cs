using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Maintenance.Schedule
{
    public partial class ManageSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Prerender (object sender, EventArgs e)
        {
            Page.Title = ASPxLabelHead.Text = "Планировщик заданий";
        }
    }
}