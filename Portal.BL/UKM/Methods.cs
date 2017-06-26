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

    }
}
