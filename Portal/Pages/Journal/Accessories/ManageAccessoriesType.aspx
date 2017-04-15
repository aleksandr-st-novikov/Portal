<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/Accessories/AccessoriesMain.master" AutoEventWireup="true" CodeBehind="ManageAccessoriesType.aspx.cs" Inherits="Portal.Pages.Journal.Accessories.ManageAccessoriesType" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="ASPxGridViewAccessoriesType" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAccessoriesType" KeyFieldName="Id" Width="900px" OnRowDeleting="ASPxGridViewAccessoriesType_RowDeleting">
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsCommandButton>
            <ShowAdaptiveDetailButton ButtonType="Image">
            </ShowAdaptiveDetailButton>
            <HideAdaptiveDetailButton ButtonType="Image">
            </HideAdaptiveDetailButton>
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
            <UpdateButton RenderMode="Link">
            </UpdateButton>
            <CancelButton RenderMode="Link">
            </CancelButton>
        </SettingsCommandButton>
        <SettingsPopup>
            <EditForm HorizontalAlign="Center" MinWidth="800px" VerticalAlign="Middle" />
        </SettingsPopup>
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="20px">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Наименование" FieldName="Name" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSourceAccessoriesType" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [AccessoriesType] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AccessoriesType] ([Name]) VALUES (@Name)" SelectCommand="SELECT * FROM [AccessoriesType] ORDER BY [Name]" UpdateCommand="UPDATE [AccessoriesType] SET [Name] = @Name WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
