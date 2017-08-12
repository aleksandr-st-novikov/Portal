<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserInfoPopup.ascx.cs" Inherits="Portal.Pages.Journal.Transport.UserInfoPopup" %>
<dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="400px"><PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" CloseOnEscape="True" HeaderText="Информация о согласовании" Width="400px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>
