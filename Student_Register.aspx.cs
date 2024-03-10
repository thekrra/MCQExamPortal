using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MCQExamPortal
{
    public partial class Student_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

          

            try
            {

                // Get connection string from Web.config
                string connectionString = ConfigurationManager.ConnectionStrings["mcqexamConnectionString2"].ConnectionString;

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    // Insert data into the StudentRegister table
                    string insertQuery = @"INSERT INTO StudentRegister (FullName, Email, Password, Phone, Gender, BirthDate, GradYear, University, Major, GPA, City, CVPath, VideoPath, TranscriptPath, PhotoPath)
                                   VALUES (@FullName, @Email, @Password, @Phone, @Gender, @BirthDate, @GradYear, @Major, @University, @GPA, @City, @CVPath, @VideoPath, @TranscriptPath, @PhotoPath)";

                    using (MySqlCommand cmd = new MySqlCommand(insertQuery, connection))
                    {
                        cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);

                        if (male.Checked)
                            cmd.Parameters.AddWithValue("@gender", "Male");
                        else
                            cmd.Parameters.AddWithValue("@gender", "Female");


                        
                        DateTime BirthDate;
                        if (!DateTime.TryParseExact(txtBirthDate.Text, "dd/MM/yyyy",
                            CultureInfo.InvariantCulture, DateTimeStyles.None, out BirthDate))
                        
                            return;
                        
                        else 
                            cmd.Parameters.AddWithValue("@BirthDate", BirthDate);


                        cmd.Parameters.AddWithValue("@City", txtCity.Text);
                        cmd.Parameters.AddWithValue("@University", txtUniversity.Text);
                        cmd.Parameters.AddWithValue("@Major", txtMajor.Text);
                        cmd.Parameters.AddWithValue("@GradYear", txtGrad.Text);
                        cmd.Parameters.AddWithValue("@GPA", txtGPA.Text);

                        // Get file paths


                        string cvPath = SaveFileAndGetPath(fuCV);
                        string videoPath = SaveFileAndGetPath(fuVideo);
                        string transcriptPath = SaveFileAndGetPath(fuTranscript);
                        string photoPath = SaveFileAndGetPath(fuPhoto);

                        // Add parameters for file paths
                        cmd.Parameters.AddWithValue("@CVPath", cvPath);
                        cmd.Parameters.AddWithValue("@VideoPath", videoPath);
                        cmd.Parameters.AddWithValue("@TranscriptPath", transcriptPath);
                        cmd.Parameters.AddWithValue("@PhotoPath", photoPath);

                        cmd.ExecuteNonQuery();
                    }
                }

                Label2.Text = "You’ve registered! <br /> What now? Take a breath and login to do the assessment.";
                Label2.ForeColor = System.Drawing.Color.Green;

                string script = "setTimeout(function() { window.location.href = 'Student_reg_login.aspx'; }, 5000);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectScript", script, true);
            }  
            catch (Exception ex)
            {
                // Handle exceptions (display an error message or log the exception)
                Response.Write($"Error: {ex.Message}");
            }
        }


        
        protected void CustomValidatorGender_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Validate that either the male or female radio button is selected
            args.IsValid = male.Checked || female.Checked;
        }


        private string SaveFileAndGetPath(FileUpload fileUpload)
        {
            if (fileUpload.HasFile)
            {
                // Specify the directory where you want to save the files
                string uploadDirectory = Server.MapPath("~/Upload/");
                string fileName = Guid.NewGuid().ToString() + "_" + fileUpload.FileName;
                string filePath = System.IO.Path.Combine(uploadDirectory, fileName);

                fileUpload.SaveAs(filePath);
                return filePath;
            }

            return null;
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            // Redirect back to the Student_Login.aspx page
            Response.Redirect("Student_reg_login.aspx");
        }
    }
}