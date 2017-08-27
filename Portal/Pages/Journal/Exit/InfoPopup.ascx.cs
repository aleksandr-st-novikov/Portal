using Portal.BL.Core;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLTabel = Portal.BL.Tabel;

namespace Portal.Pages.Journal.Exit
{
    public partial class InfoPopup : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void ASPxCallbackInfo_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            string[] param = e.Parameter.Split(';');

            using (EmployeeContext employeeContext = new EmployeeContext())
            using (ExitContext exitContext = new ExitContext())
            using (ConstantContext constantContext = new ConstantContext())
            {
                Employee employee = employeeContext.FindById(Int32.Parse(param[0]));
                Employee permitEmployee = employeeContext.FindById(Int32.Parse(param[1]));
                Portal.Models.Entities.Exit exit = exitContext.FindById(Int32.Parse(param[2]));
                string content = "<div class=\"hintContent\">" +
                    "<img src=\"" + "../../../Content/Photo/" + employee.FullName.Trim() + ".jpg\" />" +
                    "<div> <strong>" + employee.FullName + "</strong></br>" + employee.Position.Name + "</br>Подразделение: " + employee.Department.ShortName + "</br></br>" +
                    "Время выхода: " + exit.DateFrom.ToString("dd.MM.yyyy HH:mm") + "</br>" +
                    "Время входа: " + ((DateTime)exit.DateTo).ToString("dd.MM.yyyy HH:mm") + "</br>" +
                    "Согласовано: " + permitEmployee.FIO + "</br></br>";

                if ((String.IsNullOrEmpty(constantContext.GetConstString("ConnectToTabel")) ?
                    Data.ConnectToTabel : constantContext.GetConstString("ConnectToTabel")) == "1")
                {
                    List<string> tabelData = BLTabel.Methods.GetDataTabel(exit.DateFrom, employee.TabN.Remove(employee.TabN.Length - 3));
                    if (tabelData.Count() > 0)
                    {
                        content += "Время работы по графику " + tabelData[0];
                    }
                }
                content += "</div></div><div class=\"hintContent\">Комментарий: " + exit.DescriptionOne + "</br>Дополнение: " + exit.DescriptionTwo + "</div>";
                e.Result = content;
            }
        }
    }
}