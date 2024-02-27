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
    public partial class Teacher_login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gotohome(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            MySqlConnection con;
            MySqlCommand cmd;
            String str;
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["mcqexamConnectionString2"].ConnectionString;
            con = new MySqlConnection(connString);
            con.Open();
            // Adjust the SQL query to select based on email and password
            str = "SELECT * FROM mcqexam.teacher WHERE temail=@temail AND tpass=@tpass";
            cmd = new MySqlCommand(str, con);
            // Use parameters to prevent SQL injection
            cmd.Parameters.AddWithValue("@temail", temail.Text.Trim());
            cmd.Parameters.AddWithValue("@tpass", tpass.Text.Trim());

            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                // User found, set session variables or perform actions as needed
                foreach (DataRow dr in dt.Rows)
                {
                    Session["temail"] = dr["temail"].ToString();
                    Session["id"] = dr["id"];
                    Response.Redirect("HomeTeacher.aspx");
                }
            }
            else
            {
                // No user found with these credentials
                Response.Write("<script>alert('Invalid email or password')</script>");
            }
            con.Close();
        }

    }
}