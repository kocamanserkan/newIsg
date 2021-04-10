<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mailDeneme.aspx.cs" Inherits="serkanISG.mailDeneme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label>Mail Gönderilecek Kişi</label>
            <asp:DropDownList ID="mailListe" runat="server">
               
            </asp:DropDownList>
            <asp:Button ID="send" OnClick="send_Click"  CssClass="" Text="Gönder" runat="server" />
        </div>
    </form>
</body>
</html>
