using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalLibraryProject_comp229.myPages
{
    public partial class ProjectSiteMaster : System.Web.UI.MasterPage
    {
        private bool isUserPresent;
        protected void Page_Load(object sender, EventArgs e)
        {
            updateSessionData(); //check if sessiong exists then update login logout button 
        }


        public void updateSessionData()
        {
            if(checkIsUserExists())
            {
                isUserPresent = true;
                loginLabel.Text = "Logout";
            }
            else
            {
                isUserPresent = false;
                loginLabel.Text = "Login";
            }
           

        }

        public bool checkIsUserExists()
        {
            string userName = (string)Session[Global.USERNAME];
            if (userName != null)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public bool checkIsAdmin()
        {
            string userName = (string)Session[Global.USERNAME];
            string password = (string)Session[Global.PASSWORD];

            if (userName != null && password != null)
            {
                if ((userName == Global.ADMINUSERNAME && password == Global.ADMINPASSWORD))
                    return true;
                else
                    return false;
            }
            else
            {
                return false;
            }

        }


        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.facebook.com");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.twitter.com");
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.linkedin.com");
        }

        protected void loginLabel_Click(object sender, EventArgs e)
        {
            if(isUserPresent)
            {
                logoutUser();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        private void logoutUser()
        {
            Session[Global.USERNAME] = null;
            Session[Global.PASSWORD] = null;
            loginLabel.Text = "Login";
            isUserPresent = false;
        }
    }
}