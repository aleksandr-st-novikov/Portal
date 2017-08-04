using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Portal.Models.EFContext
{
    public abstract class ApplicationContext<T> : IDisposable where T : class
    {
        public ApplicationDbContext context = new ApplicationDbContext();

        bool disposed = false;

        public ICollection<T> GetAll()
        {
            return context.Set<T>().ToList();
        }

        public async Task<ICollection<T>> GetAllAsync()
        {
            return await context.Set<T>().ToListAsync();
        }

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
            disposed = true;
        }

        public async Task<bool> SaveChangesAsync()
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

        public bool SaveChanges()
        {
            try
            {
                context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public async Task<T> AddOrUpdateAsync(T updated, int id)
        {
            if (updated == null) return null;

            T res;
            T existing = await context.Set<T>().FindAsync(id);
            if (existing != null)
            {
                context.Entry(existing).CurrentValues.SetValues(updated);
                await context.SaveChangesAsync();
                res = existing;
            }
            else
            {
                context.Set<T>().Add(updated);
                await context.SaveChangesAsync();
                res = updated;
            }
            return res;
        }

        public T AddOrUpdate(T updated, int id)
        {
            if (updated == null) return null;

            T res;
            T existing = context.Set<T>().Find(id);
            if (existing != null)
            {
                context.Entry(existing).CurrentValues.SetValues(updated);
                context.SaveChanges();
                res = existing;
            }
            else
            {
                context.Set<T>().Add(updated);
                context.SaveChanges();
                res = updated;
            }
            return res;
        }

        public T FindById(int id)
        {
            return context.Set<T>().Find(id);
        }

        public async Task<T> FindByIdAsync(int id)
        {
            return await context.Set<T>().FindAsync(id);
        }
    }
}