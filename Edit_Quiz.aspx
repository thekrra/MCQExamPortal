<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit_Quiz.aspx.cs" Inherits="MCQExamPortal.Edit_Quiz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Quiz Page</title>
    <style type="text/css">

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
    width: 8%; /* Adjust logo width */
    height: auto;
}

        .auto-style1 {
            margin-left: 40px;
        }
        .center-text {
            text-align: center;
        }
        .top-margin {
            margin-top: 20px;
        }
        table {
            margin: auto; /* Center table */
        }
        .header-panel {
            background-color: #0787C6; /* Ensure this matches the theme of Add_teacher.aspx */
            border-style: none;
            height: 100px;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: 9%;
        }
        .header-panel label {
            display: block; /* Make labels stack vertically */
        }
        .content-section {
            margin: 20px 0;
        }
        .delete-btn {
            background-color: #a70f0f !important;
            color: white; /* Match the button text color */
            padding: 10px 15px; /* Adjust padding to match button size */
            border: none; /* Adjust or add as necessary */
            cursor: pointer;
            border-radius: 5px; /* Optional, for rounded corners */

        }
        .delete-btn:hover {
      background-color: #870b0b !important;
        }
        /* Ensure button styles match those on Add_teacher.aspx */
        input[type="submit"], input[type="button"] {
            background-color: #0787C6; /* Match the button background color */
            color: white; /* Match the button text color */
            padding: 10px 15px; /* Adjust padding to match button size */
            border: none; /* Adjust or add as necessary */
            cursor: pointer;
            border-radius: 5px; /* Optional, for rounded corners */
        }

        input[type="submit"]:hover, input[type="button"]:hover {
    background-color: #045e8a; /* Darker shade for hover effect */
}
        /* Ensure input field styles match those on Add_teacher.aspx */
        input[type="text"], select, textarea {
            width: 260px; /* Adjust width as necessary */
            padding: 10px; /* Adjust padding to match */
            margin: 10px 0; /* Adjust margin to match */
            display: inline-block;
            border: 1px solid #ccc; /* Adjust border color and width as necessary */
            border-radius: 4px; /* Rounded corners for inputs */
            box-sizing: border-box; /* Adjust box-sizing if necessary */
        }



        .buttons-align {
    text-align: center ;
    margin-top: 20px ;
    justify-content: center; /* Center the content for block-level elements */
    flex-direction: column ; /* Stack the buttons vertically */
    align-items: center; /* Center-align the items horizontally */
}


    </style>
</head>
<body>

    <div class="fixed-header">
    <img src="images/logo.jpg" alt="SBM Logo" class="logo">
</div>
    <form id="form1" runat="server">
       
        <div class="header-panel">
            <label id="Label1" runat="server" style="font-size: XX-Large;">Online Examination System</label>
            <label runat="server" style="font-size: X-Large;">Manage Quiz</label>
        </div>
        <div class="content-section center-text">
            <div>About Quiz</div>
                <br />
                <asp:GridView ID="GridView1" runat="server" AlternatingRowStyle-BackColor="Silver" ForeColor="White" BorderStyle="Solid" BorderColor="White" BackColor="#0787C6" HeaderStyle-HorizontalAlign="Center" HorizontalAlign="Center" Width="531px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"></asp:GridView>



            <div class="top-margin">Questions in current Quiz</div>




                <br />
                <asp:GridView ID="GridView2" HeaderStyle-BackColor="#0787C6" HeaderStyle-ForeColor="White" runat="server" OnRowDataBound="OnRowDataBound" AutoGenerateColumns="false" OnRowCommand="GridView2_RowCommand" Height="125px" Width="962px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="queid" HeaderText="Question Id" />
                        <asp:BoundField DataField="que_desc" HeaderText="Question Description" />
                        <asp:BoundField DataField="que_img" HeaderText="Question Image" Visible="false" />
                        <asp:BoundField DataField="opt1" HeaderText="Option 1" />
                        <asp:BoundField DataField="opt2" HeaderText="Option 2" />
                        <asp:BoundField DataField="opt3" HeaderText="Option 3" />
                        <asp:BoundField DataField="opt4" HeaderText="Option 4" />
                        <asp:BoundField DataField="ans" HeaderText="answer" />
                        <asp:BoundField DataField="marks" HeaderText="marks" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="80" Width="80" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Width="100" Text="REMOVE" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Category Name" DataField="category_name" />
                    </Columns>
                </asp:GridView>
                <asp:Label ID="Label4" runat="server"></asp:Label>
                <br />
            <div class="top-margin">Fill the following details to add new question in current quiz</div>
                <table>

                                        <tr>
                        <td>Choose Category</td>
                       <td><asp:DropDownList ID="ddlCategories" ForeColor="#0787C6" BorderColor="#0787C6" runat="server" Width="261px"></asp:DropDownList>
                           </td>
                    </tr>

                    <tr>
                        <td>Question Description</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="que" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" Style="margin-left: 8px;" Width="261px"></asp:TextBox></td>

                    </tr>

                    <tr>
                        <td>Option 1</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="opt1" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" Width="257px"></asp:TextBox></td>

                    </tr>
                    <tr>

                        <td>Option 2</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="opt2" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" Width="250px" CssClass="auto-style2"></asp:TextBox></td>

                    </tr>
                    <tr>
                        <td>Option 3</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="opt3" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" Width="251px"></asp:TextBox></td>

                    </tr>
                    <tr>
                        <td>Option 4</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="opt4" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" Width="246px"></asp:TextBox></td>

                    </tr>
                    <tr>
                        <td>Marks</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="marks" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" Width="246px"></asp:TextBox></td>

                    </tr>
                    <tr>
                        <td>Correct Answer</td>
                        <td class="auto-style1">
                            <asp:TextBox ID="ans" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" Width="246px" OnTextChanged="ans_TextChanged"></asp:TextBox></td>

                    </tr>

                    <tr>
                        <td>Image</td>
                        <td class="auto-style1">
                            <asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>
                        </td>

                    </tr>

                </table>
                <br />
                <br />

            <asp:Button ID="Add" runat="server" Text="Add Question" BackColor="#0787C6" ForeColor="White" BorderStyle="Solid" OnClick="Add_que" Width="138px"></asp:Button>
                <br />
                <br />
                        <div class="top-margin">Questions from Question Bank</div>

<asp:GridView ID="GridView3" HeaderStyle-BackColor="#0787C6" HeaderStyle-ForeColor="White" runat="server" OnRowDataBound="OnRowDataBound" AutoGenerateColumns="false" OnRowCommand="GridView3_RowCommand" Height="125px" Width="962px" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="queeid" HeaderText="Question Id" />
                        <asp:BoundField DataField="quee_desc" HeaderText="Question Description" />
                        <asp:BoundField DataField="quee_img" HeaderText="Question Image" Visible="false" />
                        <asp:BoundField DataField="optt1" HeaderText="Option 1" />
                        <asp:BoundField DataField="optt2" HeaderText="Option 2" />
                        <asp:BoundField DataField="optt3" HeaderText="Option 3" />
                        <asp:BoundField DataField="optt4" HeaderText="Option 4" />
                        <asp:BoundField DataField="anss" HeaderText="answer" />
                        <asp:BoundField DataField="markss" HeaderText="marks" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="80" Width="80" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server"  Text="ADD" CommandName="AddButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Category Name" DataField="category_name" />
                    </Columns>
                </asp:GridView>
                <asp:Label ID="Label10" runat="server"></asp:Label>
                <asp:Label ID="Label11" runat="server"></asp:Label>
                <br />

            </div>
           <div class="buttons-align">
                <asp:Button ID="Button2" runat="server" Text="Delete Quiz" OnClick="Delete_Quiz" Width="20%" CssClass="delete-btn"></asp:Button>
                <p>
                    <asp:Button ID="Button1" runat="server" Text="Home" OnClick="gotohome" Width="20%"></asp:Button>
                </p>
            </div>
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <asp:Label ID="Label3" runat="server"></asp:Label>
        <asp:Label ID="Label5" runat="server"></asp:Label>
        <asp:Label ID="Label7" runat="server"></asp:Label>
        <asp:Label ID="Label8" runat="server"></asp:Label>
        <asp:Label ID="Label9" runat="server"></asp:Label>
        <asp:Label ID="Label6" runat="server"></asp:Label>
    </form>
</body>
</html>
