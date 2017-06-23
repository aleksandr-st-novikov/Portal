﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Users/UsersMain.master" AutoEventWireup="true" CodeBehind="manageUsers.aspx.cs" Inherits="Portal.Pages.Admin.Users.manageUsers" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="SM" runat="server"></asp:ScriptManager>
    <dx:ASPxCallback ID="ASPxCallbackUpdateRoles" ClientInstanceName="ASPxClientCallbackUpdateRoles" runat="server" OnCallback="ASPxCallbackUpdateRoles_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {
	            admin.ManageUsersRolesPopupHide();
            }" />
    </dx:ASPxCallback>

    <div class="content">
        <dx:ASPxGridView ID="ASPxGridViewManageUsers" ClientInstanceName="ASPxClientGridViewManageUsers" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceManageUsers" KeyFieldName="Id">

            <SettingsPopup>
                <EditForm Width="900px" HorizontalAlign="WindowCenter" VerticalAlign="Above" Modal="True" VerticalOffset="0"></EditForm>
            </SettingsPopup>

            <ClientSideEvents CustomButtonClick="function(s, e) {
                    var key = s.GetRowKey(e.visibleIndex);
                    admin.ManageUsersRolesClick(key);
                }" />

            <SettingsEditing Mode="PopupEditForm"></SettingsEditing>

            <Settings AutoFilterCondition="Contains" ShowHeaderFilterButton="True" />

            <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>

            <SettingsCommandButton>
                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>

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

            <SettingsSearchPanel Visible="True"></SettingsSearchPanel>
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0" ShowEditButton="True" ShowDeleteButton="True" ButtonRenderMode="Image" ButtonType="Image" FixedStyle="Left" Caption=" ">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="ChangeRoles" Text="Изменить роли">
                            <Image IconID="people_role_16x16office2013">
                            </Image>
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="8" Visible="False" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="2" Caption="E-Mail" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="EmailConfirmed" VisibleIndex="9" Visible="False" ShowInCustomizationForm="True"></dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="PasswordHash" VisibleIndex="10" Visible="False" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SecurityStamp" VisibleIndex="11" Visible="False" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PhoneNumber" VisibleIndex="5" Caption="Телефон" Visible="False" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="PhoneNumberConfirmed" VisibleIndex="12" Visible="False" ShowInCustomizationForm="True"></dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="TwoFactorEnabled" VisibleIndex="13" Visible="False" ShowInCustomizationForm="True"></dx:GridViewDataCheckColumn>
                <dx:GridViewDataDateColumn FieldName="LockoutEndDateUtc" VisibleIndex="3" Caption="Дата разблокировки" ShowInCustomizationForm="True"></dx:GridViewDataDateColumn>
                <dx:GridViewDataCheckColumn FieldName="LockoutEnabled" VisibleIndex="6" Caption="Разрешена блокировка" Visible="False" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="AccessFailedCount" VisibleIndex="7" Caption="Ошибка при входе" Visible="False" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="1" Caption="Имя пользователя" ShowInCustomizationForm="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Сотрудник предприятия" FieldName="EmployeeId" Visible="False" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" TextField="FIO" ValueField="Id">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceManageUsers" ConnectionString='<%$ ConnectionStrings:ApplicationServices %>' DeleteCommand="DELETE FROM [AspNetUsers] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [EmployeeId]) VALUES (@Id, @Email, @EmailConfirmed, @PasswordHash, @SecurityStamp, @PhoneNumber, @PhoneNumberConfirmed, @TwoFactorEnabled, @LockoutEndDateUtc, @LockoutEnabled, @AccessFailedCount, @UserName, @EmployeeId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [AspNetUsers] ORDER BY [UserName]" UpdateCommand="UPDATE [AspNetUsers] SET [Email] = @Email, [EmailConfirmed] = @EmailConfirmed, [PasswordHash] = @PasswordHash, [SecurityStamp] = @SecurityStamp, [PhoneNumber] = @PhoneNumber, [PhoneNumberConfirmed] = @PhoneNumberConfirmed, [TwoFactorEnabled] = @TwoFactorEnabled, [LockoutEndDateUtc] = @LockoutEndDateUtc, [LockoutEnabled] = @LockoutEnabled, [AccessFailedCount] = @AccessFailedCount, [UserName] = @UserName, [EmployeeId] = @EmployeeId WHERE [Id] = @original_Id">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="String"></asp:Parameter>
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
            <asp:Parameter Name="EmployeeId" Type="Int32"></asp:Parameter>
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
            <asp:Parameter Name="EmployeeId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Id" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT [Id], CONCAT([Lastname], ' ', [Firstname], ' ', [Patronymic]) AS FIO FROM [Employee] WHERE ([IsWork] = @IsWork) ORDER BY [FIO]">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="IsWork" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>

    <dx:ASPxPopupControl ID="ASPxPopupControlRoles" ClientInstanceName="ASPxClientPopupControlRoles" runat="server" HeaderText="Роли пользователя" Width="500px" PopupHorizontalAlign="WindowCenter" AllowDragging="True" CloseAction="CloseButton" Modal="True" PopupVerticalOffset="100">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanelRoles" ClientInstanceName="ASPxClientCallbackPanelRoles" runat="server" Width="100%" OnCallback="ASPxCallbackPanelRoles_Callback">
                    <SettingsLoadingPanel Enabled="False" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxLabel ID="ASPxLabelUser" runat="server" Font-Size="Large">
                            </dx:ASPxLabel>
                            <br />
                            <asp:Repeater ID="RepeaterRoles" runat="server">
                                <ItemTemplate>
                                    <dx:ASPxCheckBox ID="ASPxCheckBoxRole" runat="server" Text='<%# Container.DataItem %>'>
                                    </dx:ASPxCheckBox>
                                </ItemTemplate>
                            </asp:Repeater>
                            <br />
                            <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" RightToLeft="True">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <dx:ASPxButton ID="ASPxButtonCancel" runat="server" Text="Отмена" AutoPostBack="False">
                                            <ClientSideEvents Click="function(s, e) {
	                                                admin.ManageUsersRolesPopupHide();
                                                }" />
                                        </dx:ASPxButton>
                                        <dx:ASPxButton ID="ASPxButtonSave" runat="server" Text="Сохранить" AutoPostBack="False">
                                            <ClientSideEvents Click="function(s, e) {
	                                                ASPxClientCallbackUpdateRoles.PerformCallback();
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
        <ClientSideEvents Shown="admin.ManageUsersRolesPopupShown" />
    </dx:ASPxPopupControl>
</asp:Content>
