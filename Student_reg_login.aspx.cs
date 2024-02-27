using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MCQExamPortal
{
    public partial class Student_reg_login : System.Web.UI.Page
    {
        MySqlConnection con;
        MySqlCommand cmd;
        String str;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["mcqexamConnectionString2"].ConnectionString;
            con = new MySqlConnection(connString);
            con.Open();
            str = "select * from StudentRegister where Email='" + txtEmail.Text + "' and Password='" + txtPassword.Text + "'";
            cmd = new MySqlCommand(str, con);
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                Session["username"] = dr["Email"].ToString();
                Session["id"] = dr["ID"];
                Response.Redirect("Student_main.aspx");
            }
            con.Close();
            Label4.Text = "Invalid Email or Password";
            Label4.ForeColor = System.Drawing.Color.Red;


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}