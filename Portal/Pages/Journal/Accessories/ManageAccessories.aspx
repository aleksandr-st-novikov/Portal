<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/Accessories/AccessoriesMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageAccessories.aspx.cs" Inherits="Portal.Pages.Journal.Accessories.ManageAccessories" %>

<%@ Register Src="~/Pages/Journal/Accessories/AccessoriesTable.ascx" TagPrefix="uc" TagName="AccessoriesTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <dx:ASPxCallback ID="ASPxCallbackRefreshGrid" runat="server" ClientInstanceName="ASPxClientCallbackRefreshGrid" OnCallback="ASPxCallbackRefreshGrid_Callback">
        </dx:ASPxCallback>
        <asp:SqlDataSource ID="SqlDataSourceAccessoriesType" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [AccessoriesType] ORDER BY [Name]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAccessoriesProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], [Name], [Unit] FROM [AccessoriesProduct] WHERE ([AccessoriesTypeId] = @AccessoriesTypeId) ORDER BY [Name]">
            <SelectParameters>
                <asp:SessionParameter Name="AccessoriesTypeId" SessionField="AccessoriesTypeId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
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



        <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="900px">
            <Paddings PaddingBottom="15px" />
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Создать заявку">
                        <ClientSideEvents Click="function(s, e) {
                ASPxClientCallbackPanelShowPopup.PerformCallback();
}" />
                    </dx:ASPxButton>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="900px" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAccessories" KeyFieldName="Id">
            <SettingsEditing UseFormLayout="False">
            </SettingsEditing>
            <SettingsCommandButton>
                <ShowAdaptiveDetailButton ButtonType="Image">
                </ShowAdaptiveDetailButton>
                <HideAdaptiveDetailButton ButtonType="Image">
                </HideAdaptiveDetailButton>
            </SettingsCommandButton>
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" Width="20px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Заявка на дату" FieldName="DateDocument" VisibleIndex="2" Width="100px">
                    <PropertiesDateEdit DisplayFormatString="MMMM yyyy">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="AccessoriesDepartmentId" Visible="False" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Status" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Заявка" FieldName="AccessoriesTypeId" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="SqlDataSourceAccessoriesType" TextField="Name" ValueField="Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceAccessories" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Accessories] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Accessories] ([DateDocument], [AccessoriesDepartmentId], [Status], [AccessoriesTypeId]) VALUES (@DateDocument, @AccessoriesDepartmentId, @Status, @AccessoriesTypeId)" SelectCommand="SELECT * FROM [Accessories] WHERE (([AccessoriesDepartmentId] = @AccessoriesDepartmentId) AND ([AccessoriesTypeId] = @AccessoriesTypeId)) ORDER BY [DateDocument] DESC" UpdateCommand="UPDATE [Accessories] SET [DateDocument] = @DateDocument, [AccessoriesDepartmentId] = @AccessoriesDepartmentId, [Status] = @Status, [AccessoriesTypeId] = @AccessoriesTypeId WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DateDocument" Type="DateTime" />
                <asp:Parameter Name="AccessoriesDepartmentId" Type="Int32" />
                <asp:Parameter Name="Status" Type="Int32" />
                <asp:Parameter Name="AccessoriesTypeId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="AccessoriesDepartmentId" SessionField="AccessoriesDepartmentId" Type="Int32" />
                <asp:SessionParameter Name="AccessoriesTypeId" SessionField="AccessoriesTypeId" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DateDocument" Type="DateTime" />
                <asp:Parameter Name="AccessoriesDepartmentId" Type="Int32" />
                <asp:Parameter Name="Status" Type="Int32" />
                <asp:Parameter Name="AccessoriesTypeId" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <uc:AccessoriesTable runat="server" id="AccessoriesTable" />
</asp:Content>
