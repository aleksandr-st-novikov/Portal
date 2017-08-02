using Portal.BL.Core;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using Portal.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Admin.Employee
{
    public partial class ImportEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("Администраторы"))
            {
                Response.Redirect("/");
                return;
            }

            using (ConstantContext constantContext = new ConstantContext())
            {
                //ASPxTextBoxPathDBF.Text = @"e:\VS\Portal\IW\exp_ej.DBF";
                ASPxTextBoxPathDBF.Text = String.IsNullOrEmpty(constantContext.GetConstString("PathFileImport1C")) ?
                        Data.PathFileImport1C : constantContext.GetConstString("PathFileImport1C");
            }
            //ASPxTextBoxPathDBF.Text = @"/Import/exp_ej.DBF";
            ASPxLoadingPanelLoad.ContainerElementID = "ASPxPanel2";
        }

        protected async void ASPxCallbackImportEmployee_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            await ImportEmployees.ExecuteAsync(ASPxTextBoxPathDBF.Text);
        }

    }
}