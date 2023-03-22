<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="OrderManagement.Management.Products" %>

<%@ Register Src="~/Management/ProductPartial.ascx" TagPrefix="uc1" TagName="ProductPartial" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
  
            
    <uc1:ProductPartial runat="server" id="ProductPartial" />


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="../Scripts/jquery-3.6.3.js"></script>
    <script src="../Scripts/bootstrap-datepicker.js"></script>
    <script>
        $(() => {
            $(document).on("click", ".date", function () {
                $(this).datepicker({
                    format: 'yyyy-mm-dd'
                });
            });
        });
        
    </script>
</asp:Content>
