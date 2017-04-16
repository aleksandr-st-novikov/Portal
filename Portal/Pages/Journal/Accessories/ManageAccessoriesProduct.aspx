<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/Accessories/AccessoriesMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageAccessoriesProduct.aspx.cs" Inherits="Portal.Pages.Journal.Accessories.ManageAccessoriesProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <dx:ASPxCallback ID="ASPxCallbackRefreshGrid" runat="server" ClientInstanceName="ASPxClientCallbackRefreshGrid" OnCallback="ASPxCallbackRefreshGrid_Callback">
        </dx:ASPxCallback>
        <asp:SqlDataSource ID="SqlDataSourceAccessoriesType" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [AccessoriesType] ORDER BY [Name]"></asp:SqlDataSource>
        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="900px">
            <Paddings PaddingBottom="15px" />
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxComboBox ID="ASPxComboBoxAccessoriesType" runat="server" DataSourceID="SqlDataSourceAccessoriesType" TextField="Name" ValueField="Id" Width="400px" Caption="Выберите категорию">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
                            ASPxClientCallbackRefreshGrid.PerformCallback();
	                        ASPxClientGridViewAccessoriesProduct.Refresh();
                        }" />
                    </dx:ASPxComboBox>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>

        <dx:ASPxGridView ID="ASPxGridViewAccessoriesProduct" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAccessoriesProduct" KeyFieldName="Id" Width="900px" ClientInstanceName="ASPxClientGridViewAccessoriesProduct" OnInitNewRow="ASPxGridViewAccessoriesProduct_InitNewRow" OnRowDeleting="ASPxGridViewAccessoriesProduct_RowDeleting" OnRowInserting="ASPxGridViewAccessoriesProduct_RowInserting">
            <SettingsPager PageSize="50">
            </SettingsPager>
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
                <UpdateButton RenderMode="Link">
                </UpdateButton>
                <CancelButton RenderMode="Link">
                </CancelButton>
            </SettingsCommandButton>
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="800px" />
            </SettingsPopup>
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Наименование" FieldName="Name" VisibleIndex="2" Width="400px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Ед.изм." FieldName="Unit" VisibleIndex="3" Width="50px">
                    <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Единица выписки" FieldName="QuantityPerOne" VisibleIndex="4" Width="70px">
                    <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Цена" FieldName="Price" VisibleIndex="5" Width="100px">
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn Caption="Активная карточка" FieldName="IsActive" VisibleIndex="6" Width="70px">
                    <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                </dx:GridViewDataCheckColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceAccessoriesProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [AccessoriesProduct] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AccessoriesProduct] ([Name], [Unit], [QuantityPerOne], [Price], [IsActive], [AccessoriesTypeId]) VALUES (@Name, @Unit, @QuantityPerOne, @Price, @IsActive, @AccessoriesTypeId)" SelectCommand="SELECT * FROM [AccessoriesProduct] WHERE ([AccessoriesTypeId] = @AccessoriesTypeId) ORDER BY [Name]" UpdateCommand="UPDATE [AccessoriesProduct] SET [Name] = @Name, [Unit] = @Unit, [QuantityPerOne] = @QuantityPerOne, [Price] = @Price, [IsActive] = @IsActive, [AccessoriesTypeId] = @AccessoriesTypeId WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Unit" Type="String" />
                <asp:Parameter Name="QuantityPerOne" Type="Decimal" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:Parameter Name="AccessoriesTypeId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="AccessoriesTypeId" SessionField="AccessoriesTypeId" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Unit" Type="String" />
                <asp:Parameter Name="QuantityPerOne" Type="Decimal" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:Parameter Name="AccessoriesTypeId" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
