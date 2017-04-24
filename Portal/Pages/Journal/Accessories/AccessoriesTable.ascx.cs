using Portal.Models.EFContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Journal.Accessories
{
    public partial class AccessoriesTable : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxCallbackPanelShowPopup_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (ASPxCallbackPanelShowPopup.IsCallback)
            {
                ASPxPopupControlAccessoriesTable.HeaderText = "Заявка на " + (string)Session["AccessoriesTypeName"];
                ASPxLabelDepartmentEmployee.Text = Session["AccessoriesDepartmentName"] + " / " + (string)Session["EmployeeFIO"];

                Session["DateAccessories"] = new DateTime(DateTime.Now.AddMonths(1).Year, DateTime.Now.AddMonths(1).Month, 1);
                ASPxLabelDate.Text = ((DateTime)Session["DateAccessories"]).ToString("MMMM yyyy");

                //заполняем товаром таблицу для подразделения
                using (AccessoriesContext accessoriesContext = new AccessoriesContext())
                {
                    Session["AccessoriesId"] = accessoriesContext.PopulateAccessoriesProduct(
                        (int)Session["AccessoriesDepartmentId"], 
                        (int)Session["AccessoriesTypeId"], 
                        (DateTime)Session["DateAccessories"]);
                }
            }
        }
    }
}