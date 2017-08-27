using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;

namespace Portal.Models.EFContext
{
    public class ExitContext : ApplicationContext<Exit>
    {
        internal async Task SetDateFromCheckAsync(int id)
        {
            Models.Entities.Exit exit = await context.Exit.FindAsync(id);
            if (exit != null)
            {
                if (exit.DateFromCheck == null)
                {
                    exit.DateFromCheck = DateTime.Now;
                    await context.SaveChangesAsync();
                }
            }
        }

        internal async Task SetDateToCheckAsync(int id)
        {
            Models.Entities.Exit exit = await context.Exit.FindAsync(id);
            if (exit != null)
            {
                if (exit.DateToCheck == null)
                {
                    if (exit.DateFromCheck != null && exit.DateFromCheck < DateTime.Now)
                    {
                        exit.DateToCheck = DateTime.Now;
                        await context.SaveChangesAsync();
                    }
                }
            }
        }
    }
}