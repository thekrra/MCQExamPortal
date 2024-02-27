<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="result.aspx.cs" Inherits="MCQExamPortal.result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank you for taking the exam</title>
            <link rel="stylesheet" href="style.css">

      

      <style>
    body {
        background-image: url('images/sbmweb-img.png');
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
        margin: 0;
        padding: 0;
        height: 100vh; /* Make sure the body takes full viewport height */
        display: flex;
        justify-content: center;
        align-items: center; /* Center the form box vertically and horizontally */
    }

    .form-box {
        background-color: white; /* White background for the form box */
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add some shadow for depth */
        text-align: center;
        max-width: 400px; /* Adjust based on your preference */
        width: 100%; /* Make sure it doesn't exceed the viewport width */
    }

    .check-mark {
        width: 50px; /* Adjust this based on your needs */
        height: auto;
        margin-bottom: 20px;
    }

    /* Add some styles to the paragraph to improve legibility */
    .form-box p {
        font-size: 16px; /* Adjust based on your needs */
        color: #333; /* Dark text for better readability */
        margin-top: 20px;
    }

    /* Adjustments for the fixed header if needed */
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


    .label-custom {
    display: inline-block; /* Or 'block' depending on your layout needs */
    background-color: #0787C6;
    padding: 15px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
    max-width: 93%; /* Adjust as needed */
    width: 100%; /* This might be ignored for inline elements */
    margin: auto; /* Center if block */
    font-size: 16px; /* Example font size */
    color: white; /* Text color */
}

 

    </style>
</head>
<body>

            <div class="fixed-header">
       <img src="images/logo.jpg" alt="SBM Logo" class="logo">
            </div>

    <form id="form1" runat="server">



        <div>
            <center>
                <asp:Label ID="Label4" runat="server" Cssclass="label-custom" Text="Thank you!" ></asp:Label></center>
        </div>    
        
        
<div class="form-box">
    <img src="images/green-check.png" alt="Success" class="check-mark"/>
    <p>Thank you for taking the exam and we will get back to you soon.</p>
</div>
        
    </form>
</body>
</html>
