using DevExpress.XtraEditors;
using Portal.BL.UKM.Models;
using Portal.Models.EFContext;
using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Portal.appPortal
{
    public partial class MainView : DevExpress.XtraEditors.XtraForm
    {
        public MainView()
        {
            InitializeComponent();
            if (!mvvmContext1.IsDesignMode)
                InitializeBindings();
        }

        void InitializeBindings()
        {
            var fluent = mvvmContext1.OfType<MainViewModel>();
        }

        private async void simpleButton1_Click(object sender, EventArgs e)
        {
            using (JobContext jobContext = new JobContext())
            using (JobResultContext jobResultContext = new JobResultContext())
            {
                try
                {
                    //Id job = 2
                    Job job = await jobContext.FindByIdAsync(2);
                    List<string> parametersList = String.IsNullOrEmpty(textEdit1.Text) ? job.Parameters.Split(';').ToList() : textEdit1.Text.Split(';').ToList();
                    if (parametersList.Count < 3 || String.IsNullOrEmpty(parametersList[0]) || String.IsNullOrEmpty(parametersList[1]) || String.IsNullOrEmpty(parametersList[2]))
                    {
                        throw new ArgumentException("Parameter cannot be null");
                    }
                    //get data
                    List<ReportDiscount50Data> data = await BL.UKM.Methods.GetDataRepDiscount50Async(parametersList[0], parametersList[1]);
                    //prepare message
                    List<string> message = new List<string>();
                    foreach (var d in data)
                    {
                        message.Add(d.Article.PadRight(10) + d.Name.PadRight(50) + d.Quantity.ToString().PadLeft(10));
                    }
                    //send message
                    if (checkEdit1.Checked)
                    {
                        await Task.Run(() => Portal.BL.Utils.Service.SendMessage(parametersList[2], "Реализация акционных товаров (-50%)", String.Join("\n", message), isBodyHtml : false));
                    }
                    else
                    {
                        XtraMessageBox.Show(String.Join("\n", message));
                    }
                }
                catch(Exception ex)
                {
                    XtraMessageBox.Show(ex.Message);
                }
            }
        }
    }
}
