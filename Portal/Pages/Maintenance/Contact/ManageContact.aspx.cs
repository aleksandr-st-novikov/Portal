using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Maintenance.Contact
{
    public partial class ManageContact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && !Page.IsCallback)
            {
                Page.Title = "Поддержка - Организации, контакты";
            }
        }
    }
}