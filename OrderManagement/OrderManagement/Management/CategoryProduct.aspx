<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryProduct.aspx.cs" Inherits="OrderManagement.Management.CategoryProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-12">
            <h3>Categories</h3>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="CategoryId" DataSourceID="dsCategories" SelectedIndex="0">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-12">
            <h3>Products</h3>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="dsProducts">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                    <asp:BoundField DataField="CategoryName" HeaderText="CategoryId" SortExpression="CategoryId" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="ExpireDate" HeaderText="ExpireDate" SortExpression="ExpireDate" />
                    <asp:BoundField DataField="Picture" HeaderText="Picture" SortExpression="Picture" />
                    <asp:CheckBoxField DataField="OnSale" HeaderText="OnSale" SortExpression="OnSale" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Categories] WHERE [CategoryId] = @CategoryId" InsertCommand="INSERT INTO [Categories] ([CategoryName], [Description]) VALUES (@CategoryName, @Description)" SelectCommand="SELECT * FROM [Categories]" UpdateCommand="UPDATE [Categories] SET [CategoryName] = @CategoryName, [Description] = @Description WHERE [CategoryId] = @CategoryId">
            <DeleteParameters>
                <asp:Parameter Name="CategoryId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="CategoryId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [Products] ([ProductName], [Price], [ExpireDate], [Picture], [OnSale], [CategoryId]) VALUES (@ProductName, @Price, @ExpireDate, @Picture, @OnSale, @CategoryId)" SelectCommand="SELECT Products.ProductId, Products.ProductName, Products.Price, Products.ExpireDate, Products.Picture, Products.OnSale, Products.CategoryId, Categories.CategoryName FROM Products INNER JOIN Categories ON Products.CategoryId = Categories.CategoryId WHERE (Products.CategoryId = @CategoryId)" UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [Price] = @Price, [ExpireDate] = @ExpireDate, [Picture] = @Picture, [OnSale] = @OnSale, [CategoryId] = @CategoryId WHERE [ProductId] = @ProductId">
            <DeleteParameters>
                <asp:Parameter Name="ProductId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="ExpireDate" />
                <asp:Parameter Name="Picture" Type="String" />
                <asp:Parameter Name="OnSale" Type="Boolean" />
                <asp:Parameter Name="CategoryId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="CategoryId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="ExpireDate" />
                <asp:Parameter Name="Picture" Type="String" />
                <asp:Parameter Name="OnSale" Type="Boolean" />
                <asp:Parameter Name="CategoryId" Type="Int32" />
                <asp:Parameter Name="ProductId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
