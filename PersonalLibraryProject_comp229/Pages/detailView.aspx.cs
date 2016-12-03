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
        protected int bookID;
        private string userName;

        protected void Page_Load(object sender, EventArgs e)
        {

            
            bookID = Convert.ToInt32(Request.QueryString["userid"]);

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
                userName = (Master as myPages.ProjectSiteMaster).getUserName();//get user name fromseesion
                //check if user borrowed or user can return

                getUserID
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
            comm.Parameters["@book_id"].Value = bookID;
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

        protected void detailGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void submitButtonClicked(object sender, EventArgs e)
        {

            Response.Redirect("MainTrackingPage.aspx");
        }

    }
}