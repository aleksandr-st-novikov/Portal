using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal {
    public partial class StationeryMainMaster : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {

            DevExpress.Web.NavBarGroup groupStationery = new DevExpress.Web.NavBarGroup()
            {
                Text = "������ �� ����������"
            };

            DevExpress.Web.NavBarItem itemManageStationery = new DevExpress.Web.NavBarItem()
            {
                Index = 0,
                Text = "���������� ������",
                NavigateUrl = "~/Pages/Journal/Stationery/ManageStationery.aspx"
            };
            itemManageStationery.Image.IconID = "print_profilereport_16x16devav";
            groupStationery.Items.Add(itemManageStationery);

            if (Context.User.IsInRole("��������������")
                || Context.User.IsInRole("������ �� ���������� - ����������"))
            {
                DevExpress.Web.NavBarItem itemManageStock = new DevExpress.Web.NavBarItem()
                {
                    Index = 1,
                    Text = "����������� ������",
                    NavigateUrl = "~/Pages/Journal/Stationery/ManageStock.aspx"
                };
                itemManageStock.Image.IconID = "miscellaneous_design_16x16office2013";
                groupStationery.Items.Add(itemManageStock);
            }

            ASPxNavBarMain.Groups.Add(groupStationery);
        }
    }
}