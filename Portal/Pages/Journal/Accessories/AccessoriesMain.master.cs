using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal {
    public partial class AccessoriesMainMaster : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {

            DevExpress.Web.NavBarGroup groupAccessories = new DevExpress.Web.NavBarGroup()
            {
                Text = "Заявка на принадлежности"
            };

            DevExpress.Web.NavBarItem itemManageAccessories = new DevExpress.Web.NavBarItem()
            {
                Index = 0,
                Text = "Оформление заявки",
                NavigateUrl = "~/Pages/Journal/Accessories/ManageAccessories.aspx"
            };
            itemManageAccessories.Image.IconID = "print_profilereport_16x16devav";
            groupAccessories.Items.Add(itemManageAccessories);

            if (Context.User.IsInRole("Администраторы")
                || Context.User.IsInRole("Заявка на канцтовары - Управление"))
            {
                DevExpress.Web.NavBarItem itemManageStock = new DevExpress.Web.NavBarItem()
                {
                    Index = 1,
                    Text = "Ассортимент товара",
                    NavigateUrl = "~/Pages/Journal/Accessories/ManageStock.aspx"
                };
                itemManageStock.Image.IconID = "miscellaneous_design_16x16office2013";
                groupAccessories.Items.Add(itemManageStock);
            }

            ASPxNavBarMain.Groups.Add(groupAccessories);
        }
    }
}