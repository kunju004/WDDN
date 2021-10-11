<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gymwebform.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title>Login Page</title>
    <style type="text/css">
        .*{
            margin:0;
            padding:0;
            font-family:'Times New Roman', Times, serif;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 580px;
        }
        .auto-style3 {
            width: 580px;
            text-align: right;
        }
        .auto-style4 {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container my-5">
        <form id="form1" runat="server" method="post">
            
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4" colspan="2">Login Page</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">UserName : </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Password : </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="text-center" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="text-center" colspan="2">
                        <asp:Button ID="Button2" runat="server" Text="Login" CssClass="btn btn-dark" OnClick="Button2_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="text-center" colspan="2">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Table]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="text-center" colspan="2">
                        <asp:Button ID="Button3" runat="server" Text="SignUp" CssClass="btn btn-outline-dark" OnClick="Button3_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="text-center" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="text-center" colspan="2">
                        <asp:Button ID="Button4" runat="server" CssClass="btn btn-outline-primary" OnClick="Button4_Click" Text="MembersList" />
                    </td>
                </tr>
            </table>
            
        </form>
        </div>
 
</body>
</html>
