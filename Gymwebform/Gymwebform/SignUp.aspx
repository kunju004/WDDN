<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Gymwebform.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        *{
            margin:0;
            padding:0;
            font-family:'Times New Roman', Times, serif;
            font-size:larger;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 578px;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            text-align: center;
            height: 60px;
        }
        .auto-style6 {
            width: 578px;
            text-align: right;
            height: 43px;
        }
        .auto-style7 {
            height: 43px;
        }
        .auto-style8 {
            width: 578px;
            text-align: right;
            height: 44px;
        }
        .auto-style9 {
            height: 44px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5" colspan="2">Sign Up</td>
                </tr>
                <tr>
                    <td class="auto-style6">UserName : </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">Password : </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="SignUp" CssClass="btn btn-dark" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [UserInfo]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
