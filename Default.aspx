<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>GridView Example with Edit,Delete,Insert</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="ResultGridView" runat="server" AutoGenerateColumns="False" ShowFooter="true"
        DataKeyNames="Name" 
        AllowPaging="True" 
        AllowSorting="true"
        CellPadding="3" 
        OnPageIndexChanging="ResultGridView_PageIndexChanging" 
        OnRowDeleting="ResultGridView_RowDeleting" 
        OnRowEditing="ResultGridView_RowEditing" OnRowUpdating="ResultGridView_RowUpdating" OnRowCancelingEdit="ResultGridView_RowCancelingEdit" PageSize="5" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2" OnRowCommand="ResultGridView_RowCommand" OnSorting="GridView1_Sorting"
        >
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" InsertVisible="False"
                    ReadOnly="True" SortExpression="Name" />
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="Name" Width="100px" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtFName1" runat="server"  Width="100px"></asp:TextBox> 
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ProductNumber" SortExpression="ProductNumber">
                    <EditItemTemplate>
                        <asp:TextBox ID="ProductNumber"  Width="100px" runat="server" Text='<%# Bind("ProductNumber") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtLName1" Width="100px" runat="server" ></asp:TextBox> 
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProductNumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Color" SortExpression="Color">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtColor"  Width="100px" runat="server" Text='<%# Bind("Color") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtColor1"  Width="100px" runat="server" ></asp:TextBox> 
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Color") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SafetyStockLevel" SortExpression="SafetyStockLevel">
                    <EditItemTemplate>
                        <asp:TextBox ID="SafetyStockLevel" Width="100px" runat="server" Text='<%# Bind("SafetyStockLevel") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtState1" Width="100px" runat="server" ></asp:TextBox> 
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("SafetyStockLevel") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ReorderPoint" SortExpression="ReorderPoint">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtReorderPoint" Width="100px" runat="server" Text='<%# Bind("ReorderPoint") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtReorderPoint1" Width="100px" runat="server" ></asp:TextBox> 
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("ReorderPoint") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="StandardCost" SortExpression="StandardCost">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtStandardCost" TextMode="MultiLine" runat="server" Text='<%# Bind("StandardCost") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtStandardCost1" runat="server" TextMode="MultiLine" ></asp:TextBox> 
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("StandardCost") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ListPrice" SortExpression="ListPrice">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtListPrice" TextMode="MultiLine" runat="server" Text='<%# Bind("ListPrice") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                    <asp:TextBox ID="txtListPrice1" runat="server" TextMode="MultiLine" ></asp:TextBox> 
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("ListPrice") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
                
                
                <asp:TemplateField HeaderText="Edit" ShowHeader="False"> 
                <EditItemTemplate> 
                  <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton> 
                  <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton> 
                </EditItemTemplate> 
                <FooterTemplate> 
                  <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="AddNew" Text="Add New"></asp:LinkButton> 
                </FooterTemplate> 
                <ItemTemplate> 
                  <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton> 
                </ItemTemplate> 
                </asp:TemplateField> 
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True"  ShowHeader="True" /> 
                <asp:CommandField HeaderText="Select" ShowSelectButton="True"  ShowHeader="True" /> 

            </Columns>
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
