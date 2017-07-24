<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangePasswordPopup.ascx.cs" Inherits="Portal.Pages.Admin.Users.ChangePasswordPopup" %>

<dx:ASPxPopupControl ID="ASPxPopupControlPassword" ClientInstanceName="ASPxClientPopupControlPassword" runat="server" HeaderText="Изменить пароль" Width="500px" PopupHorizontalAlign="WindowCenter" AllowDragging="True" CloseAction="CloseButton" Modal="True" PopupVerticalOffset="100">
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
                                    <br />
                                    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Caption="Новый пароль" Width="100%">
                                        <CaptionCellStyle Width="120px">
                                        </CaptionCellStyle>
                                    </dx:ASPxTextBox>
                                    <br />
                                    <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="100%" Caption="Подтверждение">
                                        <CaptionCellStyle Width="120px">
                                        </CaptionCellStyle>
                                    </dx:ASPxTextBox>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                        <br />
                        <br />
                        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" RightToLeft="True">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxButton ID="ASPxButtonCancel" runat="server" Text="Отмена" AutoPostBack="False">
                                        <ClientSideEvents Click="function(s, e) {
	                                                admin.ManageUsersPasswordPopupHide();
                                                }" />
                                    </dx:ASPxButton>
                                    <dx:ASPxButton ID="ASPxButtonSave" runat="server" Text="Сохранить" AutoPostBack="False">
                                        <ClientSideEvents Click="function(s, e) {
	                                                ASPxClientCallbackUpdatePassword.PerformCallback();
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
