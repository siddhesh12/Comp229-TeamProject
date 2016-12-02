using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalLibraryProject_comp229.Pages
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void insertBookButtonClicked(object sender, EventArgs e)
        {
            Response.Redirect("insertBook.aspx");
        }

        protected void loginButtonPressed(object sender, EventArgs e)
        {
            checkLogin(Login1.UserName, Login1.Password);

        }

        protected void checkLogin(string name, string password)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[Global.CONNECTION_STRING].ToString());
            SqlCommand comm = new SqlCommand("SELECT CASE WHEN EXISTS (SELECT * FROM Comp229TeamProject.dbo.Users WHERE name = @name AND password = @password) THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END", connection);
            comm.Parameters.Add("@name", System.Data.SqlDbType.VarChar);
            comm.Parameters["@name"].Value = name;

            comm.Parameters.Add("@password", System.Data.SqlDbType.VarChar);
            comm.Parameters["@password"].Value = password;

            try
            {
                connection.Open();
                SqlDataReader reader = comm.ExecuteReader();

                if (reader.Read())
                {
                     if(reader.GetBoolean(0))
                    {
                        Response.Redirect("MainTrackingPage.aspx");
                    }
                     else
                    {
                       
                        Login1.FailureText = "Wrong UserName or Password";
                        Login1.EnableViewState = true;
                    }
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('error: " + ex.Message + "'); </script>");
            }
            finally
            {
                connection.Close();
            }
        }

        protected void registrationButtonClicked(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}