<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Register.aspx.cs" Inherits="MCQExamPortal.Student_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="scripts/jquery-3.7.1.min.map" type="text/javascript"></script>

    <title>Student Registration</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>




    <style>




     

input[type=text], input[type=password] {
    width: 100%; 
    padding: 5px;
    box-sizing: border-box; 
    height: 25px;
}

        #formContainer {
            display: inline-block;
            text-align: left;
            gap: 10%;
            padding-left: 20vw;
            padding-right: 20vw;
        }

   

        .error-message {
    color: #D8000C; /* Bright red color for text */
    background-color: #FFD2D2; /* Light red/pink background */
    border: 1px solid #D8000C; /* Red border */
    margin: 10px 0; /* Add some margin above and below the message */
    padding: 5px; /* Add padding inside the box */
    border-radius: 5px; /* Slightly rounded corners for a modern look */
    font-family: Arial, sans-serif; /* Use a standard, readable font */
    text-align: center; /* Center the text */
    font-size: 10px;
    width: 50%;
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

        
    .submit-button {
    background-color: #0787C6; /* Green background */
    border: none; /* No borders */
    color: white; /* White text */
    padding: 10px 20px; /* Top and bottom padding, Left and right padding */
    text-align: center; /* Centered text */
    text-decoration: none; /* No underlines */
    display: inline-block; /* Allows setting dimensions */
    font-size: 14px; /* Larger font size */
    margin: 4px 2px; /* Some margin */
    cursor: pointer; /* Pointer/hand icon */
    border-radius: 5px; /* Rounded corners */
    box-sizing: border-box;
    width: 80%;
}

    .submit-button:hover {
        background-color: #045e8a;
    }


    </style>
</head>

<body>
     <div class="fixed-header">
     <img src="images/sbmacademylogo.png" alt="SBM Logo" class="logo"/>
         <button onclick="history.back()" class="back-button"><i ></i></button>
         </div>

<div class="content">
        <center>
            <asp:Label ID="Label1" runat="server" BackColor="#0787C6" BorderStyle="None" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" Height="10%" Text="Student Registeration" Width="100%"></asp:Label></center>
    </div>

    <center>
        <div id="formContainer">
            <form id="form1" runat="server">
                <h2>Please fill out this form to register</h2>
                   <asp:ScriptManager runat="server"></asp:ScriptManager>
<asp:UpdatePanel runat="server" id="UpdatePanel1">
    <ContentTemplate>



                <div class="form-group">

                <label for="txtFullName">Full Name:</label>  <p style="display: inline; color: red;"> *</p>
                <asp:TextBox ID="txtFullName" runat="server"   placeholder="Please Enter Full Name"></asp:TextBox>
                <br />
            <asp:RequiredFieldValidator ControlToValidate="txtFullName" ErrorMessage="Please enter your full name." runat="server" ForeColor="Red" />

                <br />

                <label for="txtEmail">Email:</label>  <p style="display: inline; color: red;"> *</p>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email Address"></asp:TextBox>
                                <br />

            <asp:RequiredFieldValidator ControlToValidate="txtEmail" ErrorMessage="Please enter your email." runat="server" ForeColor="Red" />

                <br />

                <label for="txtPassword">Password:</label>  <p style="display: inline; color: red;"> *</p>
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" placeholder="****"></asp:TextBox>
                            <br />

            <asp:RequiredFieldValidator ControlToValidate="txtPassword" ErrorMessage="Please enter your password." runat="server" ForeColor="Red" />

                <br />

                <label for="txtPhone">Phone:</label>  <p style="display: inline; color: red;"> *</p>
                <asp:TextBox ID="txtPhone" runat="server" placeholder="Enter Phone Number"></asp:TextBox>
                            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtPhone" ErrorMessage="Please enter your phone number." runat="server" ForeColor="Red" />
                <br />

                  <div>

                      <script type="text/javascript">
                        function validateGender(sender, args) {
                    args.IsValid = document.getElementById('<%= male.ClientID %>').checked || document.getElementById('<%= female.ClientID %>').checked;
                                }
                      </script>

                 <label for="txtGender">Gender:</label>  <p style="display: inline; color: red;"> *</p>

            <asp:RadioButton ID="male" runat="server" GroupName="Gender" Text="Male" />
            <asp:RadioButton ID="female" runat="server" GroupName="Gender" Text="Female" /> 
                                <br />

            <asp:CustomValidator ID="CustomValidatorGender" runat="server" ErrorMessage="Please select your gender."
                  ClientValidationFunction="validateGender" OnServerValidate="CustomValidatorGender_ServerValidate" ForeColor="Red" Display="Dynamic">
        </asp:CustomValidator>

        </div>
                                                               <br />


                
                 <label for="txtBirthDate">Birth Date:</label>  <p style="display: inline; color: red;"> *</p>
                <asp:TextBox ID="txtBirthDate" runat="server" placeholder="Format: DD/MM/YYYY"></asp:TextBox>
                               
                                    <br />

            <asp:RequiredFieldValidator ControlToValidate="txtBirthDate" ErrorMessage="Please enter your birth date." runat="server" ForeColor="Red" />
                    <asp:RegularExpressionValidator ID="regexBirthDateValidator" runat="server"
    ControlToValidate="txtBirthDate"
    ErrorMessage="Please enter a date in the format DD/MM/YYYY."
    ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/(19|20)\d\d$"
    ForeColor="Red" />

  <br />


                
                <label for="txtCity">City:</label>  <p style="display: inline; color: red;"> *</p>
                <asp:TextBox ID="txtCity" runat="server" placeholder="Enter City Name"></asp:TextBox>
                       <br />

            <asp:RequiredFieldValidator ControlToValidate="txtCity" ErrorMessage="Please enter your city name." runat="server" ForeColor="Red" />
                    <br />
                
                
                <label for="txtUniversity">University:</label>  <p style="display: inline; color: red;"> *</p>
                <asp:TextBox ID="txtUniversity" runat="server" placeholder="Enter University Name"></asp:TextBox>
                                    <br />

            <asp:RequiredFieldValidator ControlToValidate="txtUniversity" ErrorMessage="Please enter your university name." runat="server" ForeColor="Red" />

                <br />
              
                <label for="txtMajor">Major:</label>  <p style="display: inline; color: red;"> *</p>
                <asp:TextBox ID="txtMajor" runat="server" placeholder="Enter Major"></asp:TextBox>
                            <br />

            <asp:RequiredFieldValidator ControlToValidate="txtMajor" ErrorMessage="Please enter your major." runat="server" ForeColor="Red" />
                <br />
                  
                <label for="txtGrad">Graduation Year:</label>  <p style="display: inline; color: red;"> *</p>
                <asp:TextBox ID="txtGrad" runat="server" placeholder="Enter Graduation Year"></asp:TextBox>
                            <br />

            <asp:RequiredFieldValidator ControlToValidate="txtGrad" ErrorMessage="Please enter your graduation year." runat="server" ForeColor="Red" />
                <br />
                    
                <label for="txtGPA">GPA (out of):</label>  <p style="display: inline; color: red;"> *</p>
                <asp:TextBox ID="txtGPA" runat="server" placeholder="Eg. 4.5/5"></asp:TextBox>
                            <br />

            <asp:RequiredFieldValidator ControlToValidate="txtGPA" ErrorMessage="Please enter your GPA." runat="server" ForeColor="Red" />

                <br />



                <!-- File upload labels
                     -->

                         <label for="fuCV">Attach your CV:</label> <p style="display: inline; color: red;"> *</p>  
                <asp:FileUpload ID="fuCV" runat="server" accept=".pdf"  />
                            <br />

                <br />

                <label for="fuVideo">Attach a video of you talking about yourself (1 min):</label>  <p style="display: inline; color: red;"> *</p>
                <asp:FileUpload ID="fuVideo" runat="server" accept="video/*" />
                                    <br />

                <br />

                <label for="fuTranscript">Attach your academic transcript:</label>  <p style="display: inline; color: red;"> *</p>
                <asp:FileUpload ID="fuTranscript" runat="server" accept=".pdf" />
                            <br />

                <br />
                     
                <label for="fuPhoto">Attach your personal photo:</label>  <p style="display: inline; color: red;"> *</p>
                <asp:FileUpload ID="fuPhoto" runat="server" accept="image/*" />
                                <br />

                <br />
               

                    <div style="text-align: center;">
                        <asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="submit-button" OnClick="btnSubmit_Click" />
                                <br />
                                           <br />
                        <asp:Label ID="Label2" runat="server"></asp:Label>


                    </div>


                    </div>

                                 </ContentTemplate>
</asp:UpdatePanel>
         

            </form>

        </div>
    </center>

</body>
</html>
