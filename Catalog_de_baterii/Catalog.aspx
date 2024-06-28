<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Catalog.aspx.cs" Inherits="Catalog_de_baterii.Catalog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Catalog</title>
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
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="DizpotivConsumator" DataValueField="ConsumatorId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Consumator]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="TipBaterie" HeaderText="TipBaterie" SortExpression="TipBaterie" />
                    <asp:BoundField DataField="DizpotivConsumator" HeaderText="DizpotivConsumator" SortExpression="DizpotivConsumator" />
                </Columns>
            </asp:GridView>
            <br />         
            <br />
            <br />
            <asp:Image ID="Image1" runat="server" Visible="false" Height="250px" Width="250px"/>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Baterii.TipBaterie, Consumator.DizpotivConsumator, Consumator.ConsumatorUrl FROM Baterii INNER JOIN Compatibilitate ON Baterii.BaterieId = Compatibilitate.BaterieId INNER JOIN Consumator ON Compatibilitate.ConsumatorId = Consumator.ConsumatorId WHERE (Consumator.ConsumatorId = @ConsumatorId)">
                <SelectParameters>
        <asp:Parameter Name="ConsumatorID" Type="Int32" DefaultValue="0" />
    </SelectParameters>
</asp:SqlDataSource>

          
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Inapoi la pagina principala" BackColor="#3BB143" BorderStyle="None" CssClass="auto-style1" ForeColor="White" Height="50px" />

          
        </div>
    </form>
</body>
</html>
