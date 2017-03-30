﻿using Portal.Models.EFContext;
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
    public class MidData
    {
        public string TabNo { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Patronymic { get; set; }
        public string Department { get; set; }
        public string Position { get; set; }
        public DateTime DateIn { get; set; }
        public DateTime DateBirth { get; set; }
    }

    public partial class ImportEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ASPxTextBoxPathDBF.Text = @"e:\VS\Portal\IW\exp_ej.DBF";
            ASPxLoadingPanelLoad.ContainerElementID = "ASPxPanel2";
        }

        string convertDefaultToWin(String src)
        {
            byte[] buffer;
            buffer = Encoding.GetEncoding(866).GetBytes(src);
            Encoding.Convert(Encoding.Default, Encoding.GetEncoding(1251), buffer);
            return Encoding.Default.GetString(buffer);
        }

        protected async void ASPxCallbackImportEmployee_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string filePath = ASPxTextBoxPathDBF.Text;
            List<MidData> md = new List<MidData>();
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
                    md.Add(new MidData()
                    {
                        TabNo = convertDefaultToWin(Convert.ToString(row[0])),
                        LastName = convertDefaultToWin(Convert.ToString(row[1])),
                        FirstName = convertDefaultToWin(Convert.ToString(row[2])),
                        Patronymic = convertDefaultToWin(Convert.ToString(row[3])),
                        Position = convertDefaultToWin(Convert.ToString(row[4])),
                        Department = convertDefaultToWin(Convert.ToString(row[5])),
                        DateIn = Convert.ToDateTime(row[6]),
                        DateBirth = Convert.ToDateTime(row[8])
                    });
                }
            }
            
            //записываем подразделения
            List<string> depDispose = md.GroupBy(d => d.Department).Select(g => g.First()).ToList().Select(g => g.Department).ToList();
            using (DepartmentContext context = new DepartmentContext())
            {
                await context.AddRangeDepartment(depDispose);
                await context.SaveChanges();
            }
            //записываем должности
            List<string> posDispose = md.GroupBy(d => d.Position).Select(g => g.First()).ToList().Select(g => g.Position).ToList();
            using (PositionContext context = new PositionContext())
            {
                await context.AddRangePosition(posDispose);
                await context.SaveChanges();
            }
            //записываем сотрудников
            using (EmployeeContext context = new EmployeeContext())
            {
                foreach (var empl in md)
                {
                    await context.AddEmployee(empl);
                }
                await context.SaveChanges();
            }

        }
    }
}