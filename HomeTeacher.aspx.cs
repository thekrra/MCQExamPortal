using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MCQExamPortal
{
    public partial class HomeTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["temail"] != null && Session["id"] != null)
                {
                    // Session variables exist, retrieve them
                    string teacherEmail = Session["temail"].ToString();
                    string teacherId = Session["id"].ToString();


                }
                else
                {
                    // Session variables do not exist, redirect back to login page or show error
                    Response.Redirect("Teacher_login.aspx");
                }
            }
        }



     

  

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Questions.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create_Quiz.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Result_Teacher.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Response.Redirect("Add_Teacher.aspx");

        }
        protected void Button5_Click(object sender, EventArgs e)
        {

            Response.Redirect("Add_Category.aspx");

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}