<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductPartial.ascx.cs" Inherits="OrderManagement.Management.ProductPartial" %>
<div class="row">
                <div class="col-12">
                    <h3>Products</h3>
                    <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsProducts" DataKeyNames="ProductId" OnRowUpdating="GridView1_RowUpdating">

                        <Columns>
                            <asp:TemplateField HeaderText="Picture" SortExpression="Picture">
                                <EditItemTemplate>
                                    <asp:HiddenField ID="TextBox5" runat="server" Value='<%# Bind("Picture") %>'></asp:HiddenField>
                                    <asp:FileUpload ID="fu" CssClass="form-control" runat="server" />

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image Style="width: 40px" CssClass="rounded-circle" ID="Image1" ImageUrl='<%# Eval("Picture", "~/Uploads/{0}") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Name" SortExpression="ProductName">
                                <EditItemTemplate>
                                    <asp:TextBox ValidationGroup="ed" CssClass="form-control" ID="TextBox1" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="TextBox1" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Product name required"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category" SortExpression="CategoryName">
                                <EditItemTemplate>
                                    <asp:DropDownList DataSourceID="dsCategories" DataTextField="CategoryName" DataValueField="CategoryId" ValidationGroup="ed" CssClass="form-select" ID="TextBox2" runat="server" SelectedValue='<%# Bind("CategoryId") %>'></asp:DropDownList>
                                    <asp:RequiredFieldValidator ValidationGroup="ed" CssClass="text-danger" ControlToValidate="TextBox2" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Category required"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price" SortExpression="Price">
                                <EditItemTemplate>
                                    <asp:TextBox ValidationGroup="ed" CssClass="form-control" ID="TextBox3" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="ed" CssClass="text-danger" ControlToValidate="TextBox3" Display="Dynamic" ID="RequiredFieldValidator12" runat="server" ErrorMessage="Price required"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator Operator="DataTypeCheck" Type="Double" ValidationGroup="ed" CssClass="text-danger" ControlToValidate="TextBox3" ID="CompareValidator10" runat="server" ErrorMessage="Price invalid"></asp:CompareValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Expire Date" SortExpression="ExpireDate">
                                <EditItemTemplate>
                                    <asp:TextBox ValidationGroup="ed" CssClass="form-control date" ID="TextBox4" runat="server" Text='<%# Bind("ExpireDate", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="ed" CssClass="text-danger" ControlToValidate="TextBox4" Display="Dynamic" ID="RequiredFieldValidator13" runat="server" ErrorMessage="Ex. date required"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator Operator="DataTypeCheck" Type="Date" ValidationGroup="ed" CssClass="text-danger" ControlToValidate="TextBox4" ID="CompareValidator12" runat="server" ErrorMessage="Ex. date invalid"></asp:CompareValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ExpireDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="OnSale?" SortExpression="OnSale">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="TextBox6" runat="server" Checked='<%# Bind("OnSale") %>'></asp:CheckBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="Label6" runat="server" Enabled="false" Checked='<%# Bind("OnSale") %>'></asp:CheckBox>
                                </ItemTemplate>
                                <HeaderStyle Width="90px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">

                                <EditItemTemplate>
                                    <asp:LinkButton ValidationGroup="ed" CssClass="btn btn-primary btn-sm" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton CssClass="btn btn-success btn-sm" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton CssClass="btn btn-danger btn-sm" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Width="190px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="col-12">
                    <h3>Add New Product</h3>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ProductId" DataSourceID="dsProducts" DefaultMode="Insert" RenderOuterTable="False" OnItemInserting="FormView1_ItemInserting">

                        <InsertItemTemplate>
                            <div class="form-group row mb-1">
                                <label class="col-form-label col-2 text-end">Product Name</label>
                                <div class="col-4">
                                    <asp:TextBox ValidationGroup="ins" CssClass="form-control" ID="TextBox1" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Product name required"></asp:RequiredFieldValidator>
                                </div>

                            </div>
                            <div class="form-group row mb-1">
                                <label class="col-form-label col-2 text-end">Price</label>
                                <div class="col-4">
                                    <asp:TextBox ValidationGroup="ins" CssClass="form-control" ID="TextBox3" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="TextBox3" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Price required"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator Operator="DataTypeCheck" Type="Double" ValidationGroup="ins" CssClass="text-danger" ControlToValidate="TextBox3" ID="CompareValidator1" runat="server" ErrorMessage="Price invalid"></asp:CompareValidator>
                                </div>

                            </div>
                            <div class="form-group row mb-1">
                                <label class="col-form-label col-2 text-end">Expire Date</label>
                                <div class="col-4">
                                    <asp:TextBox ValidationGroup="ins" CssClass="form-control date" ID="TextBox4" runat="server" Text='<%# Bind("ExpireDate") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="TextBox4" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ex. date required"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator Operator="DataTypeCheck" Type="Date" ValidationGroup="ins" CssClass="text-danger" ControlToValidate="TextBox4" ID="CompareValidator2" runat="server" ErrorMessage="Ex. date invalid"></asp:CompareValidator>
                                </div>

                            </div>
                            <div class="form-group row mb-1">
                                <label class="col-form-label col-2 text-end">Picture</label>
                                <div class="col-4">
                                    <asp:HiddenField ID="TextBox5" runat="server" Value='<%# Bind("Picture") %>'></asp:HiddenField>
                                    <asp:FileUpload ID="fu" CssClass="form-control" runat="server" />
                                    <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="fu" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Picture required"></asp:RequiredFieldValidator>
                                </div>

                            </div>
                            <div class="form-group row mb-1">
                                <label class="col-form-label col-2 text-end">On Sale?</label>
                                <div class="col-4">
                                    <asp:CheckBox ValidationGroup="ins" ID="TextBox6" runat="server" Checked='<%# Bind("OnSale") %>'></asp:CheckBox>
                                </div>

                            </div>
                            <div class="form-group row mb-1">
                                <label class="col-form-label col-2 text-end">Product Name</label>
                                <div class="col-4">
                                    <asp:DropDownList DataSourceID="dsCategories" DataTextField="CategoryName" DataValueField="CategoryId" ValidationGroup="ins" CssClass="form-select" ID="TextBox2" runat="server" SelectedValue='<%# Bind("CategoryId") %>'></asp:DropDownList>
                                    <asp:RequiredFieldValidator ValidationGroup="ins" CssClass="text-danger" ControlToValidate="TextBox2" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Category required"></asp:RequiredFieldValidator>
                                </div>

                            </div>
                            <div class="form-group row mb-1">
                                <div class="col-10">
                                    <asp:LinkButton ID="InsertButton" ValidationGroup="ins" CssClass="btn btn-primary" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                    &nbsp;<asp:LinkButton CssClass="btn btn-secondary" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />

                                </div>
                            </div>

                        </InsertItemTemplate>

                    </asp:FormView>
                </div>
            </div>
            <asp:SqlDataSource ID="dsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [Products] ([ProductName], [Price], [ExpireDate], [Picture], [OnSale], [CategoryId]) VALUES (@ProductName, @Price, @ExpireDate, @Picture, @OnSale, @CategoryId)" SelectCommand="SELECT Products.ProductId, Products.ProductName, Products.Price, Products.ExpireDate, Products.Picture, Products.OnSale, Products.CategoryId, Categories.CategoryName FROM Products INNER JOIN Categories ON Products.CategoryId = Categories.CategoryId" UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [Price] = @Price, [ExpireDate] = @ExpireDate, [Picture] = @Picture, [OnSale] = @OnSale, [CategoryId] = @CategoryId WHERE [ProductId] = @ProductId">
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
            <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT [CategoryId], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
