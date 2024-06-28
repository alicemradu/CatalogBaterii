<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaPrincipala.aspx.cs" Inherits="Catalog_de_baterii.PaginaPrincipala" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
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

    #Label1 {
        font-size: 24px;
        font-weight: bold;
        color: #006600; /* Text verde */
    }

    #Button1:hover ,
    #Button2:hover ,
    #Button3:hover ,
    #Button4:hover ,
    #Button5:hover{
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); /* Umbră ușoară */
    }
        .auto-style1 {
            font-weight: bold;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Catalog de Baterii"></asp:Label>
        </p>
        <p>
            Ce baterii exista?</p>
        <p>
            <strong>
            <asp:Button ID="Button1" runat="server" Text="Lista Baterii" OnClick="Button1_Click" BackColor="White" BorderStyle="Outset" CssClass="auto-style1" ForeColor="Black" Height="36px" />
            </strong>
        </p>
        <p>
            Cum imi dau seama de ce baterie am nevoie?</p>
        <strong>
        <asp:Button ID="Button2" runat="server" Text="Vezi Catalog" OnClick="Button2_Click" BackColor="White" BorderStyle="Outset" CssClass="auto-style1" ForeColor="Black" Height="34px" />
        </strong>
        <p>
            Unde gasesc baterii?</p>
        <p>
            <em>
            <asp:Button ID="Button3" runat="server" Text="Lista distribuitori" OnClick="Button3_Click" BackColor="White" CssClass="auto-style1" ForeColor="Black" Height="36px" BorderStyle="Outset" />
            </em>
        </p>
        <strong>
        <asp:Button ID="Button4" runat="server" Text="Proceduri" Height="36px" Width="100px" OnClick="Button4_Click" BackColor="White" BorderStyle="Outset" CssClass="auto-style1" ForeColor="Black" />
            <asp:Button ID="Button5" runat="server" Text="Grafice" Height="36px" Width="100px" OnClick="Button5_Click" BackColor="White" BorderStyle="Outset" CssClass="auto-style1" ForeColor="Black" />
        <br />
        </strong>
        <p>
            <asp:Image ID="Image1" runat="server" Height="110px" Width="113px" ImageUrl="~/Imagini/logo.png" />
        </p>
    </form>
</body>
</html>
