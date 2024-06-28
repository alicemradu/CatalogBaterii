<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaBaterii.aspx.cs" Inherits="Catalog_de_baterii.ListaBaterii" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lista Baterii</title>
    <style type="text/css">
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

        .auto-style1 {
            font-weight: bold;
        }

        #Button1:hover {
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); /* Umbră ușoară */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Capacitate" DataValueField="CapacitateId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="100px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Capacitate]"></asp:SqlDataSource>
            <br />
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="TipBaterie" HeaderText="TipBaterie" SortExpression="TipBaterie" />
                <asp:BoundField DataField="Materiale" HeaderText="Materiale" SortExpression="Materiale" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TipBaterie], [Materiale], [CapacitateId] FROM [Baterii] WHERE ([CapacitateId] = @CapacitateId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="CapacitateId" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <strong>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Inapoi la pagina principala" BackColor="#3BB143" BorderStyle="None" CssClass="auto-style1" ForeColor="White" Height="50px" />
        </strong>
    </form>
</body>
</html>
