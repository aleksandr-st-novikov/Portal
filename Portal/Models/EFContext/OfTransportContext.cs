using Portal.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Portal.Models.EFContext
{
    public class OfTransportContext : ApplicationContext<OfTransport>
    {

        public List<OfTransport> GetDataForReport(DateTime dateFrom, DateTime dateTo)
        {
            return (from t in context.OfTransport
                    where t.Date >= dateFrom && t.Date <= dateTo
                    orderby t.Date descending
                    select t).ToList();
        }
    }
}