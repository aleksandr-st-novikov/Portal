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
                            if(!ASPxClientCallbackRefreshGrid.InCallback())
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
                    <dx:ASPxButton ID="ASPxButtonCreate" runat="server" AutoPostBack="False" Text="Создать" Visible="False">
                        <ClientSideEvents Click="function(s, e) {
                            if(!ASPxClientCallbackPanelShowPopup.InCallback())
                                ASPxClientCallbackPanelShowPopup.PerformCallback();
                        }" />
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="ASPxButtonOpen" runat="server" AutoPostBack="False" Text="Открыть">
                        <ClientSideEvents Click="function(s, e) {
	 if(!ASPxClientCallbackPanelShowPopup.InCallback())
{
                                ASPxClientCallbackPanelShowPopup.PerformCallback('1');
}
}" />
                    </dx:ASPxButton>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
        <dx:ASPxGridView ID="ASPxGridViewAccessories" runat="server" Width="900px" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAccessories" KeyFieldName="Id" ClientInstanceName="ASPxClientGridViewAccessories" OnFocusedRowChanged="ASPxGridViewAccessories_FocusedRowChanged">
            <SettingsEditing UseFormLayout="False">
            </SettingsEditing>
            <SettingsCommandButton>
                <ShowAdaptiveDetailButton ButtonType="Image">
                </ShowAdaptiveDetailButton>
                <HideAdaptiveDetailButton ButtonType="Image">
                </HideAdaptiveDetailButton>
            </SettingsCommandButton>
            <SettingsBehavior AllowFocusedRow="True" ProcessFocusedRowChangedOnServer="True" />
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Заявка на период" FieldName="DateDocument" VisibleIndex="2" Width="70px">
                    <PropertiesDateEdit DisplayFormatString="MMMM yyyy">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="AccessoriesDepartmentId" Visible="False" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Кол-во" FieldName="Quantity" ReadOnly="True" VisibleIndex="5" Width="70px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Кол-во утв." FieldName="QuantityAgreed" ReadOnly="True" VisibleIndex="6" Width="70px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Категория" FieldName="AccessoriesTypeId" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="SqlDataSourceAccessoriesType" TextField="Name" ValueField="Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataCheckColumn Caption="Утв." FieldName="Status" VisibleIndex="1" Width="30px">
                </dx:GridViewDataCheckColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceAccessories" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Accessories] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Accessories] ([DateDocument], [AccessoriesDepartmentId], [Status], [AccessoriesTypeId]) VALUES (@DateDocument, @AccessoriesDepartmentId, @Status, @AccessoriesTypeId)" SelectCommand="SELECT Accessories.Id, Accessories.DateDocument, Accessories.AccessoriesDepartmentId, Accessories.Status, Accessories.AccessoriesTypeId, SUM(AccessoriesTable.Quantity) AS Quantity, SUM(AccessoriesTable.QuantityAgreed) AS QuantityAgreed FROM Accessories INNER JOIN AccessoriesTable ON Accessories.Id = AccessoriesTable.AccessoriesId WHERE (Accessories.AccessoriesDepartmentId = @AccessoriesDepartmentId) AND (Accessories.AccessoriesTypeId = @AccessoriesTypeId) GROUP BY Accessories.Id, Accessories.DateDocument, Accessories.AccessoriesDepartmentId, Accessories.Status, Accessories.AccessoriesTypeId ORDER BY Accessories.DateDocument DESC" UpdateCommand="UPDATE [Accessories] SET [DateDocument] = @DateDocument, [AccessoriesDepartmentId] = @AccessoriesDepartmentId, [Status] = @Status, [AccessoriesTypeId] = @AccessoriesTypeId WHERE [Id] = @Id">
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
