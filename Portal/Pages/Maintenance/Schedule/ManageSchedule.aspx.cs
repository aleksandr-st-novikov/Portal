using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portal.Pages.Maintenance.Schedule
{
    public partial class ManageSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ASPxHint1.Content = 
@"<pre>*    *    *    *    *  
┬    ┬    ┬    ┬    ┬
│    │    │    │    └───── day of week(0 - 6)(Sunday = 0)
│    │    │    └────────── month(1 - 12)
│    │    └─────────────── day of month(1 - 31)
│    └──────────────────── hour(0 - 23)
└───────────────────────── min(0 - 59)
</br>
* * * * *        Every minute.
0 * * * *        Top of every hour.
0,1,2 * * * *    Every hour at minutes 0, 1, and 2.
*/2 * * * *      Every two minutes.
1-55 * * * *     Every minute through the 55th minute.
* 1,10,20 * * *  Every 1st, 10th, and 20th hours.
</pre>";
        }

        protected void Page_Prerender (object sender, EventArgs e)
        {
            Page.Title = ASPxLabelHead.Text = "Планировщик заданий";
        }
    }
}