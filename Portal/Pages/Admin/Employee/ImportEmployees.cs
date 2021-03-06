﻿using Portal.Models.EFContext;
using Portal.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Portal.Pages.Admin.Employee
{
    public class ImportEmployees
    {
        public static async Task ExecuteAsync(string fPath)
        {
            string filePath = fPath;
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
            await SaveDepartment(md);
            //записываем должности
            await SavePosition(md);
            //записываем сотрудников
            await SaveEmployee(md);
            //записываем руководителей
            await SetHead(md);
            //уволенные сотрудники
            await SetFired(md);
        }

        static string convertDefaultToWin(String src)
        {
            byte[] buffer;
            buffer = Encoding.GetEncoding(866).GetBytes(src);
            Encoding.Convert(Encoding.Default, Encoding.GetEncoding(1251), buffer);
            return Encoding.Default.GetString(buffer);
        }
        private static async System.Threading.Tasks.Task SetFired(List<MidData> md)
        {
            using (EmployeeContext context = new EmployeeContext())
            {
                await context.SetFiredAsync(md);
                await context.SaveChangesAsync();
            }
        }

        private static async System.Threading.Tasks.Task SetHead(List<MidData> md)
        {
            List<string> headers = new List<string>()
            {
                "Главный бухгалтер",
                "Главный инженер",
                "Заведующий",
                "Заведующий складом",
                "Начальник",
                "Управляющий филиалом"
            };
            List<MidData> head = md.Where(m => headers.Contains(m.Position)).ToList();
            using (DepartmentContext context = new DepartmentContext())
            {
                await context.SetHeadDepartmentAsync(head);
                await context.SaveChangesAsync();
            }
        }

        private static async System.Threading.Tasks.Task SaveDepartment(List<MidData> md)
        {
            List<string> depDispose = md.GroupBy(d => d.Department).Select(g => g.First()).ToList().Select(g => g.Department).ToList();
            using (DepartmentContext context = new DepartmentContext())
            {
                await context.AddRangeDepartmentAsync(depDispose);
                await context.SaveChangesAsync();
            }
        }

        private static async System.Threading.Tasks.Task SavePosition(List<MidData> md)
        {
            List<string> posDispose = md.GroupBy(d => d.Position).Select(g => g.First()).ToList().Select(g => g.Position).ToList();
            using (PositionContext context = new PositionContext())
            {
                await context.AddRangePositionAsync(posDispose);
                await context.SaveChangesAsync();
            }
        }

        private static async System.Threading.Tasks.Task SaveEmployee(List<MidData> md)
        {
            using (EmployeeContext context = new EmployeeContext())
            {
                foreach (var empl in md)
                {
                    await context.AddEmployeeAsync(empl);
                }
                await context.SaveChangesAsync();
            }
        }
    }
}