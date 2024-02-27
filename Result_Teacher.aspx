<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result_Teacher.aspx.cs" Inherits="MCQExamPortal.Result_Teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Students Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9; /* Background color */
            margin: 0;
            padding: 0;
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
    width: 8%; /* Adjust logo width */
    height: auto;
}
        .container {
            margin: 0 auto;
            max-width: 800px; /* Adjust container width */
            padding: 20px;
        }
        .panel-header {
            background-color: #0787C6;
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            margin-top: 9%;
        }
        .button {
            background-color: #0787C6;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            display: inline-block;
            margin: 10px 0;
            cursor: pointer;
            border-radius: 4px;
        }
        .button:hover {
            background-color: #045e8a;
        }
        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .grid-view th, .grid-view td {
            padding: 8px;
            text-align: left;
            border: 1px solid #0787C6;
        }
        .grid-view th {
            background-color: #0787C6;
            color: white;
        }
    </style>
</head>
<body>
    <div class="fixed-header">
        <img src="images/logo.jpg" alt="SBM Logo" class="logo">
    </div>
    <div class="container">
        <div class="panel-header">Students Results</div>
        <form id="form1" runat="server">
            <div>
                <asp:GridView ID="GridView1" runat="server" CssClass="grid-view" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                </asp:GridView>
            </div>
            <center>
                <asp:Button ID="Button1" runat="server" Text="Home" CssClass="button" OnClick="gotohome"></asp:Button>
            </center>
        </form>
    </div>
</body>
</html>
