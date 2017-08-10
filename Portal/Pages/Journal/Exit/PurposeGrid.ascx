<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PurposeGrid.ascx.cs" Inherits="Portal.Pages.Journal.Exit.PurposeGrid" %>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcePurpose" KeyFieldName="Id" Width="900px">
    <SettingsEditing Mode="PopupEditForm">
    </SettingsEditing>
    <SettingsBehavior ConfirmDelete="True" />
    <SettingsPopup>
        <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="700px" />
    </SettingsPopup>
    <SettingsSearchPanel Visible="True" />
    <StylesPopup>
        <EditForm>
            <Header BackColor="WhiteSmoke">
            </Header>
        </EditForm>
    </StylesPopup>
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
        <CancelButton RenderMode="Link">
        </CancelButton>
    </SettingsCommandButton>
    <Columns>
        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="20px" ButtonRenderMode="Image" ButtonType="Image">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Наименование" FieldName="Name" VisibleIndex="2">
            <EditFormSettings ColumnSpan="2" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Описание" FieldName="Description" VisibleIndex="3">
            <EditFormSettings ColumnSpan="2" />
        </dx:GridViewDataTextColumn>
    </Columns>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSourcePurpose" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [ExitPurpose] WHERE [Id] = @Id" InsertCommand="INSERT INTO [ExitPurpose] ([Name], [Description]) VALUES (@Name, @Description)" SelectCommand="SELECT * FROM [ExitPurpose] ORDER BY [Name]" UpdateCommand="UPDATE [ExitPurpose] SET [Name] = @Name, [Description] = @Description WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

