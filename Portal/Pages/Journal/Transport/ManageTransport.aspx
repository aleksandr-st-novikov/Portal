<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/Transport/TransportMain.master" Async="true" AutoEventWireup="false" CodeBehind="ManageTransport.aspx.cs" Inherits="Portal.Pages.Journal.Transport.ManageTransport" %>

<%@ Register TagPrefix="uc" TagName="TransportReportViewPopup" Src="~/Reports/TransportReportViewPopup.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div style="margin-bottom: 10px;">
            <dx:ASPxLabel ID="ASPxLabelDepartment" runat="server" Font-Size="Large">
            </dx:ASPxLabel>
            <dx:ASPxCallback ID="ASPxCallbackRefreshData" runat="server" ClientInstanceName="ASPxClientCallbackRefreshData" OnCallback="ASPxCallbackRefreshData_Callback">
                <ClientSideEvents CallbackComplete="function(s, e) {
	                ASPxClientGridViewHeadDepartment.Refresh();
                }" />
            </dx:ASPxCallback>
        </div>
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Добавить запись" AutoPostBack="False">
            <ClientSideEvents Click="function(s, e) {
	            ASPxClientPopupControlAddRecord.Show();
            }" />
            <Image IconID="actions_driving_16x16devav">
            </Image>
        </dx:ASPxButton>
        <dx:ASPxButton ID="ASPxButtonPrint" runat="server" AutoPostBack="False" Text="Печать">
            <ClientSideEvents Click="function(s, e) {
                var dateFrom = ASPxClientDateEditGridFrom.GetValue();
                var dateTo = ASPxClientDateEditGridTo.GetValue();
                    ASPxClientCallbackPanelTransportReport.PerformCallback('Transport' + '|' + 
                        dateFrom.getDate() + '.' + (dateFrom.getMonth() + 1) + '.' + dateFrom.getFullYear() + '|' + 
                        dateTo.getDate() + '.' + (dateTo.getMonth() + 1) + '.' + dateTo.getFullYear());
            }" />
            <Image IconID="print_print_16x16office2013">
            </Image>
        </dx:ASPxButton>
        <table style="margin: 15px 0; width: 600px;">
            <tr>
                <td>
                    <dx:ASPxDateEdit ID="ASPxDateEditGridFrom" ClientInstanceName="ASPxClientDateEditGridFrom" runat="server" Caption="Период: с">
                        <CalendarProperties ShowClearButton="False">
                        </CalendarProperties>
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="ASPxDateEditGridTo" ClientInstanceName="ASPxClientDateEditGridTo" runat="server" Caption="по">
                        <CalendarProperties ShowClearButton="False">
                        </CalendarProperties>
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Обновить" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
	                        ASPxClientCallbackRefreshData.PerformCallback();
                        }" />
                        <Image IconID="actions_refresh_16x16office2013">
                        </Image>

                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
        <dx:ASPxGridView ID="ASPxGridViewHeadDepartment" runat="server" Width="1000px" AutoGenerateColumns="False" ClientInstanceName="ASPxClientGridViewHeadDepartment" DataSourceID="SqlDataSourceTransportHeadDepartment" KeyFieldName="Id" OnCellEditorInitialize="ASPxGridViewHeadDepartment_CellEditorInitialize">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
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
            <SettingsDataSecurity AllowInsert="False" />
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="900px" />
            </SettingsPopup>
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Caption=" " Width="50">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DateTransport" VisibleIndex="2" Caption="Дата" Width="80">
                    <PropertiesDateEdit>
                        <ValidationSettings>
                            <RequiredField ErrorText="Обязательное поле." IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Сотрудник" FieldName="EmployeeId" VisibleIndex="4" Width="370">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEmployeeHeadDepartment" TextField="FIO" ValueField="Id">
                        <ValidationSettings>
                            <RequiredField ErrorText="Обязательное поле." IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Подразделение" FieldName="DepartmentId" VisibleIndex="3" Width="200" Name="DepartmentId">
                    <PropertiesComboBox DataSourceID="SqlDataSourceDepartment" TextField="ShortName" ValueField="Id">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Адрес" FieldName="Address" VisibleIndex="5" Width="300px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceAddress" DropDownStyle="DropDown" MaxLength="300" TextField="Address" ValueField="Address">
                        <DropDownButton ClientVisible="False" Enabled="False" Visible="False">
                        </DropDownButton>
                        <ValidationSettings>
                            <RequiredField ErrorText="Обязательное поле." IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                    <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <FormatConditions>
                <dx:GridViewFormatConditionHighlight ApplyToRow="True" Expression="[DepartmentId] = 27">
                    <RowStyle Font-Bold="False" />
                </dx:GridViewFormatConditionHighlight>
            </FormatConditions>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceTransportHeadDepartment" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            DeleteCommand="DELETE FROM [Transport] WHERE [Id] = @original_Id AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND [DateTransport] = @original_DateTransport AND (([EmployeeId] = @original_EmployeeId) OR ([EmployeeId] IS NULL AND @original_EmployeeId IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL))"
            InsertCommand="INSERT INTO [Transport] ([Address], [DateTransport], [EmployeeId], [DepartmentId]) VALUES (@Address, @DateTransport, @EmployeeId, @DepartmentId)" OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT * FROM [Transport] WHERE (([DepartmentId] = @DepartmentId) AND ([DateTransport] BETWEEN @DateTransport AND @DateTransport2)) ORDER BY [DateTransport] DESC, [Id] DESC"
            UpdateCommand="UPDATE [Transport] SET [Address] = @Address, [DateTransport] = @DateTransport, [EmployeeId] = @EmployeeId, [DepartmentId] = @DepartmentId WHERE [Id] = @original_Id AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND [DateTransport] = @original_DateTransport AND (([EmployeeId] = @original_EmployeeId) OR ([EmployeeId] IS NULL AND @original_EmployeeId IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_DateTransport" Type="DateTime" />
                <asp:Parameter Name="original_EmployeeId" Type="Int32" />
                <asp:Parameter Name="original_DepartmentId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="DateTransport" Type="DateTime" />
                <asp:Parameter Name="EmployeeId" Type="Int32" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="Int32" />
                <asp:SessionParameter Name="DateTransport2" SessionField="DateTo" Type="DateTime" />
                <asp:SessionParameter Name="DateTransport" SessionField="DateFrom" Type="DateTime" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="DateTransport" Type="DateTime" />
                <asp:Parameter Name="EmployeeId" Type="Int32" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_DateTransport" Type="DateTime" />
                <asp:Parameter Name="original_EmployeeId" Type="Int32" />
                <asp:Parameter Name="original_DepartmentId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceTransportEntrance" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            DeleteCommand="DELETE FROM [Transport] WHERE [Id] = @original_Id AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND [DateTransport] = @original_DateTransport AND (([EmployeeId] = @original_EmployeeId) OR ([EmployeeId] IS NULL AND @original_EmployeeId IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL))"
            InsertCommand="INSERT INTO [Transport] ([Address], [DateTransport], [EmployeeId], [DepartmentId]) VALUES (@Address, @DateTransport, @EmployeeId, @DepartmentId)" OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT * FROM [Transport] WHERE (([DateTransport] BETWEEN @DateTransport AND @DateTransport2)) ORDER BY [DateTransport] DESC, [Id] DESC"
            UpdateCommand="UPDATE [Transport] SET [Address] = @Address, [DateTransport] = @DateTransport, [EmployeeId] = @EmployeeId, [DepartmentId] = @DepartmentId WHERE [Id] = @original_Id AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND [DateTransport] = @original_DateTransport AND (([EmployeeId] = @original_EmployeeId) OR ([EmployeeId] IS NULL AND @original_EmployeeId IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_DateTransport" Type="DateTime" />
                <asp:Parameter Name="original_EmployeeId" Type="Int32" />
                <asp:Parameter Name="original_DepartmentId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="DateTransport" Type="DateTime" />
                <asp:Parameter Name="EmployeeId" Type="Int32" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="DateTransport2" SessionField="DateTo" Type="DateTime" />
                <asp:SessionParameter Name="DateTransport" SessionField="DateFrom" Type="DateTime" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="DateTransport" Type="DateTime" />
                <asp:Parameter Name="EmployeeId" Type="Int32" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_DateTransport" Type="DateTime" />
                <asp:Parameter Name="original_EmployeeId" Type="Int32" />
                <asp:Parameter Name="original_DepartmentId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceEmployeeHeadDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            SelectCommand="SELECT [Id], CONCAT([Lastname], ' ', [Firstname], ' ', [Patronymic]) AS FIO FROM [Employee] WHERE ([IsWork] = @IsWork) AND ([DepartmentId] = @DepartmentId) ORDER BY [FIO]" OnInit="SqlDataSourceEmployeeHeadDepartment_Init">
            <SelectParameters>
                <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="Int32" />
                <asp:Parameter DefaultValue="True" Name="IsWork" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceEmployeeEntrance" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            SelectCommand="SELECT [Id], CONCAT([Lastname], ' ', [Firstname], ' ', [Patronymic]) AS FIO FROM [Employee] WHERE ([IsWork] = @IsWork) ORDER BY [FIO]">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="IsWork" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <dx:ASPxCallback ID="ASPxCallbackAdd" runat="server" ClientInstanceName="ASPxClientCallbackAdd" OnCallback="ASPxCallbackAdd_Callback">
            <ClientSideEvents CallbackComplete="function(s, e) {
                ASPxClientEdit.ClearEditorsInContainerById('clientContainer')
                ASPxClientPopupControlAddRecord.Hide();
                ASPxClientGridViewHeadDepartment.Refresh();
            }" />
        </dx:ASPxCallback>
        <asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            SelectCommand="SELECT [Id], [Name], ISNULL([ShortName],[Name]) AS [ShortName] FROM [Department] ORDER BY [Name], [ShortName]"></asp:SqlDataSource>
        <dx:ASPxPopupControl ID="ASPxPopupControlAddRecord" runat="server" AllowDragging="True" ClientInstanceName="ASPxClientPopupControlAddRecord" CloseOnEscape="True" HeaderText="Добавить запись" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalOffset="200" Width="700px">
            <ClientSideEvents Shown="function(s, e) {
	ASPxClientDateEditTransport.Focus();
}" />
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <div id="clientContainer">
                        <table style="width: 100%; margin: 15px 0 20px 0;">
                            <tr style="vertical-align: top;">
                                <td style="width: 40%;">
                                    <dx:ASPxDateEdit ID="ASPxDateEditTransport" runat="server" Caption="Дата" ClientInstanceName="ASPxClientDateEditTransport">
                                        <CaptionCellStyle Width="60px">
                                        </CaptionCellStyle>
                                        <ValidationSettings ValidationGroup="FormAddValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text" SetFocusOnError="True">
                                            <RequiredField ErrorText="Дата не указана." IsRequired="true" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </td>
                                <td style="width: 60%;">
                                    <dx:ASPxComboBox ID="ASPxComboBoxEmployee" runat="server" ValueType="System.String" Caption="Сотрудник" Width="100%" DataSourceID="SqlDataSourceEmployeeHeadDepartment" TextField="FIO" ValueField="Id" EnableClientSideAPI="True">
                                        <ValidationSettings ValidationGroup="FormAddValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                            <RequiredField ErrorText="Сотрудник не указан." IsRequired="true" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="padding-top: 10px;">
                                    <dx:ASPxComboBox ID="ASPxComboBoxAddress" runat="server" Caption="Адрес" DataSourceID="SqlDataSourceAddress" DropDownStyle="DropDown" TextField="Address" ValueField="Address" Width="100%">
                                        <DropDownButton ClientVisible="False" Enabled="False" Visible="False">
                                        </DropDownButton>
                                        <CaptionCellStyle Width="60px">
                                        </CaptionCellStyle>
                                        <ValidationSettings ValidationGroup="FormAddValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                            <RequiredField ErrorText="Вы не указали адрес." IsRequired="true" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <dx:ASPxPanel ID="ASPxPanel1" runat="server" RightToLeft="True" Width="100%">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <dx:ASPxButton ID="ASPxButton2" runat="server" AutoPostBack="False" Text="Отмена">
                                    <ClientSideEvents Click="function(s, e) {
	                                    ASPxClientPopupControlAddRecord.Hide();
                                    }" />
                                </dx:ASPxButton>
                                <dx:ASPxButton ID="ASPxButtonAdd" runat="server" AutoPostBack="False" Text="Сохранить" ValidationGroup="FormAddValidationGroup" ClientInstanceName="ASPxClientButtonAdd">
                                    <ClientSideEvents Click="function(s, e) {
                                        if(ASPxClientEdit.AreEditorsValid())
                                        {
                                            ASPxClientCallbackAdd.PerformCallback(); 
                                        }
                                    }" />
                                </dx:ASPxButton>
                                
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        <asp:SqlDataSource ID="SqlDataSourceAddress" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT DISTINCT [Address] FROM [Transport] ORDER BY [Address]"></asp:SqlDataSource>
    </div>

    <uc:TransportReportViewPopup ID="TransportReportViewPopup" runat="server" />

</asp:Content>
