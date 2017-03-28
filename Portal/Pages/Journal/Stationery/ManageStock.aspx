<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/Stationery/StationeryMain.master" AutoEventWireup="true" CodeBehind="ManageStock.aspx.cs" Inherits="Portal.Pages.Journal.Stationery.ManageStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <dx:ASPxGridView ID="ASPxGridViewStationeryStock" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceStationeyStock" KeyFieldName="Id" OnInitNewRow="ASPxGridViewStationeryStock_InitNewRow" Width="800px" OnRowInserting="ASPxGridViewStationeryStock_RowInserting">
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
                <EditForm HorizontalAlign="WindowCenter" VerticalAlign="Above" Width="800px" />
            </SettingsPopup>
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="2" Caption="Наименование" Width="600px">
                    <EditFormSettings Caption="Наименование" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Unit" VisibleIndex="3" Caption="Ед.изм.">
                    <EditFormSettings Caption="Ед.изм." />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Price" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GroupId" Visible="False" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceStationeyStock" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Stationery] WHERE [Id] = @original_Id AND [Name] = @original_Name AND (([Unit] = @original_Unit) OR ([Unit] IS NULL AND @original_Unit IS NULL)) AND [Price] = @original_Price AND [GroupId] = @original_GroupId" InsertCommand="INSERT INTO [Stationery] ([Name], [Unit], [Price], [GroupId]) VALUES (@Name, @Unit, @Price, @GroupId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Stationery]" UpdateCommand="UPDATE [Stationery] SET [Name] = @Name, [Unit] = @Unit, [Price] = @Price, [GroupId] = @GroupId WHERE [Id] = @original_Id AND [Name] = @original_Name AND (([Unit] = @original_Unit) OR ([Unit] IS NULL AND @original_Unit IS NULL)) AND [Price] = @original_Price AND [GroupId] = @original_GroupId">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Unit" Type="String" />
                <asp:Parameter Name="original_Price" Type="Double" />
                <asp:Parameter Name="original_GroupId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Unit" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="GroupId" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Unit" Type="String" />
                <asp:Parameter Name="Price" Type="Double" />
                <asp:Parameter Name="GroupId" Type="Int32" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Unit" Type="String" />
                <asp:Parameter Name="original_Price" Type="Double" />
                <asp:Parameter Name="original_GroupId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
