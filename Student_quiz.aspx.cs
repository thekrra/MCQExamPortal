using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Image = System.Web.UI.WebControls.Image;

namespace MCQExamPortal
{
    public partial class Student_quiz : System.Web.UI.Page
    {
        MySqlConnection con;
        MySqlCommand cmd;
        String str;
        int quizid = 0;
        DataTable dataTable;
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            int seconds;
            int totalseconds;
            int minutes;
            if (Convert.ToString(Label1.Text) != "")
            {
                Session["timeout"] = int.Parse(Label1.Text);
            }
            else
            {
                if (Session["timeout"] == null)
                {
                    string connString = System.Configuration.ConfigurationManager.ConnectionStrings["mcqexamConnectionString2"].ConnectionString;
                    con = new MySqlConnection(connString);
                    con.Open();
                    str = "select time from quiz where qid='" + quizid + "'";
                    cmd = new MySqlCommand(str, con);
                    seconds = (int)cmd.ExecuteScalar();
                    Session["timeout"] = seconds;
                }
            }
            
            if (int.Parse(Session["timeout"].ToString()) > 0)
            {
                seconds = int.Parse(Session["timeout"].ToString());
                seconds = seconds - 1;
                totalseconds = seconds % 60;
                minutes = seconds / 60;
                Label1.Text = (seconds).ToString();
                Label2.Text = minutes + ":" + totalseconds;
            }
            else
            {
                Timer1.Enabled = false;
                Button1_Click(null, null);
            }
        }

        public void InsertExamStudent(int qid, int sid)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["mcqexamConnectionString2"].ConnectionString;

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                string query = "INSERT INTO exam_student (qid, sid) VALUES (@qid, @sid)";

                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@qid", qid);
                    command.Parameters.AddWithValue("@sid", sid);

                    command.ExecuteNonQuery();
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["username"] == null)
            {
                Session["timeout"] = null;
                Response.Redirect("Default.aspx");
            }
            quizid = Convert.ToInt32(Request.QueryString["qid"].ToString());
            if (!IsPostBack)
            {
                ViewState["CurrentIndex"] = 1;
                BindTextBoxvalues();
                this.Populate();
                InsertExamStudent(quizid, int.Parse(Session["id"].ToString()));
            }

        }
        private void BindTextBoxvalues()
        {
            TextBox1.Text = Convert.ToString(quizid);
        }
        public DataTable SelectData(string query)
        {
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["mcqexamConnectionString2"].ConnectionString;
            con = new MySqlConnection(connString);
            con.Open();
            cmd = new MySqlCommand(query, con);
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }

        private void Populate()
        {
            //Questions
            dataTable = SelectData("select qb.*, c.name AS category_name FROM mcqexam.Question AS qb JOIN category AS c ON qb.cid = c.id where qid='" + quizid + "' ORDER BY RAND() LIMIT 10");
            ViewState["CntQuestion"] = dataTable.Rows.Count;

            Session.Add("dataTable", dataTable);

            double res = 0;
            foreach (DataRow row in dataTable.Rows)
            {
                res += int.Parse(row["marks"].ToString());
            }
            ViewState["FullMarks"] = res;
            res = Math.Round(res / dataTable.Rows.Count);
            lpTopMarkes.Text = res.ToString();

            ViewState["Marks"] = 0;

            DataRow questionRow = dataTable.Rows[0];

            ShowQuestion(questionRow, 0);
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            double res = double.Parse(ViewState["Marks"].ToString()) / double.Parse(ViewState["FullMarks"].ToString());
            res = Math.Round(res * 100);
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["mcqexamConnectionString2"].ConnectionString;
            con = new MySqlConnection(connString);
            con.Open();
            str = "insert into result(qid,marks,sid,Email) values ('" + TextBox1.Text + "','" + res + "','" + Session["id"] + "','" + Session["username"] + "')";
            cmd = new MySqlCommand(str, con);
            cmd.ExecuteNonQuery();
            con.Close();

            Session["timeout"] = null;
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
            "setTimeout(function() { window.location.replace('result.aspx') }, 1000);", true);
        }
        protected void dlQuestion_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void OnRowDataBound(object sender, DataListItemEventArgs e)
        {
            // Assuming 'bytes' is the image data from the database
            var dataItem = e.Item.DataItem as DataRowView;
            if (dataItem != null)
            {
                byte[] bytes = dataItem["image"] as byte[];
                Image imgControl = e.Item.FindControl("Image1") as Image;

                if (bytes != null && bytes.Length > 0)
                {
                    // There is image data
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    imgControl.ImageUrl = "data:image/png;base64," + base64String;

                    // Set the desired width and height for the image
                    imgControl.Width = Unit.Pixel(300); // Adjust the width as needed
                    imgControl.Height = Unit.Pixel(200); // Adjust the height as needed

                    imgControl.Visible = true; // Show the image control
                }
                else
                {
                    // No image data
                    imgControl.Visible = false; // Hide the image control or set to a default image
                }
            }
        }



        protected void btnNext_Click(object sender, EventArgs e)
        {
            int result = 0;
            DataListItem item = dlQuestion.Items[0];
            RadioButton rd_CS = (RadioButton)item.FindControl("rblOptionOne");
            RadioButton rd_CS2 = (RadioButton)item.FindControl("rblOptionTwo");
            RadioButton rd_CS3 = (RadioButton)item.FindControl("rblOptionThree");
            RadioButton rd_CS4 = (RadioButton)item.FindControl("rblOptionFour");
            RadioButton rd_CS5 = (RadioButton)item.FindControl("answer");
            RadioButton rd_CS6 = (RadioButton)item.FindControl("marks");
            if (rd_CS.Checked)
            {
                if (rd_CS.Text == rd_CS5.Text)
                {
                    result = Convert.ToInt32(rd_CS6.Text);
                }
            }
            if (rd_CS2.Checked)
            {
                if (rd_CS2.Text == rd_CS5.Text)
                {
                    result = Convert.ToInt32(rd_CS6.Text);
                }
            }
            if (rd_CS3.Checked)
            {
                if (rd_CS3.Text == rd_CS5.Text)
                {
                    result = Convert.ToInt32(rd_CS6.Text);
                }
            }
            if (rd_CS4.Checked)
            {
                if (rd_CS4.Text == rd_CS5.Text)
                {
                    result = Convert.ToInt32(rd_CS6.Text);
                }
            }
            ViewState["Marks"] = int.Parse(ViewState["Marks"].ToString()) + result;

            int currentIndex = GetCurrentQuestionIndex() + 1;

            ViewState["CurrentIndex"] = currentIndex + 1;

            DataTable dataTable = Session["dataTable"] as DataTable;
            ShowQuestion(dataTable.Rows[currentIndex], currentIndex);

            UpdateNavigationButtons(currentIndex);
        }

        private int GetCurrentQuestionIndex()
        {
            return ViewState["CurrentQuestionIndex"] != null ? (int)ViewState["CurrentQuestionIndex"] : 0;
        }

        private void ShowQuestion(DataRow questionRow, int index)
        {
            DataTable singleRowTable = questionRow.Table.Clone();
            singleRowTable.ImportRow(questionRow);
            dlQuestion.DataSource = singleRowTable;
            dlQuestion.DataBind();

            ViewState["CurrentQuestionIndex"] = index;
        }

        private void UpdateNavigationButtons(int currentIndex)
        {
            int totalQuestions = Convert.ToInt32(ViewState["CntQuestion"]);

            btnNext.Visible = currentIndex < totalQuestions - 1;
            Button1.Visible = !btnNext.Visible;
        }
    }
}
