﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Admin.Employee
{
    public partial class ManageDepartment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("Администраторы"))
            {
                Response.Redirect("/");
                return;
            }
        }

        protected void ASPxTreeList1_InitNewNode(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["IsActive"] = true;
        }
    }
}