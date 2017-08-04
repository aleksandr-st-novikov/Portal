using DevExpress.Web;
using Portal.BL.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Maintenance.Scheduler
{
    public partial class DetailPopup : System.Web.UI.UserControl
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            var items = Enum.GetNames(typeof(Enums.Result));
            ((GridViewDataComboBoxColumn)ASPxGridViewDetail.Columns["Result"]).PropertiesComboBox.Items.AddRange(items);
            ((GridViewDataComboBoxColumn)ASPxGridViewDetail.Columns["Result"]).PropertiesComboBox.ValueType = typeof(Enums.Result);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxCallbackPanelDetail_Callback(object sender, CallbackEventArgsBase e)
        {
            Session["DetailJobId"] = Int32.Parse(e.Parameter);
            //SqlDataSourceJobResult.DataBind();
        }
    }
}