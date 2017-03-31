using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace Portal.Models.EFContext
{
    public class PositionContext : ApplicationContext
    {
        public async Task AddRangePositionAsync(List<string> positions)
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

    }
}