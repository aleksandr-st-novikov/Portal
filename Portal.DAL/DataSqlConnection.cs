using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.DAL
{
    public class DataSqlConnection : IDisposable
    {
        private string _connectionString;

        public SqlConnection Con;

        public DataSqlConnection(string dataSource, string initialCatalog, string userId, string password)
        {
            if (String.IsNullOrEmpty(dataSource) || String.IsNullOrEmpty(initialCatalog) || String.IsNullOrEmpty(userId) || String.IsNullOrEmpty(password))
                return;

            _connectionString = @"Data Source=" + 
                dataSource + ";Initial Catalog=" +
                initialCatalog + ";Persist Security Info=False;User ID=" +
                userId + ";Password=" +
                password + ";Pooling=False;MultipleActiveResultSets=False;Encrypt=False;TrustServerCertificate=True";

            Con = new SqlConnection(_connectionString);
            Con.Open();
        }

        #region IDisposable Support
        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    if (Con != null) Con.Close();
                }
                disposedValue = true;
            }
        }

        public void Dispose()
        {
            Dispose(true);
        }
        #endregion
    }
}
