using Portal.Models.Entities;
using Portal.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Portal.Models.EFContext
{
    public class ConstantContext : ApplicationContext<Constant>
    {
        public string GetConstString(string constantName)
        {
            Constant entry = context.Constant.FirstOrDefault(c => c.Name.ToUpper() == constantName.ToUpper());
            return entry != null ? entry.Value : null;
        }

        public async Task<string> GetConstStringAsync(string constantName)
        {
            Constant entry = await context.Constant.FirstOrDefaultAsync(c => c.Name.ToUpper() == constantName.ToUpper());
            return entry != null ? entry.Value : null;
        }

        public Int32 GetConstInt(string constantName)
        {
            Constant entry = context.Constant.FirstOrDefault(c => c.Name.ToUpper() == constantName.ToUpper());
            int res = -1;
            if (entry != null)
            {
                Int32.TryParse(entry.Value, out res);
            }
            return res;
        }

        public async Task<Int32> GetConstIntAsync(string constantName)
        {
            Constant entry = await context.Constant.FirstOrDefaultAsync(c => c.Name.ToUpper() == constantName.ToUpper());
            int res = -1;
            if (entry != null)
            {
                Int32.TryParse(entry.Value, out res);
            }
            return res;
        }
    }
}