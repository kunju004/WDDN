<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="Gymwebform.Staff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url('../Images/eq.jfif'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center"></h2>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">

                    <label for="txtNum"><b>Trainer Number</b></label>
                    <asp:TextBox ID="txtNum" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter Mobile Number" required>
                    </asp:TextBox>


                    <label for="txtName"><b>Trainer Name</b></label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name of Trainer" required>
                    </asp:TextBox>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name must be in alphabets!"
                        ForeColor="Red" ValidationExpression="^[A-Za-z]*$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName"></asp:RegularExpressionValidator>


                    <label for="txtAge"><b>Trainer Age</b></label>
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="Enter Age of Staff" required>
                    </asp:TextBox>




                    <div class="col-md-6">
                        <label for="txtExp"><b>Staff Experience</b></label>
                        <asp:TextBox ID="txtExp" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter Experience of Trainer" required>
                        </asp:TextBox>
                    </div>



                    <label for="txtSkill"><b>Staff Expertise</b></label>
                    <asp:TextBox ID="txtSkill" runat="server" CssClass="form-control" placeholder="Enter Expertise of Tariner" required>
                    </asp:TextBox>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Name must be in alphabets!"
                        ForeColor="Red" ValidationExpression="^[A-Za-z]*$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Staff" OnClick="btnAdd_Click1" />
                </div>
            </div>

            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound"
                DataKeyNames="Id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" PageSize="5" AllowPaging="True" OnPageIndexChanging="OnPaging"
                OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
                Width="100%" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Mobile" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="mobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNum" runat="server" Text='<%# Eval("Mobile") %>' Width="140"></asp:TextBox>
                        </EditItemTemplate>

                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtname" runat="server" Text='<%# Eval("Name") %>' Width="140"></asp:TextBox>
                        </EditItemTemplate>

                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Age" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="age" runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAge" runat="server" Text='<%# Eval("Age") %>' Width="140"></asp:TextBox>
                        </EditItemTemplate>

                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Experience" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="experience" runat="server" Text='<%# Eval("Experience") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtExp" runat="server" Text='<%# Eval("Experience") %>' Width="140"></asp:TextBox>
                        </EditItemTemplate>

                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Expertise" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="expertise" runat="server" Text='<%# Eval("Expertise") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSkill" runat="server" Text='<%# Eval("Expertise") %>' Width="140"></asp:TextBox>
                        </EditItemTemplate>

                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150" ControlStyle-CssClass="btn btn-outline-info">
                        <ItemStyle Width="150px"></ItemStyle>
                    </asp:CommandField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </div>

</asp:Content>
