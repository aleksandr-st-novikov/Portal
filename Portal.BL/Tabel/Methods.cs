using Portal.BL.Core;
using Portal.BL.Tabel.Models;
using Portal.DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.BL.Tabel
{
    public class Methods
    {
        public static async Task<List<DataTabelEmployee3Days>> GetDataTabelEmployee3DaysAsync(DateTime nowDate, string tabN)
        {
            try
            {
                using (DataSqlConnection connection = new DataSqlConnection(Data.DB01KBDataSource, Data.DB01KBInitialCatalog, Data.DB01KBUser, Data.DB01KBPassword))
                {
                    int day = nowDate.Day;
                    int month = nowDate.Month;
                    int year = nowDate.Year;

                    string sqlText =
                        "SELECT [1_с] " +
                        "      ,[1_по] " +
                        "      ,[2_с] " +
                        "      ,[2_по] " +
                        "      ,[3_с] " +
                        "      ,[3_по] " +
                        "      ,[4_с] " +
                        "      ,[4_по] " +
                        "      ,[5_с] " +
                        "      ,[5_по] " +
                        "      ,[6_с] " +
                        "      ,[6_по] " +
                        "      ,[7_с] " +
                        "      ,[7_по] " +
                        "      ,[8_с] " +
                        "      ,[8_по] " +
                        "      ,[9_с] " +
                        "      ,[9_по] " +
                        "      ,[10_с] " +
                        "      ,[10_по] " +
                        "      ,[11_с] " +
                        "      ,[11_по] " +
                        "      ,[12_с] " +
                        "      ,[12_по] " +
                        "      ,[13_с] " +
                        "      ,[13_по] " +
                        "      ,[14_с] " +
                        "      ,[14_по] " +
                        "      ,[15_с] " +
                        "      ,[15_по] " +
                        "      ,[16_с] " +
                        "      ,[16_по] " +
                        "      ,[17_с] " +
                        "      ,[17_по] " +
                        "      ,[18_с] " +
                        "      ,[18_по] " +
                        "      ,[19_с] " +
                        "      ,[19_по] " +
                        "      ,[20_с] " +
                        "      ,[20_по] " +
                        "      ,[21_с] " +
                        "      ,[21_по] " +
                        "      ,[22_с] " +
                        "      ,[22_по] " +
                        "      ,[23_с] " +
                        "      ,[23_по] " +
                        "      ,[24_с] " +
                        "      ,[24_по] " +
                        "      ,[25_с] " +
                        "      ,[25_по] " +
                        "      ,[26_с] " +
                        "      ,[26_по] " +
                        "      ,[27_с] " +
                        "      ,[27_по] " +
                        "      ,[28_с] " +
                        "      ,[28_по] " +
                        "      ,[29_с] " +
                        "      ,[29_по] " +
                        "      ,[30_с] " +
                        "      ,[30_по] " +
                        "      ,[31_с] " +
                        "      ,[31_по] " +
                        "  FROM[График_ТЧ] " +
                        "       INNER JOIN[График] " +
                        "          ON[График_ТЧ].График_Ид = [График].Ид " +
                        "       INNER JOIN[Сотрудники] " +
                        "          ON[График_ТЧ].Сотрудник_Ид = [Сотрудники].Ид " +
                        " WHERE[Сотрудники].ТабельныйНомер = " + tabN +
                        "   AND[График].Статус >= 2 " +
                        "   AND[Сотрудники].Уволен = 0 " +
                        "   AND MONTH([График].ДатаДокумента) = " + month.ToString() +
                        "   AND YEAR([График].ДатаДокумента) = " + year.ToString();

                    SqlCommand com = new SqlCommand(sqlText, connection.Con);
                    List<DataTabelEmployee3Days> data = new List<DataTabelEmployee3Days>();
                    using (SqlDataReader dr = await com.ExecuteReaderAsync())
                    {
                        while (await dr.ReadAsync())
                        {
                            for (int i = 0; i <= 61; i++)
                            {
                                if (i <= (day - 1) * 2 - 1 || i >= (day - 1) * 2 + 6) continue;
                                data.Add(new DataTabelEmployee3Days { DataTabel = dr.IsDBNull(i) ? (DateTime?)null : dr.GetDateTime(i) });
                            }
                        }
                    }
                    return data;
                }
            }
            catch
            {
                return null;
            }
        }

        public static List<DataTabelEmployee3Days> GetDataTabelEmployee3Days(DateTime nowDate, string tabN)
        {
            using (DataSqlConnection connection = new DataSqlConnection(Data.DB01KBDataSource, Data.DB01KBInitialCatalog, Data.DB01KBUser, Data.DB01KBPassword))
            {
                int day = nowDate.Day;
                int month = nowDate.Month;
                int year = nowDate.Year;

                string sqlText =
                    "SELECT [1_с] " +
                    "      ,[1_по] " +
                    "      ,[2_с] " +
                    "      ,[2_по] " +
                    "      ,[3_с] " +
                    "      ,[3_по] " +
                    "      ,[4_с] " +
                    "      ,[4_по] " +
                    "      ,[5_с] " +
                    "      ,[5_по] " +
                    "      ,[6_с] " +
                    "      ,[6_по] " +
                    "      ,[7_с] " +
                    "      ,[7_по] " +
                    "      ,[8_с] " +
                    "      ,[8_по] " +
                    "      ,[9_с] " +
                    "      ,[9_по] " +
                    "      ,[10_с] " +
                    "      ,[10_по] " +
                    "      ,[11_с] " +
                    "      ,[11_по] " +
                    "      ,[12_с] " +
                    "      ,[12_по] " +
                    "      ,[13_с] " +
                    "      ,[13_по] " +
                    "      ,[14_с] " +
                    "      ,[14_по] " +
                    "      ,[15_с] " +
                    "      ,[15_по] " +
                    "      ,[16_с] " +
                    "      ,[16_по] " +
                    "      ,[17_с] " +
                    "      ,[17_по] " +
                    "      ,[18_с] " +
                    "      ,[18_по] " +
                    "      ,[19_с] " +
                    "      ,[19_по] " +
                    "      ,[20_с] " +
                    "      ,[20_по] " +
                    "      ,[21_с] " +
                    "      ,[21_по] " +
                    "      ,[22_с] " +
                    "      ,[22_по] " +
                    "      ,[23_с] " +
                    "      ,[23_по] " +
                    "      ,[24_с] " +
                    "      ,[24_по] " +
                    "      ,[25_с] " +
                    "      ,[25_по] " +
                    "      ,[26_с] " +
                    "      ,[26_по] " +
                    "      ,[27_с] " +
                    "      ,[27_по] " +
                    "      ,[28_с] " +
                    "      ,[28_по] " +
                    "      ,[29_с] " +
                    "      ,[29_по] " +
                    "      ,[30_с] " +
                    "      ,[30_по] " +
                    "      ,[31_с] " +
                    "      ,[31_по] " +
                    "  FROM[График_ТЧ] " +
                    "       INNER JOIN[График] " +
                    "          ON[График_ТЧ].График_Ид = [График].Ид " +
                    "       INNER JOIN[Сотрудники] " +
                    "          ON[График_ТЧ].Сотрудник_Ид = [Сотрудники].Ид " +
                    " WHERE[Сотрудники].ТабельныйНомер = " + tabN +
                    "   AND[График].Статус >= 2 " +
                    "   AND[Сотрудники].Уволен = 0 " +
                    "   AND MONTH([График].ДатаДокумента) = " + month.ToString() +
                    "   AND YEAR([График].ДатаДокумента) = " + year.ToString();

                SqlCommand com = new SqlCommand(sqlText, connection.Con);
                List<DataTabelEmployee3Days> data = new List<DataTabelEmployee3Days>();
                using (SqlDataReader dr = com.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        for (int i = 0; i <= 61; i++)
                        {
                            if (i <= (day - 1) * 2 - 1 || i >= (day - 1) * 2 + 6) continue;
                            data.Add(new DataTabelEmployee3Days { DataTabel = dr.IsDBNull(i) ? (DateTime?)null : dr.GetDateTime(i) });
                        }
                    }
                }
                return data;
            }
        }
    }
}
