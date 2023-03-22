<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderMaster.aspx.cs" Inherits="OrderManagement.Management.OrderMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col-12">
            <h3>Orders</h3>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="OrderId" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
           
                <EditItemTemplate>
                    <tr style="">
                       <td></td>
                        <td>
                            <asp:Label ID="OrderIdLabel1" runat="server" Text='<%# Eval("OrderId") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control date" ValidationGroup="oed" ID="OrderDateTextBox" runat="server" Text='<%# Bind("OrderDate", "{0:yyyy-MM-dd}") %>' />
                            <asp:RequiredFieldValidator ControlToValidate="OrderDateTextBox" ValidationGroup="oed" CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Order date required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control date" ValidationGroup="oed" ID="DeliveryDateTextBox" runat="server" Text='<%# Bind("DeliveryDate","{0:yyyy-MM-dd}") %>' />
                            
                        </td>
                        <td>
                            <asp:DropDownList DataTextField="CustomerName" DataValueField="CustomerId" DataSourceID="SqlDataSource3" CssClass="form-select" ValidationGroup="oed" ID="CustomerIdTextBox" runat="server" SelectedValue='<%# Bind("CustomerId") %>' />
                            <asp:RequiredFieldValidator ControlToValidate="CustomerIdTextBox" ValidationGroup="oed" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Customer id required"></asp:RequiredFieldValidator>
                        </td>
                         <td>
                            <asp:Button CssClass="btn btn-success btn-sm" ValidationGroup="oed" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ValidationGroup="oed" CausesValidation="false" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
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
                        
                        <td>&nbsp;</td>
                        <td>[Auto]</td>
                        <td>
                            <asp:TextBox CssClass="form-control date" ValidationGroup="oin" ID="OrderDateTextBox" runat="server" Text='<%# Bind("OrderDate") %>' />
                            <asp:RequiredFieldValidator ControlToValidate="OrderDateTextBox" ValidationGroup="oin" CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Order date required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control date" ValidationGroup="oin"  ID="DeliveryDateTextBox" runat="server" Text='<%# Bind("DeliveryDate") %>' />
                            
                        </td>
                        <td>
                            <asp:DropDownList DataTextField="CustomerName" DataValueField="CustomerId" DataSourceID="SqlDataSource3" CssClass="form-select" ValidationGroup="oin" ID="CustomerIdTextBox" runat="server" SelectedValue='<%# Bind("CustomerId") %>' />
                            <asp:RequiredFieldValidator ControlToValidate="CustomerIdTextBox" ValidationGroup="oin" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Customer id required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="oin" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="oin" CausesValidation="false" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                             <asp:Button CssClass="btn btn-secondary btn-sm" CausesValidation="false" ID="Button1" runat="server" CommandName="Select" Text="Select" />
                            
                        </td>
                        <td>
                            <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate","{0:yyyy-MM-dd}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DeliveryDateLabel" runat="server" Text='<%# Eval("DeliveryDate","{0:yyyy-MM-dd}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustomerIdLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                        </td>
                         <td>
                            <asp:Button CssClass="btn btn-danger btn-sm" CausesValidation="false" ID="Button3" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-primary btn-sm" CausesValidation="false" ID="Button4" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">OrderId</th>
                                        <th runat="server">OrderDate</th>
                                        <th runat="server">DeliveryDate</th>
                                        <th runat="server">CustomerId</th>
                                        <th runat="server"></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                       <td></td>
                        <td>
                            <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate", "{0:yyyy-MM-dd}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DeliveryDateLabel" runat="server" Text='<%# Eval("DeliveryDate", "{0:yyyy-MM-dd}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CustomerIdLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                        </td>
                         <td>
                          
                            <asp:Button CausesValidation="false" CssClass="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CausesValidation="false" CssClass="btn btn-primary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </div>
        <div class="col-">
            <h3>Order Items</h3>
            <asp:ListView ID="ListView2" runat="server" DataKeyNames="OrderId,ProductId" DataSourceID="SqlDataSource2" InsertItemPosition="LastItem" OnItemInserting="ListView2_ItemInserting">
               
                <EditItemTemplate>
                    <tr style="">
                       
                        <td>
                            <asp:Label ID="OrderIdLabel1" runat="server" Text='<%# Eval("OrderId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ProductIdLabel1" runat="server" Text='<%# Eval("ProductId") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="oied" ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="oied" CssClass="text-danger" ControlToValidate="QuantityTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Product quantity required"></asp:RequiredFieldValidator>
                        </td>
                         <td>
                            <asp:Button CssClass="btn btn-success btn-sm" ValidationGroup="oied" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" CausesValidation="false" ValidationGroup="oied" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
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
                            <%=GetOrderId() %>

                            <asp:HiddenField ID="OrderIdTextBox" runat="server" Value='<%# Bind("OrderId") %>' />
                        </td>
                        <td>
                            <asp:DropDownList CssClass="form-select" ValidationGroup="oiin"  ID="ProductIdTextBox" runat="server" 
                                SelectedValue='<%# Bind("ProductId") %>' DataSourceID="SqlDataSource4" DataTextField="ProductName" DataValueField="ProductId" />
                            <asp:RequiredFieldValidator ControlToValidate="ProductIdTextBox" ValidationGroup="oiin" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Product required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="oiin"  ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                            <asp:RequiredFieldValidator ControlToValidate="QuantityTextBox" ValidationGroup="oiin" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Quantity required"></asp:RequiredFieldValidator>
                        </td>
                         <td>
                            <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="oiin"  ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" CausesValidation="false" CssClass="btn btn-secondary btn-sm" ValidationGroup="oiin"  runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        
                        <td>
                            <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ProductIdLabel" runat="server" Text='<%# Eval("ProductId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                        </td>
                        <td>
                            <asp:Button CssClass="btn btn-danger btn-sm" ValidationGroup="oidel" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="oidel"  ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        
                                        <th runat="server">OrderId</th>
                                        <th runat="server">ProductId</th>
                                        <th runat="server">Quantity</th>
                                        <th runat="server"></th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonCssClass="btn btn-sm" ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                
            </asp:ListView>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Orders] WHERE [OrderId] = @OrderId" InsertCommand="INSERT INTO [Orders] ([OrderDate], [DeliveryDate], [CustomerId]) VALUES (@OrderDate, @DeliveryDate, @CustomerId)" SelectCommand="SELECT Orders.OrderId, Orders.OrderDate, Orders.DeliveryDate, Orders.CustomerId, Customers.CustomerName FROM Orders INNER JOIN Customers ON Orders.CustomerId = Customers.CustomerId" UpdateCommand="UPDATE [Orders] SET [OrderDate] = @OrderDate, [DeliveryDate] = @DeliveryDate, [CustomerId] = @CustomerId WHERE [OrderId] = @OrderId">
        <DeleteParameters>
            <asp:Parameter Name="OrderId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="OrderDate" />
            <asp:Parameter DbType="Date" Name="DeliveryDate" />
            <asp:Parameter Name="CustomerId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="OrderDate" />
            <asp:Parameter DbType="Date" Name="DeliveryDate" />
            <asp:Parameter Name="CustomerId" Type="Int32" />
            <asp:Parameter Name="OrderId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [OrderItems] WHERE [OrderId] = @OrderId AND [ProductId] = @ProductId" InsertCommand="INSERT INTO [OrderItems] ([OrderId], [ProductId], [Quantity]) VALUES (@OrderId, @ProductId, @Quantity)" SelectCommand="SELECT * FROM [OrderItems] WHERE ([OrderId] = @OrderId)" UpdateCommand="UPDATE [OrderItems] SET [Quantity] = @Quantity WHERE [OrderId] = @OrderId AND [ProductId] = @ProductId">
        <DeleteParameters>
            <asp:Parameter Name="OrderId" Type="Int32" />
            <asp:Parameter Name="ProductId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OrderId" Type="Int32" />
            <asp:Parameter Name="ProductId" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ListView1" Name="OrderId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="OrderId" Type="Int32" />
            <asp:Parameter Name="ProductId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT [CustomerId], [CustomerName] FROM [Customers]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT [ProductId], [ProductName] FROM [Products]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="../Scripts/jquery-3.6.3.js"></script>
    <script src="../Scripts/bootstrap-datepicker.js"></script>
    <script>
        $(() => {
            $(".date").datepicker({
                format:'yyyy-mm-dd'
             });
            
        });
    </script>
</asp:Content>
