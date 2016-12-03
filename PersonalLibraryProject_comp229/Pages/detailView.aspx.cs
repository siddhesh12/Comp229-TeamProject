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
                bottomButton.Visible = true;
                userName = (Master as myPages.ProjectSiteMaster).getUserName();//get user name from session
                                                                               //check if user borrowed or user can return

                if(isBookAvailable(""+ bookISBNNo)) //first check if book is available then 
                {
                    bottomButton.Visible = true;
                    bottomButton.Text = "Borrow";
                }
                else
                {

                }


                //                  UPDATE Comp229TeamProject.dbo.Books SET is_available = 0, user_id = 1 WHERE isbn_no = '121106031'
                //SELECT b.is_available from Comp229TeamProject.dbo.Books b JOIN Comp229TeamProject.dbo.Users u ON(b.user_id = u.user_id) WHERE b.isbn_no = '121106031' AND u.user_id = '1'


            }
            else
            {
                bottomButton.Visible = true;
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

        protected bool isBookBorrowedByUser(string isbnNumber, string userName)
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

        protected void detailGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void submitButtonClicked(object sender, EventArgs e)
        {

            Response.Redirect("MainTrackingPage.aspx");
        }

    }
}