<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grafice.aspx.cs" Inherits="Catalog_de_baterii.WebForm1" %><%@ Register assembly="ZedGraph.Web" namespace="ZedGraph.Web" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grafice</title>
    <style type="text/css">
       .auto-style1 {
            margin-left: 0px;
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
        height: 120vh; /* Ocupă întreaga înălțime a ferestrei vizibile */
        background-color: #3BB143; /* Un fundal de culoare deschisă */
    }

    #form1 {
        text-align: center;
        background-color: #fff; /* Fundal al formularului */
        padding: 20px;
        border-radius: 10px; /* Colțuri rotunjite */
        height: 800px;
    }


    #Button1:hover {
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); /* Umbră ușoară */
    }

</style>
    
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Distributie baterii in functie de capacitate"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Font-Bold="True" Font-Size="Medium" ForeColor="#000066" Height="24px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="239px">
            <asp:ListItem Value="Selecteaza">Alege tip grafic</asp:ListItem>
            <asp:ListItem Value="Pie">Grafic pie</asp:ListItem>
            <asp:ListItem Value="Bare">Grafic bare</asp:ListItem>
        </asp:DropDownList>
        <div class="auto-style1">
            <cc1:ZedGraphWeb ID="ZedGraphWeb2" runat="server">
            </cc1:ZedGraphWeb>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Capacitate.Capacitate, COUNT(*) AS Count FROM Baterii JOIN Capacitate ON Baterii.CapacitateId = Capacitate.CapacitateId GROUP BY Capacitate.Capacitate;" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Distributie nivelului de compatibilitate al bateriilor"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Font-Bold="True" Font-Size="Medium" ForeColor="#000066" Height="24px" Width="239px" >
        <asp:ListItem Value="Selecteaza">Alege tip grafic</asp:ListItem>
<asp:ListItem Value="Pie">Grafic pie</asp:ListItem>
<asp:ListItem Value="Bare">Grafic bare</asp:ListItem>
        </asp:DropDownList>
        <br />
            <cc1:ZedGraphWeb ID="ZedGraphWeb3" runat="server">
            </cc1:ZedGraphWeb>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="EXEC AfiseazaNivelCompatibilitate;">
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Inapoi la Pagina Principala" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
