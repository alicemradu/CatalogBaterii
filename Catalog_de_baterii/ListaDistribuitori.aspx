<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaDistribuitori.aspx.cs" Inherits="Catalog_de_baterii.ListaDistribuitori" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lista Distribuitori</title>
    <style type="text/css">
        .auto-style1 {
            margin-right: 0px;
            font-weight: bold;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex; /*centreaza*/
            align-items: center; /*centreaza*/
            justify-content: center; /*centreaza*/
            height: 100vh; /* Ocupă întreaga înălțime a ferestrei vizibile */
            background-color: #3BB143; /* Un fundal de culoare deschisă */
        }

        #form1 {
            text-align: center;
            background-color: #fff; /* Fundal al formularului */
            padding: 20px;
            border-radius: 10px; /* Colțuri rotunjite */
        }
    

        #Button1:hover {
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); /* Umbră ușoară */
        }
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDataSource1"  DataKeyNames="RetailerId" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand" ShowFooter="True" CssClass="auto-style1">
            <Columns>
                <asp:CommandField ShowSelectButton="True"  ShowEditButton="True" ShowDeleteButton="True" />
                <asp:TemplateField HeaderText="RetailerId" InsertVisible="False" SortExpression="RetailerId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("RetailerId") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="Button3" runat="server" Text="Adauga distribuitor" CommandName="Insert" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("RetailerId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NumeRetailer" SortExpression="NumeRetailer">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NumeRetailer") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNumeRetailer" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("NumeRetailer") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <asp:Label ID="LabelEroareInserareDistribuitor" runat="server"></asp:Label>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" UpdateCommand="UPDATE [Retailer] SET [NumeRetailer] = @NumeRetailer WHERE [RetailerId] = @RetailerId" DeleteCommand= "DELETE FROM [Retailer] WHERE [RetailerId] = @RetailerId" InsertCommand="INSERT INTO [Retailer] ([NumeRetailer]) VALUES (@NumeRetailer)" SelectCommand="SELECT * FROM [Retailer]" OnInserting="SqlDataSource1_Inserting" OnSelecting="SqlDataSource1_Selecting" >
            <DeleteParameters>
                <asp:Parameter Name="RetailerId" Type="Int32"  />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NumeRetailer" Type="String"/>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NumeRetailer" Type="String"/>
                <asp:Parameter Name="RetailerId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <strong>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Inapoi la pagina principala" BackColor="#3BB143" BorderStyle="Outset" CssClass="auto-style2" ForeColor="White" Height="43px" style="font-weight: bold" />
        </strong>
    </form>
</body>
</html>
