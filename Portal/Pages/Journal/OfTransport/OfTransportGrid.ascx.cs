using System;
using Portal.BL.Core;
using Portal.Models.EFContext;

namespace Portal.Pages.Journal.OfTransport
{
    public partial class OfTransportGrid : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Context.User.IsInRole("Администраторы")
               || Context.User.IsInRole("Служебный транспорт - Полный доступ")))
            {
                ASPxGridViewOfTransport.Columns[0].Visible = true;
            }
            if (Context.User.IsInRole("Служебный транспорт - Чтение"))
            {
                ASPxGridViewOfTransport.Columns[0].Visible = false;
            }
            using (ConstantContext constantContext = new ConstantContext())
            {
                ASPxTimerRefershOfTransport.Interval = (constantContext.GetConstInt("TimeoutRefresh") == -1 ? Data.TimeoutRefresh : constantContext.GetConstInt("TimeoutRefresh")) * 1000;
            }
        }

        protected void ASPxGridViewOfTransport_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["EmployeeId"] = Session["EmployeeId"];
        }

    }
}