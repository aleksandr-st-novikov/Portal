using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Report.Birthday
{
    public partial class BirthdayParams : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && !Page.IsCallback)
            {
                DateTime date = DateTime.Now.AddMonths(1);
                Session["DateFrom"] = ASPxDateEditGridFrom.Value = new DateTime(date.Year, date.Month, 1);
                Session["DateTo"] = ASPxDateEditGridTo.Value = new DateTime(date.Year, date.Month, DateTime.DaysInMonth(date.Year, date.Month));
            }
        }

        protected void ASPxCallbackDate_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (ASPxCallbackDate.IsCallback)
            {
                Session["DateFrom"] = ASPxDateEditGridFrom.Date;
                Session["DateTo"] = ASPxDateEditGridTo.Date;
            }
        }
    }
}