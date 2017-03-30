<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Employee/EmployeeMain.master" AutoEventWireup="true" CodeBehind="ManagePosition.aspx.cs" Inherits="Portal.Pages.Admin.Employee.ManagePosition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <dx:ASPxGridView ID="ASPxGridViewPosition" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcePosition" KeyFieldName="Id" Width="800px" OnInitNewRow="ASPxGridViewPosition_InitNewRow">
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
                <UpdateButton RenderMode="Button">
                </UpdateButton>
                <CancelButton RenderMode="Button">
                </CancelButton>
            </SettingsCommandButton>
            <SettingsPopup>
                <EditForm Modal="True" Width="800px" />
            </SettingsPopup>
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" Width="20px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Код" FieldName="Id" ReadOnly="True" VisibleIndex="1" Width="20px" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Наименование" FieldName="Name" VisibleIndex="2" Width="300px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="IsActive" Visible="False" VisibleIndex="3" Caption="Активна">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataCheckColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourcePosition" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Position] WHERE [Id] = @original_Id AND [Name] = @original_Name AND [IsActive] = @original_IsActive" InsertCommand="INSERT INTO [Position] ([Name], [IsActive]) VALUES (@Name, @IsActive)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Position] ORDER BY [Name]" UpdateCommand="UPDATE [Position] SET [Name] = @Name, [IsActive] = @IsActive WHERE [Id] = @original_Id AND [Name] = @original_Name AND [IsActive] = @original_IsActive">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_IsActive" Type="Boolean" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_IsActive" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
