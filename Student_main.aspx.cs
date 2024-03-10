using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MCQExamPortal
{
    public partial class Student_main : System.Web.UI.Page
    {
        MySqlConnection con;
        MySqlCommand cmd;
        String str;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!this.IsPostBack)
            {
                BindGridView();
            }

        }

        private void BindGridView()
        {
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["mcqexamConnectionString2"].ConnectionString;
            con = new MySqlConnection(connString);
            con.Open();
            str = $"select * from quiz WHERE qid in (select qid from question) and qid not in (select qid from exam_student where sid = {Session["id"]});";
            cmd = new MySqlCommand(str, con);
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                // Quizzes available for the student to take
                GridView1.DataSource = dt;
                GridView1.DataBind();
                // Hide the message if quizzes are available
                lblMessage.Visible = false;
            }
            else
            {
                // No quizzes available - student has taken all available quizzes
                GridView1.DataSource = null;
                GridView1.DataBind();
                // Show a message indicating the student has already taken the quiz
                lblMessage.Visible = true;
                lblMessage.Text = "You have already taken the available assessment";
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Student_reg_login.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditButton")
            {
                // Directly use the CommandArgument as qid, since it's already the qid value
                string qid = e.CommandArgument.ToString();

                Response.Redirect("~/Student_quiz.aspx?qid=" + qid);
            }
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("result.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}