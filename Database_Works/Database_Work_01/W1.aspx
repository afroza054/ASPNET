<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="W1.aspx.cs" Inherits="Database_Work_01.W1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h3>Order</h3>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="OrderId" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" ValidationGroup="ge" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="OrderIdLabel1" runat="server" Text='<%# Eval("OrderId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="AreaTextBox" ValidationGroup="ge" runat="server" Text='<%# Bind("Area") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="ge" ControlToValidate="AreaTextBox" runat="server" ErrorMessage="Required Area"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" ValidationGroup="gi" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>Required</td>
                <td>
                    <asp:TextBox ID="AreaTextBox" ValidationGroup="gi" runat="server" Text='<%# Bind("Area") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="gi" ControlToValidate="AreaTextBox" runat="server" ErrorMessage="Required Area"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                </td>
                <td>
                    <asp:Label ID="AreaLabel" runat="server" Text='<%# Eval("Area") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" class="table-bordered">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" class="table-bordered" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">OrderId</th>
                                <th runat="server">Area</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
       
              
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dt %>" DeleteCommand="DELETE FROM [Orders] WHERE [OrderId] = @OrderId" InsertCommand="INSERT INTO [Orders] ([Area]) VALUES (@Area)" SelectCommand="SELECT * FROM [Orders]" UpdateCommand="UPDATE [Orders] SET [Area] = @Area WHERE [OrderId] = @OrderId">
        <DeleteParameters>
            <asp:Parameter Name="OrderId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Area" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Area" Type="String" />
            <asp:Parameter Name="OrderId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
