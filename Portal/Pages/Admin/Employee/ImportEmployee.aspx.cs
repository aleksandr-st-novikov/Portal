using Portal.Models.EFContext;
using Portal.Models.Entities;
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
            ASPxTextBoxPathDBF.Text = @"e:\VS\Portal\IW\exp_ej.DBF";
            ASPxLoadingPanelLoad.ContainerElementID = "ASPxPanel1";
        }

        string convertDefaultToWin(String src)
        {
            byte[] buffer;
            buffer = Encoding.GetEncoding(866).GetBytes(src);
            Encoding.Convert(Encoding.Default, Encoding.GetEncoding(1251), buffer);
            return Encoding.Default.GetString(buffer);
        }

        protected async void ASPxCallbackImport_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string filePath = ASPxTextBoxPathDBF.Text;
            List<Department> dep = new List<Department>();
            string constr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Path.GetDirectoryName(filePath) + ";Extended Properties=dBASE IV;User ID=Admin;Password=;";
            using (OleDbConnection con = new OleDbConnection(constr))
            {
                var sql = "select * from " + Path.GetFileNameWithoutExtension(filePath);
                OleDbCommand cmd = new OleDbCommand(sql, con);
                con.Open();
                DataSet ds = new DataSet(); ;
                OleDbDataAdapter da = new OleDbDataAdapter(cmd);
                da.Fill(ds);
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    dep.Add(new Department()
                    {
                        Name = convertDefaultToWin(Convert.ToString(row[5]))
                    });
                }
            }
            var depDispose = dep.GroupBy(d => d.Name).Select(g => g.First()).ToList();
            using (DepartmentContext context = new DepartmentContext())
            {
                await context.AddRangeDepartment(depDispose);
                await context.SaveCahnges();
            }
        }

        protected async void ASPxCallbackImportEmployee_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string filePath = ASPxTextBoxPathDBF.Text;
            List<Department> dep = new List<Department>();
            string constr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Path.GetDirectoryName(filePath) + ";Extended Properties=dBASE IV;User ID=Admin;Password=;";
            using (OleDbConnection con = new OleDbConnection(constr))
            {
                var sql = "select * from " + Path.GetFileNameWithoutExtension(filePath);
                OleDbCommand cmd = new OleDbCommand(sql, con);
                con.Open();
                DataSet ds = new DataSet(); ;
                OleDbDataAdapter da = new OleDbDataAdapter(cmd);
                da.Fill(ds);
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    dep.Add(new Department()
                    {
                        Name = convertDefaultToWin(Convert.ToString(row[5]))
                    });
                }
            }
            var depDispose = dep.GroupBy(d => d.Name).Select(g => g.First()).ToList();
            using (DepartmentContext context = new DepartmentContext())
            {
                await context.AddRangeDepartment(depDispose);
                await context.SaveCahnges();
            }
        }
    }
}