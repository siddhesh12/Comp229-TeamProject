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
    public partial class detailView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindList();
            }
        }

        protected void bindList()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnectionString"].ToString());
            SqlCommand comm = new SqlCommand("SELECT b.book_name, b.book_detail, b.date FROM Comp229TeamProject.dbo.Books b WHERE b.book_id = 16", connection);
            SqlCommand commReview = new SqlCommand("SELECT r.reviews_msg, u.name FROM Comp229TeamProject.dbo.Reviews r JOIN Comp229TeamProject.dbo.Users u ON(r.user_id = u.user_id) WHERE r.book_id = 16", connection);


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

        protected void detailGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void submitButtonClicked(object sender, EventArgs e)
        {
            Response.Redirect("MainTrackingPage.aspx");
        }
    }
}