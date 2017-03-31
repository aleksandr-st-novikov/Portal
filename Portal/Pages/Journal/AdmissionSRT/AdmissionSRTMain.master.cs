using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal {
    public partial class AdmissionSRTMainMaster : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {

            DevExpress.Web.NavBarGroup groupAdmissionSRT = new DevExpress.Web.NavBarGroup()
            {
                Text = "������� ���������� ���"
            };

            if (Context.User.IsInRole("��������������")
                || Context.User.IsInRole("������� ���������� ���"))
            {
                DevExpress.Web.NavBarItem itemManageAdmisiionSRT = new DevExpress.Web.NavBarItem()
                {
                    Index = 0,
                    Text = "�������",
                    NavigateUrl = "~/Pages/Journal/AdmissionSRT/ManageAdmissionSRT.aspx"
                };
                itemManageAdmisiionSRT.Image.IconID = "print_profilereport_16x16devav";
                groupAdmissionSRT.Items.Add(itemManageAdmisiionSRT);
            }

            ASPxNavBarMain.Groups.Add(groupAdmissionSRT);
        }
    }
}