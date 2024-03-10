<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create_Quiz.aspx.cs" Inherits="MCQExamPortal.Create_Quiz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create New Quiz</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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

        .panel-heading {
            background-color: #0787C6;
            color: white;
            padding: 2%;
            margin-top: 9%;
        }

        .form-control {
            width: 90%;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            border: 1px solid #0787C6;
            color: #333;
        }

        .styled-button {
            background-color: #0787C6;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .styled-button:hover {
            background-color: #045e8a;
        }

        .grid-view {
            color: #333;
            border-color: #0787C6;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="fixed-header">
            <img src="images/sbmacademylogo.png" alt="SBM Logo" class="logo"/>
            <button onclick="history.back()" class="back-button"><i ></i></button>

        </div>
        
        <div>
            <asp:Panel ID="Panel1" runat="server" CssClass="panel-heading" Height="30%" Width="100%">
                <center>
                    <asp:Label ID="Label1" runat="server" Text="Online Examination System" ForeColor="White" Font-Size="XX-Large" Height="20%" Width="100%"></asp:Label>
                </center>
                <center>
                    <asp:Label runat="server" Text="Manage Quiz" Font-Size="X-Large" ForeColor="White"></asp:Label>
                </center>
            </asp:Panel>
            <br />
            <br />
        </div>

        <center>
            <table class="auto-style4">
                <tr>
                    <td class="auto-style3">Quiz Name</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="quizname" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Time (in sec)</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="qt" runat="server" CssClass="form-control" OnTextChanged="qt_TextChanged"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Marks</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="qmarks" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Create Quiz" CssClass="styled-button" OnClick="Add_quiz" Width="208" Height="53"></asp:Button>
            <br />
            <asp:Label ID="Label4" runat="server"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" HeaderStyle-BackColor="#0787C6" HeaderStyle-ForeColor="White" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand" Height="125" Width="962" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="qid" HeaderText="Id" />
                    <asp:BoundField DataField="name" HeaderText="Name" />
                    <asp:BoundField DataField="cnt" HeaderText="Count Quetions" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Width="50%" CssClass="styled-button" Text="Edit/Delete" CommandName="EditButton" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center>
        <br />
        <br />
        <center>
            <asp:Button ID="Button5" runat="server" Text="Home" CssClass="styled-button" OnClick="Button5_Click" Width="229" Height="50" />
        </center>
    </form>
</body>
</html>
