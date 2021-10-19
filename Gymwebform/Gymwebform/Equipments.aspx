<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Equipments.aspx.cs" Inherits="Gymwebform.Equipments1" %>

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
                    <label for="txtName"><b>Equipment Name</b></label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Name of Equipment" required>
                    </asp:TextBox>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name must be in alphabets!"
                        ForeColor="Red" ValidationExpression="^[A-Za-z]*$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName"></asp:RegularExpressionValidator>
                </div>
                <div class="col-md-6">
                    <label for="txtQuantity"><b>Equipment Quantity</b></label>
                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" placeholder="Enter Quantity of Equipment" required>
                    </asp:TextBox>
                </div>
            </div>




            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">

                    <label for="ddlMuscle"><b>Equipment MuscleFocus</b></label>
                    <asp:DropDownList ID="ddlMuscle" runat="server">
                        <asp:ListItem Value="0">Select Body Region</asp:ListItem>
                        <asp:ListItem>Upper Body</asp:ListItem>
                        <asp:ListItem>Lower Body</asp:ListItem>
                        <asp:ListItem>Full Body</asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Muscle Focus is required!"
                        ForeColor="Red" ControlToValidate="ddlMuscle" Display="Dynamic" SetFocusOnError="true" InitialValue="Select Body Region">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <label for="txtWeight"><b>Weight Range</b></label>
                    <asp:TextBox ID="txtWeight" runat="server" CssClass="form-control" TextMode="Number" placeholder="Weight range of equipment in Kg" required>
                    </asp:TextBox>

                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Equipment" OnClick="btnAdd_Click1" />
                </div>
            </div>

            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound"
            DataKeyNames="Id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" PageSize = "5" AllowPaging ="True" OnPageIndexChanging = "OnPaging"
            OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
            Width="100%" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                             <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
            <Columns>
                <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="Name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtequipname" runat="server" Text='<%# Eval("Name") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtequipquantity" runat="server" Text='<%# Eval("Quantity") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Muscle" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="musclefocus" runat="server" Text='<%# Eval("MuscleFocus") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtequipmusclefocus" runat="server" Text='<%# Eval("MuscleFocus") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Weight" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="weight" runat="server" Text='<%# Eval("WeightRange") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtequipweight" runat="server" Text='<%# Eval("WeightRange") %>' Width="140"></asp:TextBox>
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
