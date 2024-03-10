<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_reg_login.aspx.cs" Inherits="MCQExamPortal.Student_reg_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Log in</title>
    




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

    .small-font {
    font-size: 14px;  Adjust the size as needed */
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
    width: 40%; /* Adjust logo width */
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


.back-button {
    position: absolute;
    left: 10px; /* Adjust as needed */
    top: 50%;
    transform: translateY(-50%); /* Center button vertically */
    width: 30px; /* Width of the arrow */
    height: 30px; /* Height of the arrow */
    background-color: transparent;
    border: none;
    cursor: pointer;
}

    .back-button::before {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        border: solid #000;
        border-width: 0 2px 2px 0;
        display: inline-block;
        padding: 3px;
        transform: translate(-50%, -50%) rotate(135deg);
        -webkit-transform: translate(-50%, -50%) rotate(135deg);
    }


    </style>

</head>

    
<body>

    
    
<div class="fixed-header">

    <img src="images/sbmacademylogo.png" alt="SBM Logo" class="logo">
<button onclick="history.back()" class="back-button"><i ></i></button>

</div>

<div class="content">
            <center>
                <asp:Label ID="Label1" runat="server" BackColor="#0787C6" BorderStyle="None" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Height="10%" Text="Sign In" Width="100%"></asp:Label></center>
        </div>

    
        <center>
           <div id="loginForm">
            <form id="form1" runat="server">
                <h2>Please sign in to contuinue</h2>

            <div class="form-group">

            <p>
                <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </p>

            <p>
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
               
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
            </p>
                <center>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="login-button" Text="Login" />

            <asp:LinkButton ID="LinkButton1" PostBackUrl="~/Student_Register.aspx" runat="server" CssClass="small-font"> New student? click here to register</asp:LinkButton>
                            </center>

                <asp:Label ID="Label4" runat="server"></asp:Label>     

                
                    </form>

                </div>
        </center>

</body>
</html>
