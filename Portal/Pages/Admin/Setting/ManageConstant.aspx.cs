﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Admin.Setting
{
    public partial class ManageConstant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(User.IsInRole("Администраторы")))
            {
                HttpContext.Current.Response.Redirect(ResolveUrl("~/"), false);
                return;
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            Page.Title = ASPxLabel1.Text = "Настройки - Справочник констант";
        }
    }
}