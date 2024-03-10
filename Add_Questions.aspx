




<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Questions.aspx.cs" Inherits="MCQExamPortal.Add_Questions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Questions</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    
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

        .content input[type="text"], .content select, .content input[type="password"], .form-control {
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

    </style>
</head>
<body>

        <div class="fixed-header">
    <img src="images/sbmacademylogo.png" alt="SBM Logo" class="logo">
            <button onclick="history.back()" class="back-button"><i ></i></button>


</div>

    <form id="form1" runat="server">
        <div class="header">
            <asp:Label ID="Label1" runat="server" Text="SBM Academy - Add Questions" Font-Size="X-Large" ForeColor="White"></asp:Label>
        </div>
        <div class="content">
                 <table>

     <tr>
         <td>Choose Category</td>
        <td><asp:DropDownList ID="ddlCategories" ForeColor="#0787C6" BorderColor="#0787C6" runat="server" Width="261px"></asp:DropDownList>
            </td>
     </tr>

     <tr>
         <td>Question Description</td>
         <td class="auto-style1">
             <asp:TextBox ID="que" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" OnTextChanged="que1_TextChanged" Style="margin-left: 8px;" Width="261px"></asp:TextBox></td>

     </tr>

     <tr>
         <td>Option 1</td>
         <td class="auto-style1">
             <asp:TextBox ID="opt1" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" OnTextChanged="opt1_TextChanged" Width="257px"></asp:TextBox></td>

     </tr>
     <tr>

         <td>Option 2</td>
         <td class="auto-style1">
             <asp:TextBox ID="opt2" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" Width="250px" CssClass="auto-style2"></asp:TextBox></td>

     </tr>
     <tr>
         <td>Option 3</td>
         <td class="auto-style1">
             <asp:TextBox ID="opt3" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" Width="251px"></asp:TextBox></td>

     </tr>
     <tr>
         <td>Option 4</td>
         <td class="auto-style1">
             <asp:TextBox ID="opt4" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" Width="246px"></asp:TextBox></td>

     </tr>
     <tr>
         <td>Marks</td>
         <td class="auto-style1">
             <asp:TextBox ID="marks" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" Width="246px"></asp:TextBox></td>

     </tr>
     <tr>
         <td>Correct Answer</td>
         <td class="auto-style1">
             <asp:TextBox ID="ans" runat="server" ForeColor="#0787C6" BorderColor="#0787C6" Width="246px"></asp:TextBox></td>

     </tr>
     <tr>
         <td>Image</td>
         <td class="auto-style1">
             <asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>
         </td>

     </tr>


 </table>
                <br />
            <br />
            <asp:Button ID="Add" runat="server" Text="Add Question" CssClass="styled-button" OnClick="Add_que"></asp:Button>
            <br />
            <asp:Label ID="Label4" runat="server"></asp:Label>
                        <br />

             <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound">
     <Columns>
         <asp:BoundField HeaderText="Category Name" DataField="category_name" />
         <%--<asp:BoundField HeaderText="Quesstion Id" DataField="queeid" />--%>
         <asp:BoundField HeaderText="Description" DataField="quee_desc" />
         <asp:BoundField HeaderText="Option 1" DataField="optt1" />
         <asp:BoundField HeaderText="Option 2" DataField="optt2" />
         <asp:BoundField HeaderText="Option 3" DataField="optt3" />
         <asp:BoundField HeaderText="Option 4" DataField="optt4" />
         <asp:BoundField HeaderText="Answer" DataField="anss" />
         <asp:BoundField HeaderText="Marks" DataField="markss" />
         <asp:TemplateField HeaderText="Image">
             <ItemTemplate>
                 <asp:Image ID="Image1" runat="server" Height="80" Width="80" />
             </ItemTemplate>
         </asp:TemplateField>
     </Columns>
 </asp:GridView>
                <br />
            
            <center>
            <asp:Button ID="Button1" runat="server" Text="Home" CssClass="styled-button" OnClick="gotohome" Style="width: 250px;"></asp:Button>
            </center>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
