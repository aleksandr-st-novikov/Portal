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
                Text = "������",
                NavigateUrl = "~/Pages/Journal/Accessories/ManageAccessories.aspx"
            };
            itemManageAccessories.Image.IconID = "print_profilereport_16x16devav";
            groupAccessories.Items.Add(itemManageAccessories);

            if (Context.User.IsInRole("��������������")
                || Context.User.IsInRole("������ �� �������������� - ����������"))
            {
                DevExpress.Web.NavBarItem itemAccessoriesProduct = new DevExpress.Web.NavBarItem()
                {
                    Index = 1,
                    Text = "����������� ���������",
                    NavigateUrl = "~/Pages/Journal/Accessories/ManageAccessoriesProduct.aspx"
                };
                itemAccessoriesProduct.Image.IconID = "miscellaneous_design_16x16office2013";
                groupAccessories.Items.Add(itemAccessoriesProduct);

                //DevExpress.Web.NavBarItem itemManageStock = new DevExpress.Web.NavBarItem()
                //{
                //    Index = 1,
                //    Text = "����������� ������",
                //    NavigateUrl = "~/Pages/Journal/Accessories/ManageStock.aspx"
                //};
                //itemManageStock.Image.IconID = "miscellaneous_design_16x16office2013";
                //groupAccessories.Items.Add(itemManageStock);
            }

            if (Context.User.IsInRole("��������������"))
            {
                DevExpress.Web.NavBarItem itemAccessoriesType = new DevExpress.Web.NavBarItem()
                {
                    Index = 2,
                    Text = "��������� ���������������",
                    NavigateUrl = "~/Pages/Journal/Accessories/ManageAccessoriesType.aspx"
                };
                itemAccessoriesType.Image.IconID = "miscellaneous_design_16x16office2013";
                groupAccessories.Items.Add(itemAccessoriesType);

                DevExpress.Web.NavBarItem itemAccessoriesDepartment = new DevExpress.Web.NavBarItem()
                {
                    Index = 2,
                    Text = "�������������",
                    NavigateUrl = "~/Pages/Journal/Accessories/ManageAccessoriesDepartment.aspx"
                };
                itemAccessoriesDepartment.Image.IconID = "miscellaneous_design_16x16office2013";
                groupAccessories.Items.Add(itemAccessoriesDepartment);
            }

            ASPxNavBarMain.Groups.Add(groupAccessories);
        }
    }
}