<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="OrderManagement.Management.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">


    <asp:DataList ID="DataList1" CssClass="w-100" runat="server" DataKeyField="OrderId" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
            <div class="row">
                <div class="col-4">
                    <div>
                        OrderId:
                    <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                    </div>
                    <div>
                        OrderDate:
                    <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate", "{0:yyyy-MM-dd}") %>' />
                    </div>
                    <div>
                        DeliveryDate:
                    <asp:Label ID="DeliveryDateLabel" runat="server" Text='<%# Eval("DeliveryDate", "{0:yyyy-MM-dd}") %>' />
                    </div>
                    <div>
                        CustomerId:
                    <asp:Label ID="CustomerIdLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                    </div>
                </div>
                <div class="col-8">
                    <h4>Order Items</h4>
                    <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server"></asp:GridView>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT Orders.OrderId, Orders.OrderDate, Orders.DeliveryDate, Orders.CustomerId, Customers.CustomerName FROM Orders INNER JOIN Customers ON Orders.CustomerId = Customers.CustomerId"></asp:SqlDataSource>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
