<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeTeacher.aspx.cs" Inherits="MCQExamPortal.HomeTeacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SBM Academy Admin Home Page</title>
           <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    
    
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
                padding-top: 80px; /* Add more than the height of your fixed header to account for it */

        }
        .header-panel {
            background-color: #0787C6; /* Adjusted to match the header color theme */
  color: white;
  padding: 20px;
  text-align: center;
      margin-top: 2%; /* This should be equal to or greater than the height of your fixed header */


        }
        .header-panel h1 {
            margin: 0;
        }
        .header-panel .sub-header {
            font-size: 1.2rem;
        }
        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .app-button {
            background-color: #0787C6;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 10px 0;
            cursor: pointer;
            width: 200px; /* Adjust width as needed */
            border-radius: 5px;
            font-size: 1rem;
        }
        .app-button:hover {
            background-color: #045e8a;
        }
        .logout-button {
            margin-top: 30px;
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

     
    </style>
</head>
<body>

    <div class="fixed-header">
    <img src="images/logo.jpg" alt="SBM Logo" class="logo">

</div>

    <form id="form1" runat="server">
        <div class="header-panel">
            <h1>SBM Online Academy</h1>
            <div class="sub-header">Admin Home Page</div>
        </div>

        <div class="button-container">
            <asp:Button ID="Button4" runat="server" Text="Add Admin Account" CssClass="app-button" OnClick="Button2_Click" />
            <asp:Button ID="Button2" runat="server" Text="Question Bank" CssClass="app-button" OnClick="Button1_Click" />
            <asp:Button ID="Button3" runat="server" Text="Manage Quizes" CssClass="app-button" OnClick="Button3_Click" />
            <asp:Button ID="Button8" runat="server" Text="Students Results" CssClass="app-button" OnClick="Button4_Click" />
            <asp:Button ID="Button9" runat="server" Text="Add Category To Quiz" CssClass="app-button" OnClick="Button5_Click" />
            <asp:Button ID="Button6" runat="server" Text="Logout" CssClass="app-button logout-button" OnClick="Button6_Click" />
        </div>
    </form>
</body>
</html>
