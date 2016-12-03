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

    public partial class detailView : System.Web.UI.Page
    {
        protected int bookISBNNo;
        private string userName;
        private int bookStatus;
        private string userID;
        //if bookStatus = 1 // available book 
        //if bookStatus = 2//  current user have bought the book. return text will displayed
        //if bookStatus = 3 // borrowed by some other user. 
        protected void Page_Load(object sender, EventArgs e)
        {

            bookISBNNo = Convert.ToInt32(Request.QueryString["isbn_no"]);

            if (!IsPostBack)
            {
                bindList();
                updateBottomButtons();
            }
        }

        protected void updateBottomButtons()
        {
            if ((Master as myPages.ProjectSiteMaster).checkIsUserExists()) //check wheather user exists in cookies. 
            {
                submitButton.Visible = true;
                bottomButton.Visible = true;
                userName = (Master as myPages.ProjectSiteMaster).getUserName();//get user name from session
                                                                               //check if user borrowed or user can return
                 userID = getUserID(userName); //fetch user id from give username.

                if (isBookAvailable(""+ bookISBNNo)) //first check if book is available then 
                {
                    bottomButton.Visible = true;
                    bottomButton.Text = "Borrow Book";
                    bookStatus = 1;
                }
                else //if book is not availble.
                {
                    //check if book is borrowed by the user it self.
                    if(isBookBorrowedByOtherUser(""+bookISBNNo, userID)) 
                    {
                        bottomButton.Text = "Borrowed, sorry cannot borrow until user returns it. ";
                        bookStatus = 3;
                       
                    }
                    else //borrowed by current user. //if borrowed by the user then change button to return
                    {
                        bottomButton.Visible = true;
                        bottomButton.Text = "Return Book";
                        bookStatus = 2;
                    }
                }

                //                  UPDATE Comp229TeamProject.dbo.Books SET is_available = 0, user_id = 1 WHERE isbn_no = '121106031'
                //SELECT b.is_available from Comp229TeamProject.dbo.Books b JOIN Comp229TeamProject.dbo.Users u ON(b.user_id = u.user_id) WHERE b.isbn_no = '121106031' AND u.user_id = '1'


            }
            else
            {
                bottomButton.Visible = false;
                submitButton.Visible = false;
            }
        }
           
        protected void bindList()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[Global.CONNECTION_STRING].ToString());
            SqlCommand comm = new SqlCommand("SELECT b.book_name, b.book_detail, b.date FROM Comp229TeamProject.dbo.Books b WHERE b.isbn_no =@book_id", connection);
            SqlCommand commReview = new SqlCommand("SELECT r.reviews_msg, u.name FROM Comp229TeamProject.dbo.Reviews r JOIN Comp229TeamProject.dbo.Users u ON(r.user_id = u.user_id) WHERE r.book_id = 1", connection);

            comm.Parameters.Add("@book_id", System.Data.SqlDbType.Int);
            comm.Parameters["@book_id"].Value = bookISBNNo;
            try
            {
                connection.Open();
                SqlDataReader reader = comm.ExecuteReader();
                detailGridView.DataSource = reader;
                detailGridView.DataBind();
                reader.Close();

                SqlDataReader readerReview = commReview.ExecuteReader();
                reviewGrid.DataSource = readerReview;
                reviewGrid.DataBind();
                readerReview.Close();
            }
            finally
            {
                connection.Close();
            }
        }



        protected string getUserID(string userName)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[Global.CONNECTION_STRING].ToString());
            SqlCommand comm = new SqlCommand("SELECT user_id from Comp229TeamProject.dbo.Users where name=@username", connection);

            comm.Parameters.Add("@username", System.Data.SqlDbType.VarChar);
            comm.Parameters["@username"].Value = userName;
            try
            {
                connection.Open();
                SqlDataReader reader = comm.ExecuteReader();

                string userId = "";
                while (reader.Read())
                {
                    userId = Convert.ToString(((IDataRecord)reader)[0]);
                }
                if (userId != null) //userIDexists
                {
                    return userId;
                }
                else
                {
                    return null;
                }

                reader.Close();

             
            }
            finally
            {
                connection.Close();
            }
        }

        protected bool isBookAvailable(string isbnNumber)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[Global.CONNECTION_STRING].ToString());
            SqlCommand comm = new SqlCommand("SELECT b.is_available from  Comp229TeamProject.dbo.Books b WHERE b.isbn_no = @isbnNo", connection);

            comm.Parameters.Add("@isbnNo", System.Data.SqlDbType.VarChar);
            comm.Parameters["@isbnNo"].Value = isbnNumber;
            try
            {
                connection.Open();
                SqlDataReader reader = comm.ExecuteReader();

                bool isAvailable = true;
                while (reader.Read())
                {
                    isAvailable = Convert.ToBoolean(((IDataRecord)reader)[0]);
                }

                return isAvailable;
                reader.Close();


            }
            finally
            {
                connection.Close();
            }
        }

        protected bool isBookBorrowedByOtherUser(string isbnNumber, string userName)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[Global.CONNECTION_STRING].ToString());
            SqlCommand comm = new SqlCommand("SELECT b.is_available from Comp229TeamProject.dbo.Books b JOIN Comp229TeamProject.dbo.Users u ON(b.user_id = u.user_id) WHERE b.isbn_no = @isbnNo AND u.user_id = @userId ", connection);

            comm.Parameters.Add("@isbnNo", System.Data.SqlDbType.VarChar);
            comm.Parameters["@isbnNo"].Value = isbnNumber;

            comm.Parameters.Add("@userId", System.Data.SqlDbType.VarChar);
            comm.Parameters["@userId"].Value = userName;

            try
            {
                connection.Open();
                SqlDataReader reader = comm.ExecuteReader();

                bool isBorrowedByOtherUser = true;
                while (reader.Read())
                {
                    isBorrowedByOtherUser = Convert.ToBoolean(((IDataRecord)reader)[0]);
                }

                return isBorrowedByOtherUser;
                reader.Close();


            }
            finally
            {
                connection.Close();
            }
        }


        protected void updateBookStatus(string userId, string isbnNo, bool bookStatus)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[Global.CONNECTION_STRING].ToString());
            SqlCommand comm = new SqlCommand("UPDATE Comp229TeamProject.dbo.Books SET is_available = @isAvailable, user_id = @userId WHERE isbn_no = @isbnNo", connection);

            comm.Parameters.Add("@isbnNo", System.Data.SqlDbType.VarChar);
            comm.Parameters["@isbnNo"].Value = isbnNo;

            comm.Parameters.Add("@userId", System.Data.SqlDbType.VarChar);
            comm.Parameters["@userId"].Value = userId;

            comm.Parameters.Add("@isAvailable", System.Data.SqlDbType.Bit);
            comm.Parameters["@isAvailable"].Value = bookStatus;

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

        protected void detailGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void submitButtonClicked(object sender, EventArgs e)
        {

            Response.Redirect("MainTrackingPage.aspx");
        }

        protected void bottomButton_Click(object sender, EventArgs e)
        {
            if(bottomButton.Text == "Borrow Book") 
            {
                userName = (Master as myPages.ProjectSiteMaster).getUserName();
                userID = getUserID(userName);
                updateBookStatus(userID, ""+ bookISBNNo, false);
            }
            else if(bottomButton.Text == "Return Book") //if return 
            {
                userName = (Master as myPages.ProjectSiteMaster).getUserName();
                userID = getUserID(userName);
                updateBookStatus(userID, "" + bookISBNNo, true);
            }
            else
            {
                //do nothing because book is already borrowed
            }
        }
    }
}