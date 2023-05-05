# Popup Control for ASP.NET Web Forms - How to manage client-side objects within the control's content page
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e3928/)**
<!-- run online end -->

This example demonstrates how to add objects to the popup control's content page and use the `GetWindowContentIFrame` method to manage those objects.

## Overview

The main idea is to handle the control's client-side `Shown` event to access the objects within the control's content page specified by the [ContentUrl](https://docs.devexpress.com/AspNet/DevExpress.Web.PopupWindow.ContentUrl) property. Then call the popup control's [GetWindowContentIFrame](https://docs.devexpress.com/AspNet/js-ASPxClientPopupControl.GetWindowContentIFrame(window)) method to get the control's IFrame that contains the content page.


```aspx
<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" ClientInstanceName="loadingPanel" Modal="true" runat="server"></dx:ASPxLoadingPanel>
<dx:ASPxComboBox ID="cmb" runat="server" ClientInstanceName="clientCmb">
    <Items>
        <!-- ... -->
    </Items>
    <ClientSideEvents SelectedIndexChanged="OnSelectedIndexChanged" />
</dx:ASPxComboBox>

<dx:ASPxPopupControl ID="popup" runat="server" ContentUrl="~/ContentPageWithTextBox.aspx"
Top="100" ClientInstanceName="clientPopup" CloseAction="CloseButton">
    <ClientSideEvents Shown="OnShown" />
</dx:ASPxPopupControl> 

```

```js
var iframeLoaded = false;
function OnPopUp(s, e) {
	loadingPanel.Show();
}
function OnSelectedIndexChanged(s, e) {
	if (clientPopup.IsVisible())
		SetTbText();
	else clientPopup.Show();
}
function OnInit(s, e) {
	var iframe = s.GetContentIFrame();
	iframe.onload = function () {
		iframeLoaded = true;
		SetTbText();
	}
}
function OnShown(s, e) {
	if (iframeLoaded)
	SetTbText();
}
function SetTbText() {
	var contentIFrameWindow = clientPopup.GetContentIFrameWindow();
	var contentTextBox = contentIFrameWindow.clientTb;
	if (contentTextBox)
		contentTextBox.SetText(clientCmb.GetText());
	loadingPanel.Hide();
}
```

## Files to Review

* [ContentPageWithTextBox.aspx](./CS/ContentPageWithTextBox.aspx) (VB: [ContentPageWithTextBox.aspx](./VB/ContentPageWithTextBox.aspx))
* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))

## More Examples

* [Popup Control for ASP.NET Web Forms - How to return values from the content page and close the pop-up window on the client or server](https://github.com/DevExpress-Examples/asp-net-web-forms-popup-control-get-value-from-content-page-and-close-popup)
