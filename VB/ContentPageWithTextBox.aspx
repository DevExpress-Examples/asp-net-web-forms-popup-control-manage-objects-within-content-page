<%@ Page Language="vb" AutoEventWireup="true" CodeFile="ContentPageWithTextBox.aspx.vb" Inherits="ContentPageWithTextBox" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxTextBox ID="tb" runat="server" Width="150px"
                ClientInstanceName="clientTb">
            </dx:ASPxTextBox>
        </div>
    </form>
</body>
</html>