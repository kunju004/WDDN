<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Gymwebform.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image: url('../Images/eq.jfif'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed">
        <fieldset style="width: 350px">
                <legend>Contact us</legend>
                <table>
                    <tr>
                        <td>
                            <b>Name:</b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" Width="200px" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is Required"
                                ControlToValidate="txtName" Text="*" ForeColor="red">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Email:</b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is Required"
                                ControlToValidate="txtEmail" Text="*" ForeColor="red">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ErrorMessage="Please Enter a valid email" ControlToValidate="txtEmail" ForeColor="Red">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top">
                            <b>Comment:</b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtComment" Width="200px" runat="server" Rows="5" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td style="vertical-align:top">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Comment is Required"
                                ControlToValidate="txtComment" Text="*" ForeColor="red">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:ValidationSummary HeaderText="Please fix the following errors!" ForeColor="Red" 
                                ID="ValidationSummary1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="Label1" runat="server" Font-Bold="true"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>
            `</fieldset>
    </div>
</asp:Content>
