<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teacher_login.aspx.cs" Inherits="MCQExamPortal.Teacher_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>

     <link rel="stylesheet" href="style.css">

        
    <style> 

                .login-button {
    background-color: #0787C6; /* Green background */
    border: none; /* No borders */
    color: white; /* White text */
    padding: 10px 20px; /* Top and bottom padding, Left and right padding */
    text-align: center; /* Centered text */
    text-decoration: none; /* No underlines */
    display: inline-block; /* Allows setting dimensions */
    font-size: 16px; /* Larger font size */
    margin: 4px 2px; /* Some margin */
    cursor: pointer; /* Pointer/hand icon */
    border-radius: 5px; /* Rounded corners */
    box-sizing: border-box
}

    .login-button:hover {
        background-color: #045e8a;
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

        
.content {
    margin-top: 9%; /* This should be equal to or greater than the height of your fixed header */
}

.logo {
    width: 8%; /* Adjust logo width */
    height: auto;
}

     

/* make all text boxes and password boxes fill to screen*/
input[type=text], input[type=password] {
    width: 100%; /* or any other percentage */
    padding: 5px;
    box-sizing: border-box; /* Ensures padding does not add to the width */
    height: 25px; /* Your desired width */
    /* Other styles */
}

        
#loginForm {
            display: inline-block;
            text-align: left;
            gap: 10%;
    padding-left: 20vw; /* Responsive padding based on viewport width */
    padding-right: 20vw; /* Responsive padding based on viewport width */
        }

            #Label4 {
        display: block; /* Ensure it's block to fill width */
        text-align: center; /* Center the text */
        background-color: #0787C6;
        color: white;
        font-size: 24px;
        padding: 20px;
        margin-bottom: 20px; /* Space below the header */
    }

    </style>
</head>
<body>

    <div class="fixed-header">
    <img src="images/logo.jpg" alt="SBM Logo" class="logo">

</div>


    <div class="content">
            <center>
                <asp:Label ID="Label4" runat="server" Text="Sign In"></asp:Label></center>
        </div>
           
        <center>
           <div id="loginForm">
            <form id="form2" runat="server">
                <h2>Please sign in to contuinue</h2>

            <div class="form-group">

            <p>
                <asp:Label ID="label1" runat="server" Text="Admin Email"></asp:Label>
            <asp:TextBox ID="temail" runat="server"></asp:TextBox>
            </p>

            <p>
                <asp:Label ID="label2" runat="server" Text="Password"></asp:Label>
               
            <asp:TextBox ID="tpass" TextMode="Password" runat="server"></asp:TextBox>
            </p>

           <center> <asp:Button ID="Button3" runat="server" OnClick="Button2_Click" CssClass="login-button" Text="Login" />
                 </center>

</div>
                </form>
</div>
                    </center>

</body>
</html>
