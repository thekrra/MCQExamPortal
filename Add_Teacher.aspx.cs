using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Threading.Tasks;
using System.Web.UI;

namespace MCQExamPortal
{
    public partial class Add_Teacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in, otherwise redirect
            if (Session["temail"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                // Any initial page setup that needs to happen only once
            }
        }

        protected void Add_Student(object sender, EventArgs e)
        {
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["mcqexamConnectionString2"].ConnectionString;

            using (MySqlConnection con = new MySqlConnection(connString))
            {
                try
                {
                    con.Open();
                    string str = "SELECT COUNT(*) FROM mcqexam.teacher WHERE temail = @temail";
                    using (MySqlCommand cmd = new MySqlCommand(str, con))
                    {
                        cmd.Parameters.AddWithValue("@temail", temail.Text);
                        int count = Convert.ToInt32(cmd.ExecuteScalar());

                        if (count == 0)
                        {
                            str = "INSERT INTO mcqexam.teacher(temail, tpass) VALUES(@temail, @tpass)";
                            using (MySqlCommand insertCmd = new MySqlCommand(str, con))
                            {
                                insertCmd.Parameters.AddWithValue("@temail", temail.Text);
                                insertCmd.Parameters.AddWithValue("@tpass", tpass.Text);
                                insertCmd.ExecuteNonQuery();

                                Label4.Text = "Admin account added successfully.";
                                Label4.ForeColor = System.Drawing.Color.Green;
                            }
                        }
                        else
                        {
                            Label4.Text = "An account with the provided email already exists.";
                            Label4.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"Error: {ex.Message}");
                }
            }
        }

        // Other event handlers


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gotohome(object sender, EventArgs e)
        {
            Response.Redirect("HomeTeacher.aspx");
        }

        protected void password_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
