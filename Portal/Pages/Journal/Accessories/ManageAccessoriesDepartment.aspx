<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/Accessories/AccessoriesMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageAccessoriesDepartment.aspx.cs" Inherits="Portal.Pages.Journal.Accessories.ManageAccessoriesDepartment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], [Name] FROM [Department] WHERE ([IsActive] = @IsActive) ORDER BY [Name]">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <dx:ASPxCallback ID="ASPxCallbackRefreshGrid" runat="server" ClientInstanceName="ASPxClientCallbackRefreshGrid" OnCallback="ASPxCallbackRefreshGrid_Callback">
        </dx:ASPxCallback>
        <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], CONCAT([Lastname], ' ', [Firstname], ' ', [Patronymic]) AS FIO FROM [Employee] WHERE ([IsWork] = @IsWork) ORDER BY FIO">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="IsWork" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAccessoriesType" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [AccessoriesType] ORDER BY [Name]"></asp:SqlDataSource>
        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="900px">
            <Paddings PaddingBottom="15px" />
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxComboBox ID="ASPxComboBoxAccessoriesType" runat="server" DataSourceID="SqlDataSourceAccessoriesType" TextField="Name" ValueField="Id" Width="400px" Caption="Выберите категорию">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
                            ASPxClientCallbackRefreshGrid.PerformCallback();
	                        ASPxClientGridViewAccessoriesDepartment.Refresh();
                        }" />
                    </dx:ASPxComboBox>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
        <dx:ASPxGridView ID="ASPxGridViewAccessoriesDepartment" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAccessoriesDepartment" KeyFieldName="Id" Width="900px" OnRowInserting="ASPxGridViewAccessoriesDepartment_RowInserting" ClientInstanceName="ASPxClientGridViewAccessoriesDepartment" OnRowDeleting="ASPxGridViewAccessoriesDepartment_RowDeleting" OnCellEditorInitialize="ASPxGridViewAccessoriesDepartment_CellEditorInitialize" OnRowUpdating="ASPxGridViewAccessoriesDepartment_RowUpdating">
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
                <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="800px" />
            </SettingsPopup>
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Width="20px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="4" Caption="Комментарий">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AccessoriesTypeId" VisibleIndex="5" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="DepartmentId" VisibleIndex="2" Caption="Подразделение">
                    <PropertiesComboBox DataSourceID="SqlDataSourceDepartment" TextField="Name" ValueField="Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Сотрудник" FieldName="EmployeeId" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" TextField="FIO" ValueField="Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceAccessoriesDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [AccessoriesDepartment] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AccessoriesDepartment] ([DepartmentId], [EmployeeId], [Description], [AccessoriesTypeId]) VALUES (@DepartmentId, @EmployeeId, @Description, @AccessoriesTypeId)" SelectCommand="SELECT * FROM [AccessoriesDepartment] WHERE ([AccessoriesTypeId] = @AccessoriesTypeId)" UpdateCommand="UPDATE [AccessoriesDepartment] SET [DepartmentId] = @DepartmentId, [EmployeeId] = @EmployeeId, [Description] = @Description, [AccessoriesTypeId] = @AccessoriesTypeId WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DepartmentId" Type="Int32" />
                <asp:Parameter Name="EmployeeId" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="AccessoriesTypeId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="AccessoriesTypeId" SessionField="AccessoriesTypeId" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DepartmentId" Type="Int32" />
                <asp:Parameter Name="EmployeeId" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="AccessoriesTypeId" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
