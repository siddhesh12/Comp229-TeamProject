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
    public partial class insertBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitButtonClicked(object sender, EventArgs e)
        {
            insertBookInformation(titleTextField.Text, bookDetailsTextField.Text, isbnNoTextField.Text, true, DateTime.Now);
        }

        protected void insertBookInformation(string bookTitle, string bookDetail, string isbnNo, bool isAvailable, DateTime date)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnectionString1"].ToString());
            SqlCommand comm = new SqlCommand("INSERT INTO Comp229TeamProject.dbo.Books (isbn_no, book_name, book_detail, is_available, date) VALUES(@isbn_no, @book_name, @book_detail, @isAvilable, @date)", connection);

            comm.Parameters.Add("@isbn_no", System.Data.SqlDbType.VarChar);
            comm.Parameters["@isbn_no"].Value = isbnNo;

            comm.Parameters.Add("@book_name", System.Data.SqlDbType.VarChar);
            comm.Parameters["@book_name"].Value = bookTitle;

            comm.Parameters.Add("@book_detail", System.Data.SqlDbType.VarChar);
            comm.Parameters["@book_detail"].Value = bookDetail;

            comm.Parameters.Add("@isAvilable", System.Data.SqlDbType.Bit);
            comm.Parameters["@isAvilable"].Value = isAvailable;

            comm.Parameters.Add("@date", System.Data.SqlDbType.DateTime);
            comm.Parameters["@date"].Value = date;

            try
            {
                connection.Open();
                comm.ExecuteNonQuery();
                Response.Redirect("MainTrackingPage.aspx");
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


    }
}