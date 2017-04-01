using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal {
    public partial class AdmissionMain1Master : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {

            DevExpress.Web.NavBarGroup groupAdmission = new DevExpress.Web.NavBarGroup()
            {
                Text = "Допуски сотрудников"
            };

            if (Context.User.IsInRole("Администраторы")
                || Context.User.IsInRole("Допуски сотрудников"))
            {
                DevExpress.Web.NavBarItem itemManageAdmisiion = new DevExpress.Web.NavBarItem()
                {
                    Index = 0,
                    Text = "Допуски",
                    NavigateUrl = "~/Pages/Journal/Admission/ManageAdmission.aspx"
                };
                itemManageAdmisiion.Image.IconID = "print_profilereport_16x16devav";
                groupAdmission.Items.Add(itemManageAdmisiion);
            }

            ASPxNavBarMain.Groups.Add(groupAdmission);
        }
    }
}