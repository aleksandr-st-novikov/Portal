<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Users/UsersMain.master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="Portal.Pages.Admin.Users.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4>Добавить пользователя</h4>
    <p style="color:red">
      <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="input-element">
        <dx:ASPxTextBox ID="ASPxTextBoxUserName" runat="server" Width="250px" Caption="Имя пользователя">
            <ValidationSettings ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                <RequiredField ErrorText="Поле Имя пользователя обязательно." IsRequired="true" />
            </ValidationSettings>
            <CaptionCellStyle Width="150px">
            </CaptionCellStyle>
        </dx:ASPxTextBox>
    </div>
    <div class="input-element">
        <dx:ASPxTextBox ID="ASPxTextBoxEMail" runat="server" Width="250px" Caption="E-Mail">
            <ValidationSettings ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                <RequiredField ErrorText="Поле E-Mail обязательно." IsRequired="true" />
            </ValidationSettings>
            <CaptionCellStyle Width="150px">
            </CaptionCellStyle>
        </dx:ASPxTextBox>
    </div>
    <div class="input-element">
        <dx:ASPxTextBox ID="ASPxTextBoxPassword" runat="server" Width="250px" Caption="Пароль" Password="True">
            <CaptionCellStyle Width="150px">
            </CaptionCellStyle>
        </dx:ASPxTextBox>
    </div>
    <div class="input-element">
        <dx:ASPxTextBox ID="ASPxTextBoxConfirmPassword" runat="server" Width="250px" Caption="Повторить пароль" Password="True">
            <CaptionCellStyle Width="150px">
            </CaptionCellStyle>
        </dx:ASPxTextBox>
    </div>
    <div class="input-element" style="margin-left:300px;">
        <dx:ASPxButton ID="ASPxButtonSave" runat="server" Text="Сохранить" OnClick="ASPxButtonSave_Click"></dx:ASPxButton>
    </div>
</asp:Content>
