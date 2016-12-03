using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PersonalLibraryProject_comp229.Pages
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            errorMSG.Visible = false;

            //INSERT INTO Comp229TeamProject.dbo.Users(name, last_name, age, password) values('', '', 2, '');
        }

        protected void reginstrationClicked(object sender, EventArgs e)
        {

            if (isUserNameExists(nameTextField.Text))
            {
                errorMSG.Visible = true;
                errorMSG.Text = "user with same name already exists, please use different username";

            }
            else
            {
                errorMSG.Visible = false;

                int age = new DateTime(DateTime.Now.Subtract(Convert.ToDateTime(dateTF.Text)).Ticks).Year - 1;

                insertUser(nameTextField.Text, lastNameTextFeild.Text, age, passwordTF.Text);
            }

        }


        protected bool isUserNameExists(string name)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[Global.CONNECTION_STRING].ToString());
            SqlCommand coomm = new SqlCommand("SELECT COUNT(name) 'count' from Comp229TeamProject.dbo.Users where name = @name", connection);

            coomm.Parameters.Add("@name", System.Data.SqlDbType.VarChar);
            coomm.Parameters["@name"].Value = name;

            try
            {
                connection.Open();
                SqlDataReader reader = coomm.ExecuteReader();
                bool isPresent = false;
                while (reader.Read())
                {
                    int count = Convert.ToInt32(((IDataRecord)reader)[0]);
                    if (count == 0)
                    {
                        isPresent = false;
                    }
                    else
                    {
                        isPresent = true;
                    }
                }
                reader.Close();

                return isPresent;

            }
            finally
            {
                connection.Close();
            }
        }

        protected void insertUser(string name, string lastName, int age, string password)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[Global.CONNECTION_STRING].ToString());
            SqlCommand comm = new SqlCommand("INSERT INTO Comp229TeamProject.dbo.Users (name, last_name, age, password) values (@name,@lastName,@age, @password);", connection);

            comm.Parameters.Add("@name", System.Data.SqlDbType.VarChar);
            comm.Parameters["@name"].Value = name;

            comm.Parameters.Add("@lastName", System.Data.SqlDbType.VarChar);
            comm.Parameters["@lastName"].Value = lastName;

            comm.Parameters.Add("@age", System.Data.SqlDbType.Int);
            comm.Parameters["@age"].Value = age;

            comm.Parameters.Add("@password", System.Data.SqlDbType.VarChar);
            comm.Parameters["@password"].Value = password;

            try
            {
                errorMSG.Visible = false;
                connection.Open();
                comm.ExecuteNonQuery();
                Session[Global.USERNAME] = name;
                Session[Global.PASSWORD] = password;
                (Master as myPages.ProjectSiteMaster).updateSessionData();

                Response.Redirect("~/Pages/MainTrackingPage.aspx");
            }
            catch (Exception ex)
            {
                errorMSG.Visible = true;
                errorMSG.Text = ex.Message;
                Response.Write("<script> alert('error: " + ex.Message + "'); </script>");
            }
            finally
            {
                connection.Close();
            }
        }


    }
}