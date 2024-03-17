<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MCQExamPortal.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SBM Academy Home Page</title>


    
  

    <style>

        
.logo {
    width: 40%; /* Adjust logo width */
    height: auto;
}

        /* Choose User button */
.user-button {
    background-color: rgba(7, 135, 198, 0.7); /* Blue with transparency */
    border: none; /* No borders */
    color: white; /* White text */
    padding: 10px 20px; /* Top and bottom padding, Left and right padding */
    text-align: center; /* Centered text */
    text-decoration: none; /* No underlines */
    display: inline-block; /* Allows setting dimensions */
    font-size: 16px; /* Larger font size */
    margin: 4px 2px; /* Some margin */
    cursor: pointer; /* Pointer/hand icon */
    border-radius: 8px; /* Rounded corners */
    box-sizing: border-box;
    width: 30%; /* Adjust as needed */
}

    .user-button:hover {
        background-color: #0787C6; /* Button becomes blue on hover */
        color: white; /* Text color changes to white on hover */
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


#bgPicture {
  position: fixed; /* Fixed or absolute positioning */
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin-top: 5%;
  width: 100%; 
  height: 100%;
  z-index: -100; /* Keep the image behind other elements */
  background: url('images/thumbnail.png') no-repeat center center;
background-size: 100% 50%; /* Full width, 50% of the element's height */
  overflow: hidden;
}


#bgPicture img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* This will cover the div without stretching the image */
}


body, html {
    height: 100%;
    margin: 0;
    padding: 0;

}
.left-panel {
    position: fixed;
    left: 0;
    top: 0;
    width: 25%; /* Adjust width as needed */
    height: 100%;
    background: linear-gradient(to bottom, #ffffff 0%, #f2f2f2 100%); /* subtle gradient */
    box-shadow: 2px 0px 5px rgba(0,0,0,0.1); /* soft shadow for depth */
    z-index: 1;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center; /* Center-align the items vertically */
    overflow-y: auto; /* Makes the panel scrollable if content exceeds screen height */
}

 #about-section {
            z-index: 2; /* Ensure the about section is visible above the white panel */
            position: fixed; /* Use fixed to position relative to the viewport */
            left: 20px;
            top: 20px; /* Adjust as needed */
            width: 23%; /* Adjust the width to fit within the left panel */
            color: #333; /* Color for visibility against the white background */
        }

#about-section h2 {
    margin-top: 0; /* Adjusts spacing at the top of the panel */
    font-size: 24px;
    color: #333; /* Dark color for readability */
    padding-bottom: 10px;
    border-bottom: 1px solid #dcdcdc; /* Adds a subtle line to separate the title */
}

#about-section p {
    font-size: 12px;
    color: #666; /* Slightly lighter color for the text */
    text-align: justify; /* Justifies the text for a cleaner look */
    line-height: 1.6; /* Improves readability */
}


    </style>
</head>
<body>

       <div class="fixed-header">
       <img src="images/sbmacademylogo.png" alt="SBM Logo" class="logo"/>
   </div>

<div class="content">
    <center>
        <asp:Label ID="Label1" runat="server" BackColor="#0787C6" BorderStyle="None" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Text="معسكرات تكنلوجيا الأعمال" Width="100%" style="position: relative; z-index: 3;"></asp:Label>
    </center>
</div>
   


  <!-- White panel on the left -->
    <div class="left-panel"></div>

    <!-- About Section -->
    <div id="about-section">
          <br /><br /><br /><br /><br /><br /><br />

        <h2>About Business Technology Programs</h2>
        <p>The Business Technology Solutions Talent Capacity Building Program is a unique, specialized Digital/Technology program, designed to the highest standards, which allows trainees to learn from leading experts in the field and begin a long, rewarding career. It includes individual guidance and counseling and follow-ups to maximize learning and retention, as well as additional courses in general and personal skills.

It aims to help young Saudis to achieve excellence in the field of different Technologies with a view to joining SBM, one of Saudi Arabia’s leading Communications and Information Technology sector companies, experience a uniquely stimulating and challenging environment, and begin their success story with distinction!</p>
    </div>
    <form id="form1" runat="server">
     
 
            
            <br /><br />

    
     
                <p>
            <center>
            <asp:Button ID="Button3" runat="server" CssClass="user-button" OnClick="Button3_Click" Text="Click here to Login as Student" /></center>
        </p>

           <p>
       <center>
       <asp:Button ID="Button2" runat="server"  CssClass="user-button" OnClick="Button2_Click" Text="Click here to Login as Admin"/></center>
   </p>

    </form>
</body>
</html>
