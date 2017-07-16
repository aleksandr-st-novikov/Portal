<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Maintenance/DepartmentWork/DepartmentWorkMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageDepartmentWork.aspx.cs" Inherits="Portal.Pages.Maintenance.DepartmentWork.ManageDepartmentWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div style="margin-bottom: 10px;">
            <dx:ASPxLabel ID="ASPxLabelDepartmentWork" runat="server" Font-Size="Large">
            </dx:ASPxLabel>
        </div>
        <div style="margin-bottom: 10px;">
            <dx:ASPxButton ID="ASPxButtonAddWork" runat="server" Text="Добавить" AutoPostBack="False">
                <ClientSideEvents Click="function(s, e) {
	if(!ASPxClientCallbackPanelAddWork.InCallback())
                ASPxClientCallbackPanelAddWork.PerformCallback();
}" />
            </dx:ASPxButton>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], concat([Lastname], ' ', left([Firstname],1), '.', left([Patronymic],1), '.') as FIO, [DepartmentId] FROM [Employee] WHERE (([IsWork] = @IsWork) AND ([DepartmentId] = @DepartmentId))">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="True" Name="IsWork" Type="Boolean" />
                                    <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
        <dx:ASPxTimer ID="ASPxTimerDepartmentWork" runat="server">
            <ClientSideEvents Tick="function(s, e) {
	ASPxClientGridViewWorkInWork.Refresh();
}" />
        </dx:ASPxTimer>
        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%">
            <TabPages>
                <dx:TabPage Text="В работе">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxGridView ID="ASPxGridViewWorkInWork" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDepartmentWorkInWork" KeyFieldName="Id" Width="1200px" ClientInstanceName="ASPxClientGridViewWorkInWork" Font-Size="Small">
                                <ClientSideEvents CustomButtonClick="function(s, e) {
	var key = s.GetRowKey(e.visibleIndex);
                                    ASPxClientHiddenFieldId.Set('Id', key);
       ASPxClientPopupControlCloseWork.Show();
                                    
}" />
                                <SettingsEditing Mode="PopupEditForm">
                                </SettingsEditing>
                                <SettingsDataSecurity AllowInsert="False" />
                                <SettingsPopup>
                                    <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="900px" />
                                </SettingsPopup>
                                <SettingsSearchPanel Visible="True" />
                                <SettingsLoadingPanel Mode="Disabled" />
                                <StylesPopup>
                                    <EditForm>
                                        <Header BackColor="WhiteSmoke">
                                        </Header>
                                    </EditForm>
                                </StylesPopup>
                                <Columns>
                                    <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Caption=" " ShowDeleteButton="True" Width="30px">
                                        <CustomButtons>
                                            <dx:GridViewCommandColumnCustomButton ID="WorkClose" Text="Закрыть заявку">
                                                <Image IconID="programming_ide_16x16office2013">
                                                </Image>
                                            </dx:GridViewCommandColumnCustomButton>
                                        </CustomButtons>
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Код">
                                        <EditFormSettings Visible="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="RegisterUserId" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn FieldName="RegisterDate" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Дата регистрации" Width="130px">
                                        <PropertiesDateEdit DisplayFormatString="g">
                                        </PropertiesDateEdit>
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataDateColumn FieldName="CloseDate" ShowInCustomizationForm="True" VisibleIndex="7" Visible="False">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn FieldName="FromWhom" ShowInCustomizationForm="True" VisibleIndex="4" Caption="От кого заявка" Width="170px">
                                        <PropertiesTextEdit>
                                            <ValidationSettings Display="Dynamic" ValidationGroup="EditForm">
                                                <RequiredField ErrorText="Обязательно для заполнения" IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                        <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CloseUserId" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CloseDescription" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="DepartmentId" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="Кто принял" FieldName="RegisterEmployeeId" ShowInCustomizationForm="False" VisibleIndex="6">
                                        <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" TextField="FIO" ValueField="Id">
                                        </PropertiesComboBox>
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataMemoColumn Caption="Описание" FieldName="RegisterDescription" ShowInCustomizationForm="True" VisibleIndex="5" Width="350px">
                                        <PropertiesMemoEdit Height="100px" Width="100%">
                                            <ValidationSettings Display="Dynamic" ValidationGroup="&lt;DeleteButton&gt;">
                                                <RequiredField ErrorText="Обязательно для заполнения" IsRequired="True" />
                                            </ValidationSettings>
                                        </PropertiesMemoEdit>
                                        <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                                    </dx:GridViewDataMemoColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="Ответственный" FieldName="CloseEmployeeId" ShowInCustomizationForm="True" VisibleIndex="9">
                                        <PropertiesComboBox AllowNull="True" DataSourceID="SqlDataSourceEmployee" TextField="FIO" ValueField="Id">
                                            <ClearButton DisplayMode="OnHover">
                                            </ClearButton>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                </Columns>
                                <SettingsBehavior ConfirmDelete="True" />
                                <SettingsCommandButton>
                                    <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                    <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
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
                            </dx:ASPxGridView>
                            
                            <asp:SqlDataSource ID="SqlDataSourceDepartmentWorkInWork" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [DepartmentWork] WHERE [Id] = @Id" InsertCommand="INSERT INTO [DepartmentWork] ([RegisterUserId], [RegisterEmployeeId], [RegisterDate], [CloseDate], [FromWhom], [RegisterDescription], [CloseUserId], [CloseEmployeeId], [CloseDescription], [DepartmentId]) VALUES (@RegisterUserId, @RegisterEmployeeId, @RegisterDate, @CloseDate, @FromWhom, @RegisterDescription, @CloseUserId, @CloseEmployeeId, @CloseDescription, @DepartmentId)" SelectCommand="SELECT * FROM [DepartmentWork] WHERE (([DepartmentId] = @DepartmentId) AND ([CloseDate] IS NULL))" UpdateCommand="UPDATE [DepartmentWork] SET [RegisterUserId] = @RegisterUserId, [RegisterEmployeeId] = @RegisterEmployeeId, [RegisterDate] = @RegisterDate, [CloseDate] = @CloseDate, [FromWhom] = @FromWhom, [RegisterDescription] = @RegisterDescription, [CloseUserId] = @CloseUserId, [CloseEmployeeId] = @CloseEmployeeId, [CloseDescription] = @CloseDescription, [DepartmentId] = @DepartmentId WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="RegisterUserId" Type="String" />
                                    <asp:Parameter Name="RegisterEmployeeId" Type="Int32" />
                                    <asp:Parameter Name="RegisterDate" Type="DateTime" />
                                    <asp:Parameter Name="CloseDate" Type="DateTime" />
                                    <asp:Parameter Name="FromWhom" Type="String" />
                                    <asp:Parameter Name="RegisterDescription" Type="String" />
                                    <asp:Parameter Name="CloseUserId" Type="String" />
                                    <asp:Parameter Name="CloseEmployeeId" Type="Int32" />
                                    <asp:Parameter Name="CloseDescription" Type="String" />
                                    <asp:Parameter Name="DepartmentId" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="RegisterUserId" Type="String" />
                                    <asp:Parameter Name="RegisterEmployeeId" Type="Int32" />
                                    <asp:Parameter Name="RegisterDate" Type="DateTime" />
                                    <asp:Parameter Name="CloseDate" Type="DateTime" />
                                    <asp:Parameter Name="FromWhom" Type="String" />
                                    <asp:Parameter Name="RegisterDescription" Type="String" />
                                    <asp:Parameter Name="CloseUserId" Type="String" />
                                    <asp:Parameter Name="CloseEmployeeId" Type="Int32" />
                                    <asp:Parameter Name="CloseDescription" Type="String" />
                                    <asp:Parameter Name="DepartmentId" Type="Int32" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Завершено">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxGridView ID="ASPxGridViewWorkClose" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxClientGridViewWorkClose" DataSourceID="SqlDataSourceWorkClose" KeyFieldName="Id" Width="1200px">
                                <SettingsEditing Mode="PopupEditForm">
                                </SettingsEditing>
                                <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                                <SettingsPopup>
                                    <EditForm HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" Width="900px" Modal="True" />
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
                                    <EditButton>
                                        <Image ToolTip="Редактировать" IconID="edit_edit_16x16office2013" />
                                    </EditButton>
                                    <UpdateButton RenderMode="Button">
                                    </UpdateButton>
                                    <CancelButton RenderMode="Button">
                                    </CancelButton>
                                </SettingsCommandButton>
                                <Columns>
                                    <dx:GridViewCommandColumn Caption=" " ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Width="30px">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="Код" FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="30px">
                                        <EditFormSettings Visible="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="RegisterUserId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn Caption="Дата регистрации" FieldName="RegisterDate" ShowInCustomizationForm="True" VisibleIndex="4" ReadOnly="True" Width="50px">
                                        <PropertiesDateEdit DisplayFormatString="g">
                                            <DropDownButton Visible="False">
                                            </DropDownButton>
                                        </PropertiesDateEdit>
                                        <EditFormSettings VisibleIndex="1" />
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataDateColumn Caption="Дата закрытия" FieldName="CloseDate" ShowInCustomizationForm="True" VisibleIndex="5" ReadOnly="True" Width="50px">
                                        <PropertiesDateEdit DisplayFormatString="g">
                                            <DropDownButton Visible="False">
                                            </DropDownButton>
                                        </PropertiesDateEdit>
                                        <EditFormSettings VisibleIndex="2" />
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Caption="От кого заявка" FieldName="FromWhom" ShowInCustomizationForm="True" VisibleIndex="6" ReadOnly="True" Width="150px">
                                        <EditFormSettings ColumnSpan="2" VisibleIndex="0" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CloseUserId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="DepartmentId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataMemoColumn Caption="Описание решения" FieldName="CloseDescription" ShowInCustomizationForm="True" VisibleIndex="10">
                                        <PropertiesMemoEdit Height="100px">
                                            <ValidationSettings>
                                                <RequiredField ErrorText="" />
                                            </ValidationSettings>
                                        </PropertiesMemoEdit>
                                        <EditFormSettings ColumnSpan="2" VisibleIndex="6" />
                                    </dx:GridViewDataMemoColumn>
                                    <dx:GridViewDataMemoColumn Caption="Описание" FieldName="RegisterDescription" ShowInCustomizationForm="True" VisibleIndex="7" ReadOnly="True">
                                        <PropertiesMemoEdit Height="100px">
                                        </PropertiesMemoEdit>
                                        <EditFormSettings ColumnSpan="2" VisibleIndex="5" />
                                    </dx:GridViewDataMemoColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="Кто принял" FieldName="RegisterEmployeeId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" ReadOnly="True">
                                        <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" TextField="FIO" ValueField="Id" DropDownStyle="DropDown">
                                            <DropDownButton Visible="False">
                                            </DropDownButton>
                                        </PropertiesComboBox>
                                        <EditFormSettings Visible="True" VisibleIndex="3" />
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="Ответственный" FieldName="CloseEmployeeId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                        <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" TextField="FIO" ValueField="Id" DropDownStyle="DropDown">
                                            <DropDownButton Visible="False">
                                            </DropDownButton>
                                        </PropertiesComboBox>
                                        <EditFormSettings Visible="True" VisibleIndex="4" />
                                    </dx:GridViewDataComboBoxColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="SqlDataSourceWorkClose" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [DepartmentWork] WHERE [Id] = @Id" InsertCommand="INSERT INTO [DepartmentWork] ([RegisterUserId], [RegisterEmployeeId], [RegisterDate], [CloseDate], [FromWhom], [RegisterDescription], [CloseUserId], [CloseEmployeeId], [CloseDescription], [DepartmentId]) VALUES (@RegisterUserId, @RegisterEmployeeId, @RegisterDate, @CloseDate, @FromWhom, @RegisterDescription, @CloseUserId, @CloseEmployeeId, @CloseDescription, @DepartmentId)" SelectCommand="SELECT * FROM [DepartmentWork] WHERE (([CloseDate] IS NOT NULL) AND ([DepartmentId] = @DepartmentId)) ORDER BY [CloseDate] DESC" UpdateCommand="UPDATE [DepartmentWork] SET [RegisterUserId] = @RegisterUserId, [RegisterEmployeeId] = @RegisterEmployeeId, [RegisterDate] = @RegisterDate, [CloseDate] = @CloseDate, [FromWhom] = @FromWhom, [RegisterDescription] = @RegisterDescription, [CloseUserId] = @CloseUserId, [CloseEmployeeId] = @CloseEmployeeId, [CloseDescription] = @CloseDescription, [DepartmentId] = @DepartmentId WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="RegisterUserId" Type="String" />
                                    <asp:Parameter Name="RegisterEmployeeId" Type="Int32" />
                                    <asp:Parameter Name="RegisterDate" Type="DateTime" />
                                    <asp:Parameter Name="CloseDate" Type="DateTime" />
                                    <asp:Parameter Name="FromWhom" Type="String" />
                                    <asp:Parameter Name="RegisterDescription" Type="String" />
                                    <asp:Parameter Name="CloseUserId" Type="String" />
                                    <asp:Parameter Name="CloseEmployeeId" Type="Int32" />
                                    <asp:Parameter Name="CloseDescription" Type="String" />
                                    <asp:Parameter Name="DepartmentId" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="RegisterUserId" Type="String" />
                                    <asp:Parameter Name="RegisterEmployeeId" Type="Int32" />
                                    <asp:Parameter Name="RegisterDate" Type="DateTime" />
                                    <asp:Parameter Name="CloseDate" Type="DateTime" />
                                    <asp:Parameter Name="FromWhom" Type="String" />
                                    <asp:Parameter Name="RegisterDescription" Type="String" />
                                    <asp:Parameter Name="CloseUserId" Type="String" />
                                    <asp:Parameter Name="CloseEmployeeId" Type="Int32" />
                                    <asp:Parameter Name="CloseDescription" Type="String" />
                                    <asp:Parameter Name="DepartmentId" Type="Int32" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
        </dx:ASPxPageControl>
        <dx:ASPxCallbackPanel ID="ASPxCallbackPanelAddWork" runat="server" Width="200px" ClientInstanceName="ASPxClientCallbackPanelAddWork">
            <SettingsLoadingPanel Enabled="False" />
            <ClientSideEvents EndCallback="function(s, e) {
	ASPxClientPopupControlAddWork.Show();
}" />
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxPopupControl ID="ASPxPopupControlAddWork" runat="server" HeaderText="Добавить задание" Modal="True" AllowDragging="True" ClientInstanceName="ASPxClientPopupControlAddWork" CloseOnEscape="True" PopupHorizontalAlign="WindowCenter" Width="900px" PopupVerticalAlign="WindowCenter">
                        <HeaderStyle BackColor="WhiteSmoke" />
                        <ContentCollection>
                            <dx:PopupControlContentControl runat="server">
                                <dx:ASPxComboBox ID="ASPxComboBoxFromWhom" runat="server" Caption="От кого заявка" DataSourceID="SqlDataSourceFromWhom" DropDownStyle="DropDown" TextField="FromWhom" ValueField="FromWhom" Width="100%">
                                    <DropDownButton Visible="False">
                                    </DropDownButton>
                                    <CaptionSettings Position="Top" />
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="AddWorkForm">
                                        <RequiredField ErrorText="Обязательно для заполнения" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SqlDataSourceFromWhom" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT DISTINCT [FromWhom] FROM [DepartmentWork] ORDER BY [FromWhom]"></asp:SqlDataSource>
                                <dx:ASPxMemo ID="ASPxMemoDescription" runat="server" Caption="Описание" Height="150px" Width="100%">
                                    <CaptionSettings Position="Top" />
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="AddWorkForm">
                                        <RequiredField ErrorText="Обязательно для заполнения" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxMemo>
                                <dx:ASPxPanel ID="ASPxPanel1" runat="server" RightToLeft="True" Width="100%">
                                    <Styles>
                                        <Panel>
                                            <Paddings PaddingBottom="10px" PaddingTop="20px" />
                                        </Panel>
                                    </Styles>
                                    <PanelCollection>
                                        <dx:PanelContent runat="server">
                                            <dx:ASPxButton ID="ASPxButtonClose" runat="server" AutoPostBack="False" ClientInstanceName="ASPxClientButtonClose" Text="Отмена">
                                                <ClientSideEvents Click="function(s, e) {
	ASPxClientPopupControlAddWork.Hide();
}" />
                                            </dx:ASPxButton>
                                            <dx:ASPxButton ID="ASPxButtonSave" runat="server" ClientInstanceName="ASPxClientButtonSave" Text="Сохранить" ValidationGroup="AddWorkForm" AutoPostBack="False">
                                                <ClientSideEvents Click="function(s, e) {
	if(ASPxClientEdit.AreEditorsValid())
{
ASPxClientCallbackSaveWork.PerformCallback(); 
}
}" />
                                            </dx:ASPxButton>

                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxPanel>
                            </dx:PopupControlContentControl>
                        </ContentCollection>
                    </dx:ASPxPopupControl>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
        <dx:ASPxCallback ID="ASPxCallbackSaveWork" runat="server" ClientInstanceName="ASPxClientCallbackSaveWork" OnCallback="ASPxCallbackSaveWork_Callback">
            <ClientSideEvents CallbackComplete="function(s, e) {
ASPxClientEdit.ClearEditorsInContainerById('clientContainer')
ASPxClientPopupControlAddWork.Hide();
ASPxClientGridViewWorkInWork.Refresh();
}" />
        </dx:ASPxCallback>
        <dx:ASPxPopupControl ID="ASPxPopupControlCloseWork" runat="server" ClientInstanceName="ASPxClientPopupControlCloseWork" CloseOnEscape="True" HeaderText="Закрыть заявку" Modal="True" Width="900px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
            <HeaderStyle BackColor="WhiteSmoke" />
            <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxMemo ID="ASPxMemoCloseDescription" runat="server" Caption="Описание решения" ClientInstanceName="ASPxClientMemoCloseDescription" Height="150px" Width="100%">
        <CaptionSettings Position="Top" />
    </dx:ASPxMemo>
    <dx:ASPxHiddenField ID="ASPxHiddenFieldId" runat="server" ClientInstanceName="ASPxClientHiddenFieldId">
    </dx:ASPxHiddenField>
    <dx:ASPxPanel ID="ASPxPanel2" runat="server" RightToLeft="True" Width="100%">
        <Styles>
            <Panel>
                <Paddings PaddingBottom="10px" PaddingTop="20px" />
            </Panel>
        </Styles>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxButton ID="ASPxButtonCancelClose" runat="server" Text="Отмена" AutoPostBack="False" ClientInstanceName="ASPxClientButtonCancelClose">
                    <ClientSideEvents Click="function(s, e) {
	ASPxClientPopupControlCloseWork.Hide();
}" />
                </dx:ASPxButton>
                <dx:ASPxButton ID="ASPxButtonSaveClose" runat="server" Text="Сохранить" AutoPostBack="False" ClientInstanceName="ASPxClientButtonSaveClose">
                    <ClientSideEvents Click="function(s, e) {
                        if(ASPxClientEdit.AreEditorsValid())
{
	ASPxClientCallbackSaveClose.PerformCallback();
                        }
}" />
                </dx:ASPxButton>
                <dx:ASPxCallback ID="ASPxCallbackSaveClose" runat="server" ClientInstanceName="ASPxClientCallbackSaveClose" OnCallback="ASPxCallbackSaveClose_Callback">
                    <ClientSideEvents CallbackComplete="function(s, e) {
                ASPxClientEdit.ClearEditorsInContainerById('clientContainer')
ASPxClientHiddenFieldId.Set('Id','');
ASPxClientPopupControlCloseWork.Hide();
ASPxClientGridViewWorkInWork.Refresh();
ASPxClientGridViewWorkClose.Refresh();
}" />
                </dx:ASPxCallback>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
                </dx:PopupControlContentControl>
</ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
