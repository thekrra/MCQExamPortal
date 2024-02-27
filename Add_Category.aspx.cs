using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MCQExamPortal
{
    public partial class Add_Category : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mcqexamConnectionString2"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["temail"] == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            string categoryName = txtCategoryName.Text.Trim();
            if (!string.IsNullOrEmpty(categoryName))
            {
                InsertCategory(categoryName);
                txtCategoryName.Text = string.Empty;
                BindGridView();
            }
        }

        protected void gvCategories_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategories.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void gvCategories_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategories.EditIndex = -1;
            BindGridView();
        }

        protected void gvCategories_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvCategories.Rows[e.RowIndex];
            int id = Convert.ToInt32(gvCategories.DataKeys[e.RowIndex].Value);
            string name = (row.FindControl("ctl00") as TextBox).Text.Trim();
            UpdateCategory(id, name);
            gvCategories.EditIndex = -1;
            BindGridView();
        }

        protected void gvCategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvCategories.DataKeys[e.RowIndex].Value);
            DeleteCategory(id);
            BindGridView();
        }

        private void BindGridView()
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                MySqlCommand cmd = new MySqlCommand("SELECT * FROM category", connection);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvCategories.DataSource = dt;
                gvCategories.DataBind();
            }
        }

        private void InsertCategory(string categoryName)
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                MySqlCommand cmd = new MySqlCommand("INSERT INTO category (Name) VALUES (@Name)", connection);
                cmd.Parameters.AddWithValue("@Name", categoryName);
                connection.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void UpdateCategory(int id, string name)
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                MySqlCommand cmd = new MySqlCommand("UPDATE category SET Name = @Name WHERE id = @Id", connection);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Id", id);
                connection.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void DeleteCategory(int id)
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                MySqlCommand cmd = new MySqlCommand("DELETE FROM category WHERE id = @Id", connection);
                cmd.Parameters.AddWithValue("@Id", id);
                connection.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}