﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Teacher.aspx.cs" Inherits="MCQExamPortal.Add_Teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Admin Account</title>
        <link rel="stylesheet" href="style.css">

    
   
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .header {
            background-color: #0787C6; /* Adjusted to match the header color theme */
            color: white;
            padding: 20px;
            text-align: center;
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


        .content {
            text-align: center;
            padding: 20px;
        }

        .content table {
            margin: auto;
            border-collapse: collapse;
        }

        .content table td {
            padding: 10px;
        }

        .content input[type="text"], .content input[type="password"], .content select {
            width: 90%;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            border: 1px solid #0787C6; /* Consistent border color */
            color: #333; /* Text color for better readability */
        }

        .styled-button {
            background-color: #0787C6; /* Consistent button background color */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .styled-button:hover {
            background-color: #045e8a; /* Darker shade on hover */
        }

        .grid-view {
            color: #333; /* Ensuring readable text color */
            border-color: #0787C6; /* Consistent border color */
        }
    </style>
</head>
<body>

    <div class="fixed-header">
    <img src="images/sbmacademylogo.png" alt="SBM Logo" class="logo">
      <button onclick="history.back()" class="back-button"><i ></i></button>
</div>

    <form id="form1" runat="server">
        <div class="header">
            <asp:Label ID="Label1" runat="server" Text="SBM Academy - Add New Admin Account" Font-Size="X-Large" ForeColor="White"></asp:Label>
        </div>
        <div class="content">
            <table>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="temail" runat="server" CssClass="input-field"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="tpass" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="Add" runat="server" Text="Add Account" CssClass="styled-button" OnClick="Add_Student"></asp:Button>
            <br />
            <asp:Label ID="Label4" runat="server"></asp:Label>
            <br />            <br />

            <asp:Button ID="Button1" runat="server" Text="Home" CssClass="styled-button" OnClick="gotohome" Style="width: 250px;"></asp:Button>
        </div>
    </form>
</body>
</html>
