<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="Database_Work_01.WebUserControl1" %>
<h3>Food Delivery</h3>

<asp:ListView ID="ListView1" runat="server" DataKeyNames="FoodId" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting" OnItemUpdating="ListView1_ItemUpdating">


    <EditItemTemplate>
        <tr style="">
            <td>
                <asp:Button ID="UpdateButton" ValidationGroup="ge" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" CausesValidation="false" runat="server" CommandName="Cancel" Text="Cancel" />
            </td>
            <td>
                <asp:Label ID="FoodIdLabel1" runat="server" Text='<%# Eval("FoodId") %>' />
            </td>
            <td>
                <asp:TextBox ID="FoodNameTextBox" ValidationGroup="ge" runat="server" Text='<%# Bind("FoodName") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="ge" ControlToValidate="FoodNameTextBox" runat="server" ErrorMessage="Required Name"></asp:RequiredFieldValidator>

            </td>
            <td>
                <asp:TextBox ID="PriceTextBox" runat="server" ValidationGroup="ge" Text='<%# Bind("Price") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="ge" ControlToValidate="PriceTextBox" runat="server" ErrorMessage="Required Price"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="ge" ControlToValidate="PriceTextBox" ErrorMessage="Insert Number" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>


            </td>
            <td>
                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("Picture") %>' />
                <asp:Image ID="Image1" runat="server" ValidationGroup="ge" ImageUrl='<%# Eval("Picture", "~/Pictures/{0}") %>' Width="40" />
                <asp:FileUpload ID="FileUpload1" runat="server" />

            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" ValidationGroup="ge" SelectedValue='<%# Bind("OrderId") %>' DataSourceID="SqlDataSource2" DataTextField="Area" DataValueField="OrderId">
                </asp:DropDownList>
            </td>
        </tr>
    </EditItemTemplate>

    <InsertItemTemplate>
        <tr style="">
            <td>
                <asp:Button ID="InsertButton" ValidationGroup="gi" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" CausesValidation="false" runat="server" CommandName="Cancel" Text="Clear" />
            </td>
            <td>Required</td>
            <td>
                <asp:TextBox ID="FoodNameTextBox" ValidationGroup="gi" runat="server" Text='<%# Bind("FoodName") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="gi" ControlToValidate="FoodNameTextBox" runat="server" ErrorMessage="Required Name"></asp:RequiredFieldValidator>

            </td>
            <td>
                <asp:TextBox ID="PriceTextBox" runat="server" ValidationGroup="gi" Text='<%# Bind("Price") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="gi" ControlToValidate="PriceTextBox" runat="server" ErrorMessage="Required Price"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="gi" ControlToValidate="PriceTextBox" ErrorMessage="Insert Number" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>


            </td>
            <td>
                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("Picture") %>' />
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="FileUpload1" ValidationGroup="gi" runat="server" ErrorMessage="Required Img"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" ValidationGroup="gi" SelectedValue='<%# Bind("OrderId") %>' DataSourceID="SqlDataSource2" DataTextField="Area" DataValueField="OrderId">
                </asp:DropDownList>
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
                <asp:Label ID="FoodIdLabel" runat="server" Text='<%# Eval("FoodId") %>' />
            </td>
            <td>
                <asp:Label ID="FoodNameLabel" runat="server" Text='<%# Eval("FoodName") %>' />
            </td>
            <td>
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
            </td>
            <td>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Picture", "~/Pictures/{0}") %>' Width="40" />

            </td>
            <td>
                <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
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
                            <th runat="server">FoodId</th>
                            <th runat="server">FoodName</th>
                            <th runat="server">Price</th>
                            <th runat="server">Picture</th>
                            <th runat="server">OrderId</th>
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dt %>" DeleteCommand="DELETE FROM [Deliverys] WHERE [FoodId] = @FoodId" InsertCommand="INSERT INTO [Deliverys] ([FoodName], [Price], [Picture], [OrderId]) VALUES (@FoodName, @Price, @Picture, @OrderId)" SelectCommand="SELECT * FROM [Deliverys]" UpdateCommand="UPDATE [Deliverys] SET [FoodName] = @FoodName, [Price] = @Price, [Picture] = @Picture, [OrderId] = @OrderId WHERE [FoodId] = @FoodId">
    <DeleteParameters>
        <asp:Parameter Name="FoodId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="FoodName" Type="String" />
        <asp:Parameter Name="Price" Type="Decimal" />
        <asp:Parameter Name="Picture" Type="String" />
        <asp:Parameter Name="OrderId" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="FoodName" Type="String" />
        <asp:Parameter Name="Price" Type="Decimal" />
        <asp:Parameter Name="Picture" Type="String" />
        <asp:Parameter Name="OrderId" Type="Int32" />
        <asp:Parameter Name="FoodId" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dt %>" SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
