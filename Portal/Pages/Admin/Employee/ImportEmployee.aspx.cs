using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Odbc;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Admin.Employee
{
    public partial class ImportEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ASPxTextBoxPathDBF.Text = @"e:\VS\Portal\IW\exp_ej.DBF";
        }

        protected void ASPxButtonImportEmployee_Click(object sender, EventArgs e)
        {
            string filePath = ASPxTextBoxPathDBF.Text;
            //string constr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Path.GetDirectoryName(filePath) + ";Extended Properties=dBASE III;User ID=Admin;Password=;";
            string constr = "Driver={Microsoft dBase Driver (*.dbf)};SourceType=DBF;SourceDB=" + Path.GetDirectoryName(filePath) + ";Exclusive=No; Collate=Machine;NULL=NO;DELETED=NO;BACKGROUNDFETCH=NO;";
            //using (OleDbConnection con = new OleDbConnection(constr))
            using (OdbcConnection con = new OdbcConnection(constr))
            {
                con.Open();

                OdbcCommand cmd = new OdbcCommand("Select * From " + filePath, con);
                OdbcDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    DataTable dt = new DataTable();
                    dt.Load(dr);

                    List<Department> dep = new List<Department>();
                    foreach (DataRow row in dt.Rows)
                    {
                        int i = 1;
                        dep.Add(new Department()
                        {
                            Id = i++,
                            Name = Convert.ToString(row[5])
                        });
                    }

                }
                con.Close();

                


                //var sql = "select * from " + Path.GetFileNameWithoutExtension(filePath);
                //OleDbCommand cmd = new OleDbCommand(sql, con);
                //con.Open();
                //DataSet ds = new DataSet(); ;
                //OleDbDataAdapter da = new OleDbDataAdapter(cmd);
                //da.Fill(ds);
                //List<Department> dep = new List<Department>();
                //foreach(DataRow row in ds.Tables[0].Rows)
                //{
                //    int i = 1;
                //    dep.Add(new Department()
                //    {
                //        Id = i++,
                //        Name = Convert.ToString(row[5])
                //    });
                //}
                var dfgdfg = "";
            }
        }
        string convertDefaultToDos(String src)
        {
            byte[] buffer;
            buffer = Encoding.Default.GetBytes(src);
            Encoding.Convert(Encoding.Default, Encoding.GetEncoding(866), buffer);
            return Encoding.Default.GetString(buffer);
        }

        string convertWinToUTF8(String src)
        {
            Encoding wind1251 = Encoding.GetEncoding(1251);
            Encoding utf8 = Encoding.GetEncoding(866);
            byte[] wind1251Bytes = wind1251.GetBytes(src);
            byte[] utf8Bytes = Encoding.Convert(wind1251, utf8, wind1251Bytes);
            return Encoding.UTF8.GetString(utf8Bytes);
        }
    }
}