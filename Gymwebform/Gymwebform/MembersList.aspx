<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin.Master"  CodeBehind="MembersList.aspx.cs" Inherits="Gymwebform.MembersList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url('../Images/eq.jfif'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="Labelmsg" runat="server"></asp:Label>
            </div>
            <h2 class="text-center">Add Members</h2>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="txtMemberName"><b>Members Name</b></label>
                    <asp:TextBox ID="txtMemberName" runat="server" CssClass="form-control" placeholder="Enter Name of Member..." required>
                    </asp:TextBox>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name must be in alphabets!"
                        ForeColor="Red" ValidationExpression="^[A-Za-z]*$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMemberName"></asp:RegularExpressionValidator>
                </div>
                <div class="col-md-6">
                    <label for="txtEmail"><b>Email</b></label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter Email..." required>
                    </asp:TextBox>
                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="txtDOB"><b>Date Of Birth</b></label>
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" placeholder="Enter DOB..." required>
                    </asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label for="txtMobileNumber"><b>Mobile Number</b></label>
                    <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter Mobile Number..." required>
                    </asp:TextBox>
                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="Gender"><b>Gender</b></label>
                    <asp:DropDownList ID="txtGender" runat="server">
                        <asp:ListItem Value="0">Select Gender</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Others</asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Gender is required!"
                        ForeColor="Red" ControlToValidate="txtGender" Display="Dynamic" SetFocusOnError="true" InitialValue="Select Gender">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    

                     <label for="GymTime"><b>Gym Time</b></label>
                    <asp:DropDownList ID="txtGymTime" runat="server">
                        <asp:ListItem Value="0">Select GymTime</asp:ListItem>
                        <asp:ListItem>Morning 06:00AM to 08:00AM</asp:ListItem>
                        <asp:ListItem>Evening 06:00PM to 08:00PM</asp:ListItem>
                        <asp:ListItem>InNight 11:00PM to 01:00AM</asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="GymTime is required!"
                        ForeColor="Red" ControlToValidate="txtGymTime" Display="Dynamic" SetFocusOnError="true" InitialValue="Select GymTime">
                    </asp:RequiredFieldValidator>

                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="txtJoinDate"><b>Join Date</b></label>
                    <asp:TextBox ID="txtJoinDate" runat="server" CssClass="form-control" TextMode="Date" placeholder="Enter Date..." required>
                    </asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label for="txtAddress"><b>Address</b></label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address..." required>
                    </asp:TextBox>
                </div>
            </div>

             <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="TimePeriod"><b>Time Period</b></label>
                    <asp:DropDownList ID="txtTimePeriod" runat="server">
                        <asp:ListItem Value="0">Select Subscription</asp:ListItem>
                        <asp:ListItem>1 Month</asp:ListItem>
                        <asp:ListItem>2 Month</asp:ListItem>
                        <asp:ListItem>6 Month</asp:ListItem>
                        <asp:ListItem>12 Month</asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subscription is required!"
                        ForeColor="Red" ControlToValidate="txtTimePeriod" Display="Dynamic" SetFocusOnError="true" InitialValue="Select Subscription">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <label for="Price"><b>Subscription Cost</b></label>
                    <asp:DropDownList ID="txtPrice" runat="server">
                        <asp:ListItem Value="0">Cost</asp:ListItem>
                        <asp:ListItem>199</asp:ListItem>
                        <asp:ListItem>299</asp:ListItem>
                        <asp:ListItem>699</asp:ListItem>
                        <asp:ListItem>1299</asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Cost is required!"
                        ForeColor="Red" ControlToValidate="txtPrice" Display="Dynamic" SetFocusOnError="true" InitialValue="Cost">
                    </asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Member" OnClick="btnAdd_Click1" />
                </div>
            </div>

<%-- main content grid view --%>
                <div>
                      
                       <%-- <asp:Panel ID="PanelSearch" runat="server" DefaultButton="ButtonSearch">
                            <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="text-search" Text="" Width="370" />
                            <asp:Button ID="ButtonSearch" runat="server" CssClass="btn btn-outline-dark" OnClick="ButtonSearch_Click" Text="Search" />
                        </asp:Panel>--%>
                    
                         <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound"
            DataKeyNames="Id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" PageSize = "5" AllowPaging ="True" OnPageIndexChanging = "OnPaging"
            OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
            Width="100%" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="memberName" runat="server" Text='<%# Eval("MemberName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtmembername" runat="server" Text='<%# Eval("MemberName") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gender" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="gender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtgender" runat="server" Text='<%# Eval("Gender") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DOB" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="dob" runat="server" Text='<%# Eval("DOB") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtdob" runat="server" Text='<%# Eval("DOB") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="email" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtemail" runat="server" Text='<%# Eval("Email") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="address" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtaddress" runat="server" Text='<%# Eval("Address") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mobile" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="mobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtmobile" runat="server" Text='<%# Eval("Mobile") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="JoinDate" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="joindate" runat="server" Text='<%# Eval("JoinDate") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtjoindate" runat="server" Text='<%# Eval("JoinDate") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="GymTime" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="gymtime" runat="server" Text='<%# Eval("GymTime") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtgymtime" runat="server" Text='<%# Eval("GymTime") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TimePeriod" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="timeperiod" runat="server" Text='<%# Eval("TimePeriod") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txttimeperiod" runat="server" Text='<%# Eval("TimePeriod") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="price" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtprice" runat="server" Text='<%# Eval("Price") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150" >
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
    </div>

</asp:Content>
