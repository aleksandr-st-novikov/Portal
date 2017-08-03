using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Portal.DAL;
using MySql.Data.MySqlClient;
using Portal.BL.UKM.Models;
using Portal.BL.Core;

namespace Portal.BL.UKM
{
    public class Methods
    {
        public static async Task<List<Store>> GetDataAsync()
        {
            using (UKMConnection uKMConnection = new UKMConnection(Data.UKMHost, Data.UKMUser, Data.UKMPassword))
            {
                string sqlText = "select * from ukmserver.trm_in_store where deleted = 0";
                MySqlCommand com = new MySqlCommand(sqlText, uKMConnection.Con);
                List<Store> stores = new List<Store>();
                using (MySqlDataReader dr = await com.ExecuteReaderAsync() as MySqlDataReader)
                {
                    while(await dr.ReadAsync())
                    {
                        stores.Add(new Store {
                            StoreId = dr.GetInt32(0),
                            Name = dr.GetString(1)
                        });
                    }
                }
                return stores;
            }
        }


        public static async Task<List<ReportDiscount50Data>> GetDataRepDiscount50Async(string articles, string storeId)
        {
            using (UKMConnection uKMConnection = new UKMConnection(Data.UKMHost, Data.UKMUser, Data.UKMPassword))
            {
                string sqlText =
                    "SELECT i.item \"Артикул\", " +
                    "       i.name \"Наименование\", " +
                    "       SUM(IF(h.type IN (0,5), 1, -1) * i.quantity) \"Кол - во\" " +
                    "  FROM trm_in_pos c " +
                    "       INNER JOIN ukmserver.trm_out_receipt_header h " +
                    "          ON h.cash_id = c.cash_id " +
                    "       INNER JOIN ukmserver.trm_out_receipt_item i " +
                    "          ON i.cash_id = h.cash_id " +
                    "         AND i.receipt_header = h.id " +
                    "       INNER JOIN ukmserver.trm_out_receipt_footer f " +
                    "          ON f.cash_id = h.cash_id " +
                    "         AND f.id = h.id " +
                    " WHERE i.type = 0 " +
                    "   AND h.type IN (0,5,1,4) " +
                    "   AND f.result = 0 " +
                    "   AND c.store_id = " + storeId + " " +
                    "   AND i.item IN (" + articles + ")" +
                    "   AND h.date BETWEEN '" + DateTime.Now.ToString("yyyy-mm-dd 00:00:00") + "' AND '" + DateTime.Now.ToString("yyyy-mm-dd 23:59:59") + "'" +
                    " GROUP BY i.item " +
                    " ORDER BY i.item";

                MySqlCommand com = new MySqlCommand(sqlText, uKMConnection.Con);
                List<ReportDiscount50Data> data = new List<ReportDiscount50Data>();
                using (MySqlDataReader dr = await com.ExecuteReaderAsync() as MySqlDataReader)
                {
                    while (await dr.ReadAsync())
                    {
                        data.Add(new ReportDiscount50Data
                        {
                            Article = dr.GetString(0),
                            Name = dr.GetString(1),
                            Quantity = dr.GetDecimal(2)
                        });
                    }
                }
                return data;
            }
        }

    }
}
