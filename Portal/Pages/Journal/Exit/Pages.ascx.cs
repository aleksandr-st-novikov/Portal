using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.Exit
{
    public partial class Pages : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Context.User.IsInRole("Администраторы"))
            {
                ASPxPageControlExit.TabPages[2].Visible = false;
            }

            if(!Page.IsCallback && !Page.IsPostBack)
            {
                TimeSpan start = new TimeSpan(0, 0, 0);
                TimeSpan end = new TimeSpan(5, 0, 0);
                TimeSpan now = DateTime.Now.TimeOfDay;

                if ((now > start) && (now < end))
                {
                    Session["DateFromExit"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd 00:00:00"));
                    Session["DateToExit"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd 23:59:59"));
                }
                else
                {
                    Session["DateFromExit"] = ASPxDateEditGridFrom.Value = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd 00:00:00"));
                    Session["DateToExit"] = ASPxDateEditGridTo.Value = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd 23:59:59"));
                }
            }
        }

        protected void ASPxCallbackRefresh_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (ASPxCallbackRefresh.IsCallback)
            {
                Session["DateFromExit"] = Convert.ToDateTime(ASPxDateEditGridFrom.Date.ToString("yyyy-MM-dd 00:00:00"));
                Session["DateToExit"] = Convert.ToDateTime(ASPxDateEditGridTo.Date.ToString("yyyy-MM-dd 23:59:59"));
            }
        }
    }
}