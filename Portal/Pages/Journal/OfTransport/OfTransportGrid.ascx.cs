using DevExpress.Export;
using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        }

        protected void ASPxGridViewOfTransport_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["EmployeeId"] = Session["EmployeeId"];
        }

    }
}