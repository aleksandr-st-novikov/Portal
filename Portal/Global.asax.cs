using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using DevExpress.Web;
using System.Data.Entity;
using Portal.Models;
using Portal.Models.EFContext;
using System.Web.UI;
using Portal.Models.Entities;

namespace Portal
{
    public class Global_asax : System.Web.HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            System.Web.Routing.RouteTable.Routes.MapPageRoute("defaultRoute", "", "~/Pages/Default.aspx");
            DevExpress.Web.ASPxWebControl.CallbackError += new EventHandler(Application_Error);
        }

        void Application_End(object sender, EventArgs e)
        {
            // Code that runs on application shutdown
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.
        }

        protected void Application_EndRequest(object sender, EventArgs e)
        {
            if (HttpContext.Current != null && HttpContext.Current.User != null && !IsPostCallBack() && HttpContext.Current.User.Identity.Name != "anovikov"
                && (Request.Url.AbsolutePath.ToString().Contains(".aspx") 
                    || Request.Url.AbsolutePath.ToString() == "/portal/"
                    || Request.Url.AbsolutePath.ToString() == "/portal"))
            {
                HttpContext context = ((HttpApplication)sender).Context;
                string ipv4 = context.Request.UserHostAddress;

                using (UserLogContext userLogContext = new UserLogContext())
                {
                    PagesName pagesName = PagesName.GetPagesNames().FirstOrDefault(p => p.PagePath == Request.Url.AbsolutePath.ToString().ToLower());
                    userLogContext.AddOrUpdate(new Models.Entities.UserLog()
                    {
                        UserName = HttpContext.Current.User.Identity.Name,
                        IPv4 = ipv4,
                        PCName = System.Net.Dns.GetHostEntry(Request.ServerVariables["remote_addr"]).HostName,
                        Request = pagesName != null ? pagesName.PageName : Request.Url.AbsolutePath.ToString().ToLower(),
                        VisitDate = DateTime.Now
                    }, -1);
                }
            }
        }

        private bool IsPostCallBack()
        {
            Page page = HttpContext.Current.Handler as Page;
            return page != null && (page.IsPostBack || page.IsCallback);
        }
    }
}