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
        public string CONNECTION_STRING;
        public bool isSiddhesh = true;
        protected void Application_Start(object sender, EventArgs e)
        {
            if(isSiddhesh)
            {
                CONNECTION_STRING = "dbConnectionString";
            }
            else //if aakash is logged in will just make above flag false. So that Aaakash can run the code in his project. 
            { 
                CONNECTION_STRING = "dbConnectionString1";
            }
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