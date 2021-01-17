<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="W3.aspx.cs" Inherits="Database_Work_01.W3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <h2>Master page</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="OrderId" DataSourceID="SqlDataSource1" SelectedIndex="0">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="OrderId" HeaderText="OrderId" InsertVisible="False" ReadOnly="True" SortExpression="OrderId" />
            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dt %>" SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>

    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="FoodId" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="FoodId" HeaderText="FoodId" InsertVisible="False" ReadOnly="True" SortExpression="FoodId" />
            <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Picture" HeaderText="Picture" SortExpression="Picture" />
            <asp:BoundField DataField="OrderId" HeaderText="OrderId" SortExpression="OrderId" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dt %>" SelectCommand="SELECT * FROM [Deliverys] WHERE ([OrderId] = @OrderId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="OrderId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
