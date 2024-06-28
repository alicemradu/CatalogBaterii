<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proceduri.aspx.cs" Inherits="Catalog_de_baterii.Proceduri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Proceduri</title>
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

        #CreeazaProcedura:hover,
        #ApelProcedura:hover{
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); /* Umbră ușoară */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Introdu producatorul de la care vrei sa vezi baterii:
            <asp:TextBox ID="TextBoxNumeProducator" runat="server" Height="16px" OnTextChanged="TextBoxNumeProducator_TextChanged"></asp:TextBox>
            <br />
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" style="margin-left:auto; margin-right:auto;">
         <Columns>
        <asp:BoundField DataField="Capacitate" HeaderText="Capacitate" SortExpression="Capacitate" />
        <asp:BoundField DataField="Materiale" HeaderText="Materiale" SortExpression="Materiale" />
        <asp:BoundField DataField="TipBaterie" HeaderText="Tip Baterie" SortExpression="TipBaterie" />
         </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="CreeazaProcedura" runat="server" OnClick="CreeazaProcedura_Click" Text="Creeaza Procedura" />
            <asp:Button ID="ApelProcedura" runat="server" OnClick="ApelProcedura_Click" Text="Apel Procedura" />
        </div>
        <asp:Label ID="LabelMesaj" runat="server"></asp:Label>
        <br />
        Selecteaza un producator pentru a vedea cate tipuri de baterii produce:
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="NumeProducator" DataValueField="ProducatorId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Producator]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT
    P.NumeProducator,
    COUNT(DISTINCT B.TipBaterie) AS NumarTipuriBaterii
FROM
    Producator P
JOIN
    Baterii B ON P.ProducatorId = B.ProducatorId
WHERE
    P.ProducatorId = @ProducatorId
GROUP BY
    P.NumeProducator;">
            <SelectParameters>
                <asp:Parameter Name="ProducatorId" Type="Int32" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" style="margin-left:auto; margin-right:auto;">
    <Columns>
        <asp:BoundField DataField="NumeProducator" HeaderText="Nume Producator" SortExpression="NumeProducator" />
        <asp:BoundField DataField="NumarTipuriBaterii" HeaderText="Numar Tipuri Baterii" SortExpression="NumarTipuriBaterii" />
    </Columns>
</asp:GridView>

        <br />
        <br />
        Introduc tipul de baterie<asp:TextBox ID="TextBoxTipBaterie" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" style="margin-left:auto; margin-right:auto;">
             <Columns>
                 <asp:BoundField DataField="TipBaterie" HeaderText="Tip Baterie" SortExpression="TipBaterie" />
<asp:BoundField DataField="NivelCompatibilitate" HeaderText="Nivel de compatibilitate" SortExpression="NivelCompatibilitate" />
 </Columns>
        </asp:GridView>
        <asp:Button ID="CreeazaProcedura2" runat="server" Text="Creeaza Procedura" OnClick="CreeazaProcedura2_Click" />
        <asp:Button ID="ApelProcedura2" runat="server" Text="ApelProcedura" OnClick="ApelProcedura2_Click" />
        <br />
        <asp:Label ID="LabelMesaj2" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Inapoi la Pagina Principala" />
    </form>
</body>
</html>
