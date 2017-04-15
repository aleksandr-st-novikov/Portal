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
                Text = "������ �� ��������������"
            };

            DevExpress.Web.NavBarItem itemManageAccessories = new DevExpress.Web.NavBarItem()
            {
                Index = 0,
                Text = "���������� ������",
                NavigateUrl = "~/Pages/Journal/Accessories/ManageAccessories.aspx"
            };
            itemManageAccessories.Image.IconID = "print_profilereport_16x16devav";
            groupAccessories.Items.Add(itemManageAccessories);

            if (Context.User.IsInRole("��������������")
                || Context.User.IsInRole("������ �� ���������� - ����������"))
            {
                DevExpress.Web.NavBarItem itemManageStock = new DevExpress.Web.NavBarItem()
                {
                    Index = 1,
                    Text = "����������� ������",
                    NavigateUrl = "~/Pages/Journal/Accessories/ManageStock.aspx"
                };
                itemManageStock.Image.IconID = "miscellaneous_design_16x16office2013";
                groupAccessories.Items.Add(itemManageStock);
            }

            ASPxNavBarMain.Groups.Add(groupAccessories);
        }
    }
}