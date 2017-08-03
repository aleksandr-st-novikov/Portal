<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JobGrid.ascx.cs" Inherits="Portal.Pages.Maintenance.Schedule.JobGrid" %>
<dx:ASPxGridView ID="ASPxGridViewJob" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceJob" KeyFieldName="Id" Width="1200px" OnInitNewRow="ASPxGridViewJob_InitNewRow" OnRowInserting="ASPxGridViewJob_RowInserting" OnRowUpdating="ASPxGridViewJob_RowUpdating" ClientInstanceName="ASPxClientGridViewJob">
    <ClientSideEvents CustomButtonClick="function(s, e) {
	var key = s.GetRowKey(e.visibleIndex);
                    if(e.buttonID == 'Detail')
                    {
                        ASPxClientCallbackPanelDetail.PerformCallback(key);
                    }
}" />
    <SettingsEditing Mode="PopupEditForm">
    </SettingsEditing>
    <SettingsBehavior ConfirmDelete="True" />
    <SettingsPopup>
        <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="900px" />
    </SettingsPopup>
    <SettingsSearchPanel Visible="True" />
    <StylesPopup>
        <EditForm>
            <Header BackColor="WhiteSmoke">
            </Header>
        </EditForm>
    </StylesPopup>
    <Columns>
        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Width="20px">
            <CustomButtons>
                <dx:GridViewCommandColumnCustomButton ID="Detail" Text="История выполнения">
                    <Image IconID="actions_support_16x16devav">
                    </Image>
                </dx:GridViewCommandColumnCustomButton>
            </CustomButtons>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn Caption="Код" FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Расписание" FieldName="CronSchedule" ShowInCustomizationForm="True" VisibleIndex="4" Width="200px">
            <EditFormSettings VisibleIndex="1" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataCheckColumn Caption="Активное" FieldName="IsActive" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
            <EditFormSettings VisibleIndex="4" />
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn Caption="Выполняется" FieldName="IsAdded" ShowInCustomizationForm="True" VisibleIndex="6" Width="50px">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataTextColumn Caption="Параметры" FieldName="Parameters" ShowInCustomizationForm="True" VisibleIndex="7">
            <EditFormSettings ColumnSpan="2" VisibleIndex="3" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="Задание" FieldName="TaskListId" ShowInCustomizationForm="True" VisibleIndex="3" Width="400px" SortIndex="0" SortOrder="Ascending">
            <EditFormSettings VisibleIndex="0" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Статус" FieldName="Status" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataComboBoxColumn>
    </Columns>
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
    <FormatConditions>
        <dx:GridViewFormatConditionHighlight ApplyToRow="True" Expression="[Status] = 1">
        </dx:GridViewFormatConditionHighlight>
    </FormatConditions>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSourceJob" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Job] WHERE [Id] = @original_Id AND [TaskListId] = @original_TaskListId AND (([CronSchedule] = @original_CronSchedule) OR ([CronSchedule] IS NULL AND @original_CronSchedule IS NULL)) AND [Status] = @original_Status AND [IsActive] = @original_IsActive AND [IsAdded] = @original_IsAdded AND (([Parameters] = @original_Parameters) OR ([Parameters] IS NULL AND @original_Parameters IS NULL))" InsertCommand="INSERT INTO [Job] ([TaskListId], [CronSchedule], [Status], [IsActive], [IsAdded], [Parameters]) VALUES (@TaskListId, @CronSchedule, @Status, @IsActive, @IsAdded, @Parameters)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Job]" UpdateCommand="UPDATE [Job] SET [TaskListId] = @TaskListId, [CronSchedule] = @CronSchedule, [Status] = @Status, [IsActive] = @IsActive, [IsAdded] = @IsAdded, [Parameters] = @Parameters WHERE [Id] = @original_Id AND [TaskListId] = @original_TaskListId AND (([CronSchedule] = @original_CronSchedule) OR ([CronSchedule] IS NULL AND @original_CronSchedule IS NULL)) AND [Status] = @original_Status AND [IsActive] = @original_IsActive AND [IsAdded] = @original_IsAdded AND (([Parameters] = @original_Parameters) OR ([Parameters] IS NULL AND @original_Parameters IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_TaskListId" Type="Int32" />
        <asp:Parameter Name="original_CronSchedule" Type="String" />
        <asp:Parameter Name="original_Status" Type="Int32" />
        <asp:Parameter Name="original_IsActive" Type="Boolean" />
        <asp:Parameter Name="original_IsAdded" Type="Boolean" />
        <asp:Parameter Name="original_Parameters" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="TaskListId" Type="Int32" />
        <asp:Parameter Name="CronSchedule" Type="String" />
        <asp:Parameter Name="Status" Type="Int32" />
        <asp:Parameter Name="IsActive" Type="Boolean" />
        <asp:Parameter Name="IsAdded" Type="Boolean" />
        <asp:Parameter Name="Parameters" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="TaskListId" Type="Int32" />
        <asp:Parameter Name="CronSchedule" Type="String" />
        <asp:Parameter Name="Status" Type="Int32" />
        <asp:Parameter Name="IsActive" Type="Boolean" />
        <asp:Parameter Name="IsAdded" Type="Boolean" />
        <asp:Parameter Name="Parameters" Type="String" />
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_TaskListId" Type="Int32" />
        <asp:Parameter Name="original_CronSchedule" Type="String" />
        <asp:Parameter Name="original_Status" Type="Int32" />
        <asp:Parameter Name="original_IsActive" Type="Boolean" />
        <asp:Parameter Name="original_IsAdded" Type="Boolean" />
        <asp:Parameter Name="original_Parameters" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

