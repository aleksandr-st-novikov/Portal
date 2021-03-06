﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Users/UsersMain.master" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="Portal.Pages.Admin.Users.ManageRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="ASPxGridViewManageRoles" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceManageRoles" KeyFieldName="Id" OnInitNewRow="ASPxGridViewManageRoles_InitNewRow" OnRowInserting="ASPxGridViewManageRoles_RowInserting" Width="700px">
        <SettingsAdaptivity AdaptivityMode="HideDataCells">
        </SettingsAdaptivity>
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <SettingsBehavior ConfirmDelete="True" />
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
            <EditForm HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" Modal="True" Width="800px" />
        </SettingsPopup>
        <SettingsSearchPanel Visible="True" />
        <StylesPopup>
            <EditForm>
                <Header BackColor="WhiteSmoke">
                </Header>
            </EditForm>
        </StylesPopup>
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="True" VisibleIndex="0" ShowEditButton="True" ShowDeleteButton="True" ButtonRenderMode="Image" ButtonType="Image" Width="20px">
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="2" Caption="Роль">
                <EditFormSettings ColumnSpan="2" />
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSourceManageRoles" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [AspNetRoles] WHERE [Id] = @original_Id AND [Name] = @original_Name" InsertCommand="INSERT INTO [AspNetRoles] ([Id], [Name]) VALUES (@Id, @Name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [AspNetRoles]" UpdateCommand="UPDATE [AspNetRoles] SET [Name] = @Name WHERE [Id] = @original_Id AND [Name] = @original_Name">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="original_Id" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
