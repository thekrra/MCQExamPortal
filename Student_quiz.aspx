<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_quiz.aspx.cs" Inherits="MCQExamPortal.Student_quiz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quiz Started</title> 
    
               <link rel="stylesheet" href="style.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    
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
    width: 40%; /* Adjust logo width */
    height: auto;
}


.quizFinish-button {
    background-color: #056a9c; /* Green background */
    color: white; /* White text color */
    padding: 12px 24px; /* Padding for top & bottom and left & right */
    font-size: 16px; /* Font size */
    border: none; /* No border */
    cursor: pointer; /* Cursor changes to pointer to indicate it's clickable */
    border-radius: 5px; /* Rounded corners */
    transition: background-color 0.3s, transform 0.2s; /* Smooth transition for hover effects */
    outline: none; /* Removes the outline */
}

    .quizFinish-button:hover {
        background-color: #025178; /* Darker shade of green on hover */
        transform: scale(1.05); /* Slightly increase the size */
    }

    .quizFinish-button:active {
        transform: scale(0.95); /* Slightly decrease the size when clicked */
    }

    .quizFinish-button:focus {
        box-shadow: 0 0 0 2px #fff, 0 0 0 4px #4CAF50; /* Adds a focus style to improve accessibility */
    }


        </style>
</head>
<body>

    <div class="fixed-header">
    <img src="images/sbmacademylogo.png" alt="SBM Logo" class="logo">

</div>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <asp:Panel ID="Panel1" runat="server" BackColor="#0787C6" Font-Bold="True" ForeColor="White" Height="80px" Width="100%" Font-Size="Large">
           <div class="content"> 
            <center>
                <asp:Label ID="Label4" runat="server" Text="Quiz Started" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
            </center>
               </div>
        </asp:Panel>
        <center>
            <div>
                <asp:Label ID="lpTopMarkes" runat="server" Visible="false"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Quiz ID: " Visible="false"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Visible="True"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>


            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:DataList ID="dlQuestion" runat="server" OnSelectedIndexChanged="dlQuestion_SelectedIndexChanged" OnItemDataBound="OnRowDataBound">
                            <ItemTemplate>
                                <p>
                                    <%# int.Parse(ViewState["CurrentIndex"].ToString()) %>
                                )
                                <%# Eval("que_desc")%>
                                </p>

                                <asp:Image ID="Image1" runat="server" Height="80" Width="80" />
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rblOptionOne" GroupName="Questions" Text='<%# Eval("opt1") %>'
                                                runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rblOptionTwo" GroupName="Questions" Text='<%# Eval("opt2") %>'
                                                runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rblOptionThree" GroupName="Questions" Text='<%# Eval("opt3") %>'
                                                runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rblOptionFour" GroupName="Questions" Text='<%# Eval("opt4") %>'
                                                runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="answer" GroupName="Questions" Text='<%# Eval("ans") %>'
                                                runat="server" Visible="False" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="marks" GroupName="Questions" Text='<%# Eval("marks") %>'
                                                runat="server" Visible="False" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                    </td>

                </tr>
            </table>
            <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="login-button" OnClick="btnNext_Click" />

            <asp:Button ID="Button1" runat="server" Text="Finish"  CssClass="quizFinish-button" Visible="false" OnClick="Button1_Click" />
        </center>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Label ID="Label5" runat="server"></asp:Label>


    </form>
</body>
</html>
