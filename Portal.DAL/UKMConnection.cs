using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace Portal.DAL
{
    public class UKMConnection : IDisposable
    {
        private string _connectionString;

        public MySqlConnection Con;

        public UKMConnection(string DataSource, string UserId, string Password)
        {
            if (String.IsNullOrEmpty(DataSource) || String.IsNullOrEmpty(UserId) || String.IsNullOrEmpty(Password))
                return;

            _connectionString = "Data Source=" + DataSource + ";User Id=" + UserId + ";Password=" + Password;

            Con = new MySqlConnection(_connectionString);
            Con.Open();
        }

        #region IDisposable Support
        private bool disposedValue = false; // To detect redundant calls

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

        // TODO: override a finalizer only if Dispose(bool disposing) above has code to free unmanaged resources.
        // ~UKMConnections() {
        //   // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
        //   Dispose(false);
        // }

        // This code added to correctly implement the disposable pattern.
        public void Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            Dispose(true);
            // TODO: uncomment the following line if the finalizer is overridden above.
            // GC.SuppressFinalize(this);
        }
        #endregion
    }
}
