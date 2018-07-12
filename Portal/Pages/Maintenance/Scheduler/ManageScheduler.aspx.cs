﻿using System;
using System.Web;
using System.Web.UI;
using Portal.BL.Utils;

namespace Portal.Pages.Maintenance.Scheduler
{
    public partial class ManageScheduler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("Администраторы") && User.Identity.Name != "anovikov")
            {
                HttpContext.Current.Response.Redirect(ResolveUrl("~/"), false);
                return;
            }

            if (!Page.IsCallback && !Page.IsPostBack)
            {
                ASPxHint1.Content =
    @"<pre>*    *    *    *    *    *    *
┬    ┬    ┬    ┬    ┬    ┬    ┬
│    │    │    │    │    │    │
│    │    │    │    │    │    └─ Год (необязательное поле) [, - * /]
│    │    │    │    │    └────── День недели (1 - 7) (Воскресенье = 1) [, - * ? / L #]
│    │    │    │    └─────────── Месяц (1 - 12) [, - * /]
│    │    │    └──────────────── День месяца (1 - 31) [, - * ? / L W]
│    │    └───────────────────── Часы (0 - 23) [, - * /]
│    └────────────────────────── Минуты (0 - 59) [, - * /]
└─────────────────────────────── Секунды (0 - 59) [, - * /]
<ul><li>Символ косая черта (/) обозначает приращение значения. Например, «5 / 15» в поле «секунды» означает
каждые 15 секунд, начиная с пятой секунды.</li>
<li>Знак вопроса(?) и букву L(L) разрешается использовать только в полях «день месяца» и «день недели».
Знак вопроса означает, что в поле не должно быть указанной величины.Таким образом, если вы устанавливаете 
день недели, вы можете вставить « ? » в поле «день недели» для обозначения того, что значение «день недели» 
несущественно.Буква L -это сокращение от last(последний).Если она помещается в поле «день месяца», задание 
будет запланировано на последний день месяца. В поле «день недели» «L» равнозначно «7», если помещается само 
по себе, или означает последний экземпляр «дня недели» в этом месяце. Так, «0L» запланирует выполнение 
задания на последнее воскресенье данного месяца.</li>
<li>Буква W(W) в поле «день месяца» планирует выполнение задания на ближайший к заданному значению рабочий день. 
Введя «1W» в поле «день месяца» вы планируете выполнение задания на рабочий день, ближайший к первому числу месяца.</li>
<li>Знак фунта(#) устанавливает конкретный рабочий день данного месяца. Ввод «MON#2» в поле «день недели» планирует 
задание на второй понедельник месяца.</li>
<li>Знак астериска (*) является подстановочным знаком и обозначает, что любое возможное значение может быть 
принято для данного отдельного поля.</li></ul>
</pre>";
                ASPxLabelServiceState.Text = Service.GetServiceStatus("Portal.Service");
            }
        }

        protected void Page_Prerender (object sender, EventArgs e)
        {
            Page.Title = ASPxLabelHead.Text = "Планировщик заданий";
        }

        
    }
}