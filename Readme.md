<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128564743/13.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E3928)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [ContentPageWithTextBox.aspx](./CS/WebSite/ContentPageWithTextBox.aspx) (VB: [ContentPageWithTextBox.aspx](./VB/WebSite/ContentPageWithTextBox.aspx))
* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
<!-- default file list end -->
# How to manipulate client-side objects within a ASPxPopupControl with the specified ContentUrl
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e3928/)**
<!-- run online end -->


<p>This example demonstrates how to manipulate objects inside <strong>ASPxPopupControl</strong> with a specified <strong>ContentUrl</strong> property.<br> To access/manipulate client-side programmatic objects inside a <strong>ASPxPopupControl</strong> perform the following steps:<br>1) Call the <strong>ASPxPopupControl.Show</strong> method and handle the <strong>ASPxPopupControl's Shown </strong>event (this is necessary because the DOM tree for <strong>ASPxPopupControl</strong> has not been built yet, and that's why we can't get references to objects inside the <strong>ASPxPopupControl</strong> until it is shown); </p>
<p>2) Get the contentWindow object of the <strong>ASPxPopupControl </strong>IFrame via the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxPopupControlScriptsASPxClientPopupControl_GetWindowContentIFrametopic"><u>ASPxClientPopupControl.GetWindowContentIFrame</u></a> method;<br> 3) Get any object from this window and manipulate it.<br><br></p>
<p><strong>Note:</strong> Iframe isn't fully loaded in the <strong>Shown</strong> event when the popup is shown for the first time. It is necessary to handle the <strong>load</strong> event of iframe and call the necessary functions in the event handler.</p>
<p><strong>Default.aspx:</strong></p>


```aspx
<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" ClientInstanceName="loadingPanel" Modal="true" runat="server"></dx:ASPxLoadingPanel>
<dx:ASPxComboBox ID="cmb" runat="server" ClientInstanceName="clientCmb">
   <Items>
       ...
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


<p><strong>ContentPageWithTextBox.aspx:<br> </strong></p>


```aspx
<dx:ASPxTextBox ID="tb" runat="server" Width="150px" ClientInstanceName="clientTb">
</dx:ASPxTextBox>

```


<p><strong>See Also:</strong><br> <a href="https://www.devexpress.com/Support/Center/p/E3098">E3098: How to return values from the ASPxPopupControl's ContentUrl page and close the popup on both client and server sides </a></p>

<br/>


