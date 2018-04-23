<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <script type="text/javascript">
        function OnSelectedIndexChanged(s, e) {
            if(clientPopup.IsVisible())
                SetTbText();
            else clientPopup.Show();
        }
        function OnShown(s, e) {
            SetTbText();
        }
        function SetTbText() {
            var contentIFrameWindow = clientPopup.GetContentIFrameWindow();
            var contentTextBox = contentIFrameWindow.clientTb;
            if(contentTextBox)
                contentTextBox.SetText(clientCmb.GetText());
        }
    </script>
    <form id="form1" runat="server">
    <dx:ASPxComboBox ID="cmb" runat="server" ClientInstanceName="clientCmb">
        <Items>
            <dx:ListEditItem Text="DevExpress Home" Value="Home"></dx:ListEditItem>
            <dx:ListEditItem Text="DevExpress Support" Value="SC"></dx:ListEditItem>
            <dx:ListEditItem Text="DevExpress Search" Value="Search"></dx:ListEditItem>
        </Items>
        <ClientSideEvents SelectedIndexChanged="OnSelectedIndexChanged" />
    </dx:ASPxComboBox>
    <dx:ASPxPopupControl ID="popup" runat="server" ContentUrl="~/ContentPageWithTextBox.aspx"
        Top="100" ClientInstanceName="clientPopup" CloseAction="CloseButton">
        <ClientSideEvents Shown="OnShown" />
    </dx:ASPxPopupControl>
    </form>
</body>
</html>
