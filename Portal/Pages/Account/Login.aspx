<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Light.master" CodeBehind="Login.aspx.cs" Inherits="Portal.Login" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanelLogin" runat="server" ShowCollapseButton="false" Width="300px" HeaderText="Авторизация" HorizontalAlign="Center" CssClass="login-panel" BackColor="White">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxTextBox ID="ASPxTextBoxUserName" runat="server" Width="100%" Caption="Имя пользователя">
                    <CaptionSettings Position="Top" />
                    <ValidationSettings ValidationGroup="LoginUserValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                        <RequiredField ErrorText="Поле Имя пользователя обязательно." IsRequired="true" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
                <dx:ASPxTextBox ID="ASPxTextBoxPassword" runat="server" Password="true" Width="100%" Caption="Пароль">
                    <CaptionSettings Position="Top" />
                    <ValidationSettings ValidationGroup="LoginUserValidationGroup" ErrorTextPosition="Bottom" Display="Dynamic" ErrorDisplayMode="Text">
                        <RequiredField ErrorText="Поле Пароль обязательно." IsRequired="true" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
                <div class="button-panel">
                    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" RightToLeft="True">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <dx:ASPxButton ID="ASPxButtonLogin" runat="server" Text="Войти" ValidationGroup="LoginUserValidationGroup"
                                    OnClick="ASPxButtonLogin_Click">
                                </dx:ASPxButton>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
