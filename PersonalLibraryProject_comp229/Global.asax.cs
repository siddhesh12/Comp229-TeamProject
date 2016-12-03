using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace PersonalLibraryProject_comp229
{
    public class Global : System.Web.HttpApplication
    {
        public const string CONNECTION_STRING = "dbConnectionString";
        public const string USERNAME = "user_name";
        public const string PASSWORD = "password";
        public const string ADMINUSERNAME = "Admin";
        public const string ADMINPASSWORD = "Admin12345";
        public bool isSiddhesh = true;

        public bool checkIsUserExists()
        {
            string userName = (string)Session[USERNAME];
            if (userName != null)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        protected void Application_Start(object sender, EventArgs e)
        {
           
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}