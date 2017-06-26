using Portal.Models.EFContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Portal.BL.Core;

namespace Portal.Pages.Journal.Accessories
{
    public partial class AccessoriesTable : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (ASPxCallbackPanelShowPopup.IsCallback)
            {
                string ss = (string)Session["AccessoriesCanEdit"];
                string ss1 = (string)Session["AccessoriesIsOpen"];

                if ((string)Session["AccessoriesIsOpen"] == "1" && (string)Session["AccessoriesCanEdit"] == "0")
                {
                    DateTime fromDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, Data.AccessoriesFirstDay, 0, 0, 0);
                    DateTime toDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, Data.AccessoriesLastDay, 0, 0, 0);
                    if (DateTime.Now > toDate)
                    {
                        ASPxGridViewAccessoriesTable.SettingsEditing.Mode = DevExpress.Web.GridViewEditingMode.Inline; // .SettingsDataSecurity.AllowEdit = false;
                        ASPxPanel2.Paddings.PaddingTop = 20;
                    }
                }
            }
        }

        protected void ASPxCallbackPanelShowPopup_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (ASPxCallbackPanelShowPopup.IsCallback)
            {
                ASPxPopupControlAccessoriesTable.HeaderText = "Заявка на " + (string)Session["AccessoriesTypeName"];
                ASPxLabelDepartmentEmployee.Text = Session["AccessoriesDepartmentName"] + " / " + (string)Session["EmployeeFIO"];

                Session["DateAccessories"] = new DateTime(DateTime.Now.AddMonths(1).Year, DateTime.Now.AddMonths(1).Month, 1);
                ASPxLabelDate.Text = ((DateTime)Session["DateAccessories"]).ToString("MMMM yyyy");

                if (!String.IsNullOrEmpty(e.Parameter))
                {
                    Session["AccessoriesIsOpen"] = "1";
                }
                else
                {
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

        protected void ASPxGridViewAccessoriesTable_Init(object sender, EventArgs e)
        {
            //string ss = (string)Session["AccessoriesCanEdit"];
            //string ss1 = (string)Session["AccessoriesIsOpen"];

            //if ((string)Session["AccessoriesIsOpen"] == "1" && (string)Session["AccessoriesCanEdit"] == "0")
            //{
            //    DateTime fromDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, Models.Data.AccessoriesFirstDay, 0, 0, 0);
            //    DateTime toDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, Models.Data.AccessoriesLastDay, 0, 0, 0);
            //    if (DateTime.Now > toDate)
            //    {
            //        ASPxGridViewAccessoriesTable.SettingsEditing.Mode = DevExpress.Web.GridViewEditingMode.Inline; // .SettingsDataSecurity.AllowEdit = false;
            //        ASPxPanel2.Paddings.PaddingTop = 20;
            //    }
            //}
        }
    }
}