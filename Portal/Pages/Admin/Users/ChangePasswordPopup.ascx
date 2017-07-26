<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangePasswordPopup.ascx.cs" Inherits="Portal.Pages.Admin.Users.ChangePasswordPopup" %>

<dx:ASPxPopupControl ID="ASPxPopupControlPassword" ClientInstanceName="ASPxClientPopupControlPassword" runat="server" HeaderText="Изменить пароль" Width="500px" PopupHorizontalAlign="WindowCenter" AllowDragging="True" CloseAction="CloseButton" Modal="True" PopupVerticalOffset="100">
    <HeaderStyle BackColor="WhiteSmoke" />
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanelPassword" ClientInstanceName="ASPxClientCallbackPanelPassword" runat="server" Width="100%" OnCallback="ASPxCallbackPanelPassword_Callback">
                <SettingsLoadingPanel Enabled="False" />
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxLabel ID="ASPxLabelUser" runat="server" Font-Size="Large">
                        </dx:ASPxLabel>
                        <br />
                        <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="100%">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="padding: 10px 0;">
                                                <dx:ASPxTextBox ID="ASPxTextBoxPassword" runat="server" Caption="Новый пароль" Width="100%" ClientInstanceName="ASPxClientTextBoxPassword" Password="True">
                                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="Password">
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                    <CaptionCellStyle Width="120px">
                                                    </CaptionCellStyle>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxTextBox ID="ASPxTextBoxConfirmPassword" runat="server" Width="100%" Caption="Подтверждение" ClientInstanceName="ASPxClientTextBoxConfirmPassword" Password="True">
                                                    <ClientSideEvents Validation="function(s, e) {
	e.isValid = (ASPxClientTextBoxPassword.GetText() == ASPxClientTextBoxConfirmPassword.GetText());
}" />
                                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="Password">
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                    <CaptionCellStyle Width="120px">
                                                    </CaptionCellStyle>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                        <br />
                        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" RightToLeft="True">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxButton ID="ASPxButtonCancel" runat="server" Text="Отмена" AutoPostBack="False">
                                        <ClientSideEvents Click="function(s, e) {
	                                                admin.ManageUsersPasswordPopupHide();
                                                }" />
                                    </dx:ASPxButton>
                                    <dx:ASPxButton ID="ASPxButtonSave" runat="server" Text="Сохранить" AutoPostBack="False" ValidationGroup="Password">
                                        <ClientSideEvents Click="function(s, e) {
if(ASPxClientEdit.AreEditorsValid())
                                                                {
	                                                ASPxClientCallbackUpdatePassword.PerformCallback();
}
                                                }" />
                                    </dx:ASPxButton>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
    <ClientSideEvents Shown="admin.ManageUsersPasswordPopupShown" />
</dx:ASPxPopupControl>
<dx:ASPxCallback ID="ASPxCallbackUpdatePassword" runat="server" ClientInstanceName="ASPxClientCallbackUpdatePassword" OnCallback="ASPxCallbackUpdatePassword_Callback">
    <ClientSideEvents EndCallback="function(s, e) {
	ASPxClientPopupControlPassword.Hide();
}" />
</dx:ASPxCallback>
