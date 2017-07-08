using DevExpress.Web.ASPxTreeList;
using Portal.Models.EFContext;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Maintenance.DepartmentWork
{
    public partial class LeftTree : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxTreeListCategory_HtmlRowPrepared(object sender, DevExpress.Web.ASPxTreeList.TreeListHtmlRowEventArgs e)
        {
            if (Object.Equals(e.GetValue("IsCategory"), true))
            {
                e.Row.ForeColor = Color.SlateGray;
            }
            else
            {
                e.Row.Attributes.Add("IsCategory", "0");
            }
        }

        protected void ASPxTreeListCategory_NodeInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["IsCategory"] = true;
        }

        protected void ASPxTreeListCategory_CustomCallback(object sender, TreeListCustomCallbackEventArgs e)
        {
            ASPxTreeListCategory.DataBind();
        }
    }
}