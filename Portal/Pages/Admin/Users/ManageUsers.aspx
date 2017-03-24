<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Users/UsersMain.master" AutoEventWireup="true" CodeBehind="manageUsers.aspx.cs" Inherits="Portal.Pages.Admin.Users.manageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="ASPxGridViewManageUsers" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceManageUsers" KeyFieldName="Id">
        <SettingsEditing Mode="PopupEditForm" UseFormLayout="False"></SettingsEditing>

        <Settings ShowFilterRow="True"></Settings>

        <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>

        <SettingsPopup>
            <EditForm Width="900px" HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter"></EditForm>
        </SettingsPopup>

        <SettingsSearchPanel Visible="True"></SettingsSearchPanel>
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0" ShowEditButton="True" ShowDeleteButton="True" ButtonRenderMode="Image" ButtonType="Image" FixedStyle="Left" ShowInCustomizationForm="True" Caption=" "></dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="7" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="2" Caption="E-Mail"></dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="EmailConfirmed" VisibleIndex="8" Visible="False"></dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="PasswordHash" VisibleIndex="9" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SecurityStamp" VisibleIndex="10" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PhoneNumber" VisibleIndex="3" Caption="Телефон"></dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="PhoneNumberConfirmed" VisibleIndex="11" Visible="False"></dx:GridViewDataCheckColumn>
            <dx:GridViewDataCheckColumn FieldName="TwoFactorEnabled" VisibleIndex="12" Visible="False"></dx:GridViewDataCheckColumn>
            <dx:GridViewDataDateColumn FieldName="LockoutEndDateUtc" VisibleIndex="5" Caption="Дата разблокировки"></dx:GridViewDataDateColumn>
            <dx:GridViewDataCheckColumn FieldName="LockoutEnabled" VisibleIndex="4" Caption="Разрешена блокировка"></dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="AccessFailedCount" VisibleIndex="6" Caption="Ошибка при входе" Visible="False"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="1" Caption="Имя пользователя"></dx:GridViewDataTextColumn>
        </Columns>
        <SettingsCommandButton>
            <NewButton>
                <Image ToolTip="Создать" IconID="actions_additem_16x16office2013">
                </Image>
            </NewButton>
            <EditButton>
                <Image ToolTip="Редактировать" IconID="edit_edit_16x16office2013" />
            </EditButton>
            <DeleteButton>
                <Image ToolTip="Удалить" IconID="actions_deletelist_16x16office2013" />
            </DeleteButton>
            <UpdateButton RenderMode="Button">
            </UpdateButton>
            <CancelButton RenderMode="Button">
            </CancelButton>
        </SettingsCommandButton>
        <SettingsPopup>
            <EditForm HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" />
        </SettingsPopup>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceManageUsers" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ApplicationServices %>' DeleteCommand="DELETE FROM [AspNetUsers] WHERE [Id] = @original_Id AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND [EmailConfirmed] = @original_EmailConfirmed AND (([PasswordHash] = @original_PasswordHash) OR ([PasswordHash] IS NULL AND @original_PasswordHash IS NULL)) AND (([SecurityStamp] = @original_SecurityStamp) OR ([SecurityStamp] IS NULL AND @original_SecurityStamp IS NULL)) AND (([PhoneNumber] = @original_PhoneNumber) OR ([PhoneNumber] IS NULL AND @original_PhoneNumber IS NULL)) AND [PhoneNumberConfirmed] = @original_PhoneNumberConfirmed AND [TwoFactorEnabled] = @original_TwoFactorEnabled AND (([LockoutEndDateUtc] = @original_LockoutEndDateUtc) OR ([LockoutEndDateUtc] IS NULL AND @original_LockoutEndDateUtc IS NULL)) AND [LockoutEnabled] = @original_LockoutEnabled AND [AccessFailedCount] = @original_AccessFailedCount AND [UserName] = @original_UserName" InsertCommand="INSERT INTO [AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (@Id, @Email, @EmailConfirmed, @PasswordHash, @SecurityStamp, @PhoneNumber, @PhoneNumberConfirmed, @TwoFactorEnabled, @LockoutEndDateUtc, @LockoutEnabled, @AccessFailedCount, @UserName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [AspNetUsers] ORDER BY [UserName]" UpdateCommand="UPDATE [AspNetUsers] SET [Email] = @Email, [EmailConfirmed] = @EmailConfirmed, [PasswordHash] = @PasswordHash, [SecurityStamp] = @SecurityStamp, [PhoneNumber] = @PhoneNumber, [PhoneNumberConfirmed] = @PhoneNumberConfirmed, [TwoFactorEnabled] = @TwoFactorEnabled, [LockoutEndDateUtc] = @LockoutEndDateUtc, [LockoutEnabled] = @LockoutEnabled, [AccessFailedCount] = @AccessFailedCount, [UserName] = @UserName WHERE [Id] = @original_Id AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND [EmailConfirmed] = @original_EmailConfirmed AND (([PasswordHash] = @original_PasswordHash) OR ([PasswordHash] IS NULL AND @original_PasswordHash IS NULL)) AND (([SecurityStamp] = @original_SecurityStamp) OR ([SecurityStamp] IS NULL AND @original_SecurityStamp IS NULL)) AND (([PhoneNumber] = @original_PhoneNumber) OR ([PhoneNumber] IS NULL AND @original_PhoneNumber IS NULL)) AND [PhoneNumberConfirmed] = @original_PhoneNumberConfirmed AND [TwoFactorEnabled] = @original_TwoFactorEnabled AND (([LockoutEndDateUtc] = @original_LockoutEndDateUtc) OR ([LockoutEndDateUtc] IS NULL AND @original_LockoutEndDateUtc IS NULL)) AND [LockoutEnabled] = @original_LockoutEnabled AND [AccessFailedCount] = @original_AccessFailedCount AND [UserName] = @original_UserName">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_EmailConfirmed" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="original_PasswordHash" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_SecurityStamp" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_PhoneNumber" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_PhoneNumberConfirmed" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="original_TwoFactorEnabled" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="original_LockoutEndDateUtc" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="original_LockoutEnabled" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="original_AccessFailedCount" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_UserName" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="EmailConfirmed" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="PasswordHash" Type="String"></asp:Parameter>
            <asp:Parameter Name="SecurityStamp" Type="String"></asp:Parameter>
            <asp:Parameter Name="PhoneNumber" Type="String"></asp:Parameter>
            <asp:Parameter Name="PhoneNumberConfirmed" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="TwoFactorEnabled" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="LockoutEndDateUtc" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="LockoutEnabled" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="AccessFailedCount" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="UserName" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="EmailConfirmed" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="PasswordHash" Type="String"></asp:Parameter>
            <asp:Parameter Name="SecurityStamp" Type="String"></asp:Parameter>
            <asp:Parameter Name="PhoneNumber" Type="String"></asp:Parameter>
            <asp:Parameter Name="PhoneNumberConfirmed" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="TwoFactorEnabled" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="LockoutEndDateUtc" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="LockoutEnabled" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="AccessFailedCount" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="UserName" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Id" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_EmailConfirmed" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="original_PasswordHash" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_SecurityStamp" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_PhoneNumber" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_PhoneNumberConfirmed" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="original_TwoFactorEnabled" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="original_LockoutEndDateUtc" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="original_LockoutEnabled" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="original_AccessFailedCount" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_UserName" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
