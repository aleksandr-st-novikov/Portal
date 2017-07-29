using DevExpress.Web;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Portal.BL.Core;

namespace Portal.Pages.Maintenance.Schedule
{
    public partial class JobGrid : System.Web.UI.UserControl
    {

        protected void Page_Init(object sender, EventArgs e)
        {
            ((GridViewDataComboBoxColumn)ASPxGridViewJob.Columns["TaskListId"]).PropertiesComboBox.DataSource = TaskList.getTaskLists();
            ((GridViewDataComboBoxColumn)ASPxGridViewJob.Columns["TaskListId"]).PropertiesComboBox.TextField = "Name";
            ((GridViewDataComboBoxColumn)ASPxGridViewJob.Columns["TaskListId"]).PropertiesComboBox.ValueField = "Id";

            var items = Enum.GetNames(typeof(Enums.Status));
            ((GridViewDataComboBoxColumn)ASPxGridViewJob.Columns["Status"]).PropertiesComboBox.Items.AddRange(items);
            ((GridViewDataComboBoxColumn)ASPxGridViewJob.Columns["Status"]).PropertiesComboBox.ValueType = typeof(Enums.Status);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ASPxGridViewJob_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Status"] = Enums.Status.Ready;
            e.NewValues["IsAdded"] = false;
        }

        protected void ASPxGridViewJob_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["IsActive"] = false;
        }

        protected void ASPxGridViewJob_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["IsAdded"] = false;
        }
    }
}