using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Portal.Models.EFContext
{
    public class PositionContext : IDisposable
    {
        private ApplicationDbContext context = new ApplicationDbContext();

        bool disposed = false;

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposed)
                return;

            if (disposing)
            {
                context.Dispose();
            }

            // Free any unmanaged objects here. 
            //
            disposed = true;
        }

        public async Task AddRangePosition(List<string> positions)
        {
            foreach (string pos in positions)
            {
                Position entry = await context.Position.FirstOrDefaultAsync(d => d.Name == pos);
                if (entry == null)
                {
                    Position forAdd = new Position()
                    {
                        Name = pos,
                        IsActive = true
                    };
                    context.Position.Add(forAdd);
                }
                else
                {
                    entry.Name = pos;
                    entry.IsActive = true;
                }
            }
        }

        public async Task<bool> SaveChanges()
        {
            try
            {
                await context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}