<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InfoPopup.ascx.cs" Inherits="Portal.Pages.Journal.Exit.InfoPopup" %>

<dx:ASPxPopupControl ID="ASPxPopupControlInfo" runat="server" HeaderText="Информация о согласовании" Width="630px" ClientInstanceName="ASPxClientPopupControlInfo" CloseOnEscape="True" PopupHorizontalAlign="OutsideRight" Font-Size="Small">
    <HeaderStyle BackColor="WhiteSmoke" />
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxCallback ID="ASPxCallbackInfo" runat="server" ClientInstanceName="ASPxClientCallbackInfo" OnCallback="ASPxCallbackInfo_Callback">
    <ClientSideEvents EndCallback="function(s, e) {
}" CallbackComplete="function(s, e) {
    ASPxClientPopupControlInfo.SetContentHtml(e.result);
	ASPxClientPopupControlInfo.ShowAtPos(200,250);
}" />
</dx:ASPxCallback>


