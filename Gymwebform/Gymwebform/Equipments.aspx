<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Equipments.aspx.cs" Inherits="Gymwebform.Equipments1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url('../Images/eq.jfif'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Add Equipments</h2>
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

            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-6">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" DataKeyNames="Name" AutoGenerateColumns="False" 
                        EmptyDataText="No Records Found!" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AllowPaging="true" PageSize="4">
                        <Columns>
                            <asp:BoundField DataField="Sr.No." HeaderText="Sr.No." ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Equipments">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNameEdit" runat="server" Text='<%# Eval("Name") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowEditButton="True" />
                        </Columns>
                        <HeaderStyle BackColor="#5558C9" ForeColor="White"/>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
