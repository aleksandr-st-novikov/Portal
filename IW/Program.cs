using EJ.DAL;
using EJ.DAL.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.IO;
using System.Linq;

using Excel = Microsoft.Office.Interop.Excel;

namespace EJ.EJImport
{
    class Program
    {
        //const string _dbfPath = @"\\gs01kb\export$\1c\Export\exp_ej.dbf";
        const string _dbfPath = @"\\gs01kb\e$\export\1c\Export\exp_ej.dbf";
        const string _phoneBook = @"\\fs02kb\shared\Управление\Телефонный справочник для редактирования\Телефонный справочник ТЦ Корона.xls";
        //const string _dbfPath = "exp_ej.dbf";
        //const string _phoneBook = "Телефонный справочник ТЦ Корона.xls";

        private static string _curDir = Directory.GetCurrentDirectory();

        static bool ImportStaff()
        {
            EnumerableRowCollection<DataRow> dbfImport = null;

            // load dbf into memory

            OdbcConnection dbfConn = null;
            try
            {
                File.Copy(_dbfPath, Path.Combine(_curDir, "import.dbf"), true);

                string connStr = String.Format(@"Driver={{Microsoft dBase Driver (*.dbf)}};DriverID=277;Dbq={0};Exclusive=No;DELETED=NO;BACKGROUNDFETCH=NO", _curDir);
                dbfConn = new OdbcConnection(connStr);
                using (var adap = new OdbcDataAdapter(@"SELECT * FROM import.dbf", dbfConn))
                {
                    var table = new DataTable();
                    adap.Fill(table);
                    dbfImport = table.AsEnumerable();
                    table.Dispose();
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Ошибка чтения DBF файла: " + ex.Message);
                return false;
            }
            finally
            {
                if (dbfConn != null)
                {
                    dbfConn.Dispose();
                }
            }
            
            EJContext ctx = null;
            try
            {
                ctx = new EJContext();
                using (var transaction = ctx.Database.BeginTransaction(IsolationLevel.ReadCommitted))
                {
                    try
                    {
                        // sync units
                        if (!ctx.Departments.Any())
                        {
                            ctx.Departments.AddRange(
                                dbfImport.Select(r => r.Field<string>("PODR"))
                                    .Distinct()
                                    .OrderBy(dep => dep)
                                    .Select(dep => new Department() { Title = dep })
                                );
                            ctx.SaveChanges();
                        }

                        // sync staff
                        var unitsDict = ctx.Departments.ToDictionary(d => d.Title, d => d.DepartmentID);
                        var slaveKeys = new HashSet<int>(ctx.Employees.Select(s => s.ID));
                        foreach (var row in dbfImport)
                        {
                            string tabNo = row.Field<string>("TABN");
                            var emp = new Employee()
                            {
                                ID = int.Parse(tabNo.Substring(0, tabNo.Length - 3)),

                                FirstName = row.Field<string>("FIRSTNAME").Trim(),
                                LastName = row.Field<string>("LASTNAME").Trim(),
                                PatrName = row.IsNull("SECONDNAME") ? "" : row.Field<string>("SECONDNAME").Trim(),

                                Position = row.Field<string>("PROF").Trim(),

                                DateHire = DateTime.Parse(row.Field<string>("DATEIN")),
                                DateBirth = DateTime.Parse(row.Field<string>("DATEBIRTH"))
                            };

                            switch (row.Field<string>("CATEGORY"))
                            {
                                case "Рабочий":
                                    emp.Category = EmployeeCategory.Worker;
                                    break;
                                case "Служащий":
                                    emp.Category = EmployeeCategory.Servant;
                                    break;
                                case "Специалист":
                                    emp.Category = EmployeeCategory.Specialist;
                                    break;
                                case "Руководитель":
                                    emp.Category = EmployeeCategory.Head;
                                    break;
                                default:
                                    Console.Error.WriteLine("Не указана категория сотрудника #{0}: {1} {2}", emp.ID, emp.LastName, emp.FirstName);
                                    continue;
                            }

                            int depId;
                            string empDep = row.Field<string>("PODR").Trim();
                            if (unitsDict.TryGetValue(empDep, out depId))
                            {
                                emp.DepartmentID = depId;
                            }
                            else
                            {
                                Console.Error.WriteLine("Не найдено подразделение \"{0}\" для сотрудника #{1}: {2} {3}", empDep, emp.ID, emp.LastName, emp.FirstName);
                                continue;
                            }

                            // check if exists
                            if (slaveKeys.Contains(emp.ID))
                            {
                                // compare
                                var empSlave = ctx.Employees.Find(emp.ID);
                                bool changes = false;
                                if (emp.LastName != empSlave.LastName)
                                {
                                    Console.WriteLine("Изменена фалилия сотрудника #{0} с \"{1}\" на \"{2}\"", emp.ID, empSlave.LastName, emp.LastName);
                                    empSlave.LastName = emp.LastName;
                                    changes = true;
                                }
                                if (emp.Position != empSlave.Position || emp.DepartmentID != empSlave.DepartmentID || emp.Category != empSlave.Category)
                                {
                                    Console.WriteLine("Изменена должность или подразделение сотрудника #{0}", emp.ID);
                                    empSlave.DepartmentID = emp.DepartmentID;
                                    empSlave.Position = emp.Position;
                                    empSlave.Category = emp.Category;
                                    changes = true;
                                }
                                slaveKeys.Remove(emp.ID);
                                if (!changes)
                                {
                                    ctx.Entry(empSlave).State = System.Data.Entity.EntityState.Unchanged;
                                }
                            }
                            else
                            {
                                // new employee
                                ctx.Employees.Add(emp);
                            }
                        }

                        // remove dismissed employees
                        foreach (var emp in ctx.Employees.Where(s => slaveKeys.Contains(s.ID)).ToList())
                        {
                            emp.Status = EmployeeStatus.Retired;
                            emp.DateRetire = DateTime.Today;
                            Console.WriteLine("Увольнение сотрудника #{0} {1}", emp.ID, emp.FullName);
                        }

                        // update
                        ctx.SaveChanges();
                        
                        // find heads
                        var topPositions = new[] { 
                            "Начальник", 
                            "Заведующий", 
                            "Управляющий филиалом", 
                            "Главный инженер", 
                            "Главный бухгалтер",
                            "Заместитель начальника службы безопасности- начальник отдела охраны",
                            "Заведующий складом",
                        };
                        foreach (var dep in ctx.Departments.ToList())
                        {
                            var head = ctx.Employees.FirstOrDefault(e => e.DepartmentID == dep.DepartmentID && e.Category == EmployeeCategory.Head && topPositions.Contains(e.Position));
                            if (head == null)
                            {
                                Console.Error.WriteLine("Не найден руководитель для подразделения \"{0}\"", dep.Title);
                                continue;
                            }
                            else if (dep.HeadID != head.ID)
                            {
                                dep.HeadID = head.ID;
                                ctx.Entry(dep).State = System.Data.Entity.EntityState.Modified;
                            }
                        }

                        // update
                        ctx.SaveChanges();

                        transaction.Commit();
                    }
                    catch
                    {
                        transaction.Rollback();
                        throw;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Ошибка импорта сотрудников: {0}\nСтек вызова:\n{1}", ex.Message, ex.StackTrace);
                return false;
            }
            finally
            {
                if (ctx != null)
                {
                    ctx.Dispose();
                }
            }

            return true;
        }

        static string ConvertExcelVal(object val)
        {
            return val is double ? ((double)val).ToString("F0") : val.ToString().Trim();
        }

        static bool ImportContacts()
        {
            Excel.Application excel = null;
            EJContext ctx = null;
            
            try
            {
                string phonesPath = Path.Combine(_curDir, "phones.xls");
                File.Copy(_phoneBook, phonesPath, true);

                excel = new Excel.Application();
                var wb = excel.Workbooks.Open(phonesPath, ReadOnly: true, AddToMru: false);
                var range = ((Excel.Worksheet)wb.ActiveSheet).UsedRange;
                int nrows = range.Rows.Count;

                ctx = new EJContext();
                for (int irow = 4; irow <= nrows; irow++)
                {
                    dynamic row = range.Rows[irow];
                    var cells = (object[,])row.Cells.Value;

                    if (cells.GetLength(1) > 2 && cells[1, 2] != null && cells[1, 3] != null)
                    {
                        string fullName = cells[1, 2].ToString();
                        var emp = ctx.GetEmployeeByFullName(fullName);
                        if (emp != null)
                        {
                            var contact = emp.Contact;
                            if (contact == null)
                            {
                                contact = new ContactInfo() { EmployeeID = emp.ID };
                                ctx.Contacts.Add(contact);
                            }

                            contact.PhoneInteroffice = ConvertExcelVal(cells[1, 3]);
                            if (cells[1, 4] != null)
                            {
                                contact.Room = ConvertExcelVal(cells[1, 4]);
                            }
                            if (cells[1, 5] != null)
                            {
                                contact.PhoneLandline = ConvertExcelVal(cells[1, 5]);
                            }
                            if (cells[1, 6] != null)
                            {
                                contact.PhoneMobile = ConvertExcelVal(cells[1, 6]);
                            }
                        }
                        else
                        {
                            Console.WriteLine("Не найден сотрудник с именем \"{0}\"", fullName);
                        }
                    }
                }
                ctx.SaveChanges();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Возникла ошибка при импорте справочника контактов: {0}\nСтек вызова:\n{1}", ex.Message, ex.StackTrace);
                return false;
            }
            finally
            {
                if (excel != null)
                {
                    if (excel.ActiveWorkbook != null)
                    {
                        excel.ActiveWorkbook.Close();
                    }
                    excel.Quit();
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(excel);
                    excel = null;
                }

                if (ctx != null)
                {
                    ctx.Dispose();
                }
            }
            return true;
        }

        static int Main(string[] args)
        {
            if (!ImportStaff())
            {
                Console.WriteLine("Импорт сотрудников завершен с ошибками");
                return 1;
            }

            if (!ImportContacts())
            {
                Console.WriteLine("Импорт контактов завершен с ошибками");
                return 1;
            }

            return 0;            
        }
    }
}
