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
    public partial class MainTrackingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                bindList();
                updateLoginUserUI();

            }
        }

        protected void updateLoginUserUI()
        {

            if ((Master as myPages.ProjectSiteMaster).checkIsUserExists()) //check wheather user exists in cookies. 
            {
                if((Master as myPages.ProjectSiteMaster).checkIsAdmin()) //if it is admin then only you can insert any book. other wise you cannot insert it. 
                      insertButton.Visible = true;
                else
                      insertButton.Visible = false;
            }
            else
            {
                insertButton.Visible = false;
            }
        }


       
       
        protected void bindList()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[Global.CONNECTION_STRING].ToString());
            SqlCommand commRecentlyAdded = new SqlCommand("SELECT b.book_name, b.book_detail, b.date, b.isbn_no FROM Comp229TeamProject.dbo.Books b WHERE b.date  > @date AND b.is_available = 1", connection);
            SqlCommand commAvailableBooks = new SqlCommand("SELECT b.book_name, b.book_detail, b.date, b.isbn_no FROM Comp229TeamProject.dbo.Books b WHERE b.is_available = @isAvailable", connection);
            SqlCommand commBorrowedBooks = new SqlCommand("SELECT b.book_name, b.book_detail, b.date, b.isbn_no FROM Comp229TeamProject.dbo.Books b WHERE b.is_available = @isAvailable", connection);

            commRecentlyAdded.Parameters.Add("@date", System.Data.SqlDbType.Date);
            commRecentlyAdded.Parameters["@date"].Value = DateTime.Now.AddDays(-15);

            commAvailableBooks.Parameters.Add("@isAvailable", System.Data.SqlDbType.Bit);
            commAvailableBooks.Parameters["@isAvailable"].Value = true;

            commBorrowedBooks.Parameters.Add("@isAvailable", System.Data.SqlDbType.Bit);
            commBorrowedBooks.Parameters["@isAvailable"].Value = false;

            try
            {
                connection.Open();
                SqlDataReader readerRecentlyAdded = commRecentlyAdded.ExecuteReader();
                recentlyAddedGrid.DataSource = readerRecentlyAdded;
                recentlyAddedGrid.DataBind();
                readerRecentlyAdded.Close();

                SqlDataReader readerAvailableBooks = commAvailableBooks.ExecuteReader();
                availabaleGrid.DataSource = readerAvailableBooks;
                availabaleGrid.DataBind();
                readerAvailableBooks.Close();

                SqlDataReader readerBorrowedBooks = commBorrowedBooks.ExecuteReader();
                borrowedGrid.DataSource = readerBorrowedBooks;
                borrowedGrid.DataBind();
                readerBorrowedBooks.Close();
            }
            finally
            {
                connection.Close();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            if (e.CommandName == "detailCommand")
            { 
                Response.Redirect("detailView.aspx?isbn_no=" + (e.CommandArgument.ToString()));
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void insertButtonClicked(object sender, EventArgs e)
        {
            Response.Redirect("insertBook.aspx");
        }

        protected void borrowedGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void recentlyAddedGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}