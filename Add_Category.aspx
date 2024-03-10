<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Category.aspx.cs" Inherits="MCQExamPortal.Add_Category" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Category to Quiz</title>
        <link rel="stylesheet" href="style.css">


    
    <style>


        .panel-label {

                     background-color: #0787C6;
         color: white;
         padding: 10px;
         text-align: center;
         font-size: 24px;
         font-weight: bold;
         margin-bottom: 20px;
         margin-top: 9%;
        }

        .fixed-header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #ffffff;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            display: flex;
            justify-content: center;
            padding: 10px 0;
            align-items: center;
        }

 

.logo {
    width: 40%; /* Adjust logo width */
    height: auto;
}


        </style>

</head>
<body>

        
<div class="fixed-header">
    <img src="images/sbmacademylogo.png" alt="SBM Logo" class="logo">
    <button onclick="history.back()" class="back-button"><i ></i></button>


</div>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       
        <div class="panel-label">
        <asp:Panel ID="Panel1" runat="server" server="">
            <center>
                <asp:Label ID="Label1" runat="server" Text="Online Examination System"></asp:Label>
            </center>
            <center>
                <asp:Label runat="server" Text="Add Category" Font-Size="Large" ForeColor="White"></asp:Label>
            </center>
        </asp:Panel>
        </div>

        <center>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <h2>Add New Category</h2>
                    <asp:TextBox ID="txtCategoryName" runat="server" placeholder="Category Name"></asp:TextBox>
                    <asp:Button ID="btnAddCategory" runat="server" Text="Add" OnClick="btnAddCategory_Click" />
                    <hr />
                    <h2>Category List</h2>
                    <asp:GridView ID="gvCategories" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowEditing="gvCategories_RowEditing" OnRowCancelingEdit="gvCategories_RowCancelingEdit" OnRowUpdating="gvCategories_RowUpdating" OnRowDeleting="gvCategories_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="true" />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Edit" CancelText="Cancel" UpdateText="Update" />
                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Delete" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </center>
    </form>
</body>
</html>
