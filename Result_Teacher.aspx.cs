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
    public partial class Result_Teacher : System.Web.UI.Page
    {
        MySqlConnection con;
        MySqlCommand cmd;
        String str;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["temail"] == null)
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
            str = $@"
SELECT q.qid AS quizId, q.name AS quizName, s.FullName AS StudentName, s.Email AS EmailName, r.marks
FROM quiz q
JOIN result r ON q.qid = r.qid
JOIN StudentRegister s ON r.sid = s.ID;
";
            cmd = new MySqlCommand(str, con);
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gotohome(object sender, EventArgs e)
        {
            Response.Redirect("HomeTeacher.aspx");
        }
    }
}