<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_main.aspx.cs" Inherits="MCQExamPortal.Student_main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SBM Academy Home Page</title>


    
    

    <style>

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
        body {
            font-family: Arial, sans-serif;
        }
        .header {
            background-color: #0787C6;
            color: White;
            text-align: center;
            padding: 20px;
            font-size: 24px;
            font-weight: bold;
                margin-top: 9%; /* This should be equal to or greater than the height of your fixed header */

        }
        .center-content {
            text-align: center;
            margin: 20px 0;
           
        }
        .logout-btn {
            background-color: White;
            color: #0787C6;
            padding: 10px 20px;
            border: 2px solid #0787C6;
            cursor: pointer;
            font-size: 16px;
        }
        .logout-btn:hover {
            background-color: #0787C6;
            color: White;
        }
        .grid-view {
            margin: auto;
            width: 90%;
            border-collapse: collapse;
        }
        .grid-view th {
            background-color: #0787C6;
            color: White;
            padding: 10px;
        }
        .grid-view td, .grid-view th {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .grid-view tr:nth-child(even){background-color: #f2f2f2;}
        .grid-view tr:hover {background-color: #ddd;}
        .take-quiz-btn {
            padding: 3% 5%;
            background-color: #0787C6;
            color: white;
            border: none;
            cursor: pointer;
            width: 40%;
        }
        .take-quiz-btn:hover {
            opacity: 0.8;
        }

    #lblMessage {
        width: 100%;
        text-align: center;
        padding: 10px 0;
        background-color: #f2f2f2;
        color: #333;
        font-size: 16px;
        border: 1px solid #ddd;
        margin-top: 20px;
    }

    </style>
</head>
<body>

    <div class="fixed-header">
    <img src="images/sbmacademylogo.png" alt="SBM Logo" class="logo">

</div>

    <form id="form1" runat="server">
        <div class="header">
            Welcome to SBM online Academy
        </div>
        <div class="center-content">
            <asp:Button ID="Button1" runat="server" CssClass="logout-btn" OnClick="Button1_Click" Text="Logout" />

        </div>

        <div class="center-content">
                            <asp:Label ID="lblMessage" runat="server" Text="" Visible="false"></asp:Label>

         <asp:GridView ID="GridView1" CssClass="grid-view" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand">

             <Columns>

        <asp:BoundField DataField="qid" HeaderText="" Visible="false" />
        <asp:BoundField DataField="name" HeaderText="Quiz Name" Visible="True" />
        <asp:BoundField DataField="time" HeaderText="" Visible="false" />
        <asp:BoundField DataField="marks" HeaderText="" Visible="false" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnEdit" runat="server" CssClass="take-quiz-btn" Text="Start Assesment"  CommandName="EditButton" CommandArgument='<%# Eval("qid") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>

</asp:GridView>


        </div>

    </form>

</body>
</html>
