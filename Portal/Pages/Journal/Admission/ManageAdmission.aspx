﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/Admission/AdmissionMain.master" AutoEventWireup="true" CodeBehind="ManageAdmission.aspx.cs" Inherits="Portal.Pages.Journal.Admission.ManageAdmission" Async="true" %>

<%@ Register TagPrefix="uc" TagName="AdmissionReportViewPopup" Src="~/Reports/AdmissionReportViewPopup.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxCallback ID="ASPxCallbackImportEmployee" runat="server" ClientInstanceName="ASPxClientCallbackImportEmployee" OnCallback="ASPxCallbackImportEmployee_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {
	            ASPxClientLoadingPanelLoad.Hide();
                ASPxClientGridViewAdmission.Refresh();
            }" />
    </dx:ASPxCallback>
    <div class="content">
        <div style="margin-bottom: 10px;">
            <dx:ASPxLabel ID="ASPxLabelDepartment" runat="server" Font-Size="Large">
            </dx:ASPxLabel>
        </div>
        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="500px" RightToLeft="False">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxButton ID="ASPxButtonPopulateEmployee" runat="server" Text="Заполнить сотрудников" AutoPostBack="False" UseSubmitBehavior="False">
                        <ClientSideEvents Click="function(s, e) {
                                ASPxClientCallbackImportEmployee.PerformCallback();
	                            ASPxClientLoadingPanelLoad.Show();
                            }" />
                        <Image IconID="actions_reset_16x16office2013">
                        </Image>
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="ASPxButtonShowReportParams" runat="server" AutoPostBack="False" ClientInstanceName="ASPxClientButtonShowReportParams" Text="Отчет" UseSubmitBehavior="False">
                        <ClientSideEvents Click="function(s, e) {
	                            ASPxClientPopupControlReportParams.Show();
                            }" />
                        <Image IconID="export_exportfile_16x16office2013">
                        </Image>
                    </dx:ASPxButton>
                    <dx:ASPxPopupControl ID="ASPxPopupControlReportParams" runat="server" ClientInstanceName="ASPxClientPopupControlReportParams" HeaderText="Параметры отчета" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalOffset="100" Width="410px" OnLoad="ASPxPopupControlReportParams_Load">
                        <ContentCollection>
                            <dx:PopupControlContentControl runat="server">
                                <dx:ASPxPanel ID="ASPxPanel2" runat="server" RightToLeft="False" Width="100%">
                                    <PanelCollection>
                                        <dx:PanelContent runat="server">
                                            <dx:ASPxPanel ID="ASPxPanel4" runat="server" Width="100%">
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <table style="width: 100%; margin: 15px 0 20px 0;">
                                                            <tr style="vertical-align:top;">
                                                                <td style="width: 50%; padding-left: 10px;">
                                                                    <dx:ASPxDateEdit ID="ASPxDateEditFrom" runat="server" ClientInstanceName="ASPxClientDateEditFrom" CssClass="btnInline" Caption="Период с">
                                                                        <ValidationSettings ValidationGroup="FormValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RequiredField ErrorText="Дата не указана." IsRequired="true" />
                                                                        </ValidationSettings>
                                                                    </dx:ASPxDateEdit>
                                                                </td>
                                                                <td style="width: 50%; text-align: right; padding-left: 30px;">
                                                                    <dx:ASPxDateEdit ID="ASPxDateEditTo" runat="server" ClientInstanceName="ASPxClientDateEditTo" CssClass="btnInline" Caption="по">
                                                                        <ValidationSettings ValidationGroup="FormValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                                                            <RequiredField ErrorText="Дата не указана." IsRequired="true" />
                                                                        </ValidationSettings>
                                                                    </dx:ASPxDateEdit>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxPanel>
                                            <dx:ASPxPanel ID="ASPxPanel3" runat="server" RightToLeft="True" Width="100%">
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <dx:ASPxButton ID="ASPxButtonCancel" runat="server" AutoPostBack="False" Text="Отмена">
                                                            <ClientSideEvents Click="function(s, e) {
	                                                                ASPxClientPopupControlReportParams.Hide();
                                                                }" />
                                                        </dx:ASPxButton>
                                                        <dx:ASPxButton ID="ASPxButtonShowReport" runat="server" AutoPostBack="False" Text="Показать">
                                                            <ClientSideEvents Click="function(s, e) {
                                                                var dateFrom = ASPxClientDateEditFrom.GetValue();
                                                                var dateTo = ASPxClientDateEditTo.GetValue();
                                                                    ASPxClientCallbackPanelAdmissionReport.PerformCallback('Admission' + '|' + 
                                                                        dateFrom.getDate() + '.' + (dateFrom.getMonth() + 1) + '.' + dateFrom.getFullYear() + '|' + 
                                                                        dateTo.getDate() + '.' + (dateTo.getMonth() + 1) + '.' + dateTo.getFullYear());
                                                                    ASPxClientPopupControlReportParams.Hide();
                                                                }" />
                                                        </dx:ASPxButton>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxPanel>
                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxPanel>
                            </dx:PopupControlContentControl>
                        </ContentCollection>
                    </dx:ASPxPopupControl>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
        <dx:ASPxGridView ID="ASPxGridViewAdmission" ClientInstanceName="ASPxClientGridViewAdmission" runat="server" DataSourceID="SqlDataSourceAdmission" AutoGenerateColumns="False" KeyFieldName="Id" Width="100%" Font-Size="Small">
            <SettingsPager PageSize="10000" Mode="EndlessPaging">
            </SettingsPager>
            <SettingsEditing Mode="Batch">
                <BatchEditSettings EditMode="Row" />
            </SettingsEditing>
            <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" />
            <SettingsBehavior AllowGroup="False" />
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
                <UpdateButton>
                    <Image ToolTip="Сохранить" IconID="actions_save_16x16devav" />
                </UpdateButton>
                <CancelButton>
                    <Image ToolTip="Отмена" IconID="actions_cancel_16x16office2013" />
                </CancelButton>
            </SettingsCommandButton>
            <SettingsDataSecurity AllowInsert="False" AllowDelete="False" />
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Caption=" " Width="20px" Visible="False">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DateFlu" VisibleIndex="4" Caption="Дата флюорографии" Width="120px">
                    <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="NumFlu" VisibleIndex="5" Caption="Номер флюорографии" Width="120px">
                    <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Dopusk" VisibleIndex="6" Caption="Допуск" Width="120px">
                    <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="SanMin" VisibleIndex="7" Caption="Сан. минимум" Width="120px">
                    <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Commentary" VisibleIndex="9" Caption="Комментарий" Width="120px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="ФИО" FieldName="EmployeeId" VisibleIndex="2" Width="280px" ReadOnly="True" ShowInCustomizationForm="False">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" TextField="FIO" ValueField="Id">
                        <DropDownButton ClientVisible="False" Enabled="False" Visible="False">
                        </DropDownButton>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Должность" FieldName="PositionId" VisibleIndex="3" Width="200px" ReadOnly="True">
                    <PropertiesComboBox DataSourceID="SqlDataSourcePosition" TextField="Name" ValueField="Id">
                        <DropDownButton Visible="False">
                        </DropDownButton>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn Caption="Мед. осмотр" FieldName="MedOsm" VisibleIndex="8" Width="120px">
                    <EditFormCaptionStyle HorizontalAlign="Center" Wrap="True">
                    </EditFormCaptionStyle>
                </dx:GridViewDataDateColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceAdmission" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            DeleteCommand="DELETE FROM [Admission] WHERE [Id] = @original_Id AND (([DateFlu] = @original_DateFlu) OR ([DateFlu] IS NULL AND @original_DateFlu IS NULL)) AND (([NumFlu] = @original_NumFlu) OR ([NumFlu] IS NULL AND @original_NumFlu IS NULL)) AND (([Dopusk] = @original_Dopusk) OR ([Dopusk] IS NULL AND @original_Dopusk IS NULL)) AND (([SanMin] = @original_SanMin) OR ([SanMin] IS NULL AND @original_SanMin IS NULL)) AND (([Commentary] = @original_Commentary) OR ([Commentary] IS NULL AND @original_Commentary IS NULL)) AND (([EmployeeId] = @original_EmployeeId) OR ([EmployeeId] IS NULL AND @original_EmployeeId IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL)) AND (([PositionId] = @original_PositionId) OR ([PositionId] IS NULL AND @original_PositionId IS NULL)) AND (([MedOsm] = @original_MedOsm) OR ([MedOsm] IS NULL AND @original_MedOsm IS NULL)) AND [IsWork] = @original_IsWork"
            InsertCommand="INSERT INTO [Admission] ([DateFlu], [NumFlu], [Dopusk], [SanMin], [Commentary], [EmployeeId], [DepartmentId], [PositionId], [MedOsm], [IsWork]) VALUES (@DateFlu, @NumFlu, @Dopusk, @SanMin, @Commentary, @EmployeeId, @DepartmentId, @PositionId, @MedOsm, @IsWork)" OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT * FROM [Admission] WHERE (([DepartmentId] = @DepartmentId) AND ([IsWork] = @IsWork))"
            UpdateCommand="UPDATE [Admission] SET [DateFlu] = @DateFlu, [NumFlu] = @NumFlu, [Dopusk] = @Dopusk, [SanMin] = @SanMin, [Commentary] = @Commentary, [MedOsm] = @MedOsm WHERE [Id] = @original_Id AND (([DateFlu] = @original_DateFlu) OR ([DateFlu] IS NULL AND @original_DateFlu IS NULL)) AND (([NumFlu] = @original_NumFlu) OR ([NumFlu] IS NULL AND @original_NumFlu IS NULL)) AND (([Dopusk] = @original_Dopusk) OR ([Dopusk] IS NULL AND @original_Dopusk IS NULL)) AND (([SanMin] = @original_SanMin) OR ([SanMin] IS NULL AND @original_SanMin IS NULL)) AND (([Commentary] = @original_Commentary) OR ([Commentary] IS NULL AND @original_Commentary IS NULL)) AND (([MedOsm] = @original_MedOsm) OR ([MedOsm] IS NULL AND @original_MedOsm IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_DateFlu" Type="DateTime" />
                <asp:Parameter Name="original_NumFlu" Type="String" />
                <asp:Parameter Name="original_Dopusk" Type="DateTime" />
                <asp:Parameter Name="original_SanMin" Type="DateTime" />
                <asp:Parameter Name="original_Commentary" Type="String" />
                <asp:Parameter Name="original_EmployeeId" Type="Int32" />
                <asp:Parameter Name="original_DepartmentId" Type="Int32" />
                <asp:Parameter Name="original_PositionId" Type="Int32" />
                <asp:Parameter Name="original_MedOsm" Type="DateTime" />
                <asp:Parameter Name="original_IsWork" Type="Boolean" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DateFlu" Type="DateTime" />
                <asp:Parameter Name="NumFlu" Type="String" />
                <asp:Parameter Name="Dopusk" Type="DateTime" />
                <asp:Parameter Name="SanMin" Type="DateTime" />
                <asp:Parameter Name="Commentary" Type="String" />
                <asp:Parameter Name="EmployeeId" Type="Int32" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
                <asp:Parameter Name="PositionId" Type="Int32" />
                <asp:Parameter Name="MedOsm" Type="DateTime" />
                <asp:Parameter Name="IsWork" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="String" />
                <asp:Parameter DefaultValue="True" Name="IsWork" Type="Boolean" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DateFlu" Type="DateTime" />
                <asp:Parameter Name="NumFlu" Type="String" />
                <asp:Parameter Name="Dopusk" Type="DateTime" />
                <asp:Parameter Name="SanMin" Type="DateTime" />
                <asp:Parameter Name="Commentary" Type="String" />
                <asp:Parameter Name="MedOsm" Type="DateTime" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_DateFlu" Type="DateTime" />
                <asp:Parameter Name="original_NumFlu" Type="String" />
                <asp:Parameter Name="original_Dopusk" Type="DateTime" />
                <asp:Parameter Name="original_SanMin" Type="DateTime" />
                <asp:Parameter Name="original_Commentary" Type="String" />
                <asp:Parameter Name="original_MedOsm" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            SelectCommand="SELECT [Id], CONCAT([Lastname], ' ', [Firstname], ' ', [Patronymic]) AS FIO FROM [Employee] ORDER BY [FIO]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcePosition" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], [Name] FROM [Position] WHERE ([IsActive] = @IsActive) ORDER BY [Name]">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
    <dx:ASPxLoadingPanel ID="ASPxLoadingPanelLoad" runat="server" ClientInstanceName="ASPxClientLoadingPanelLoad" Modal="True">
    </dx:ASPxLoadingPanel>

    <uc:AdmissionReportViewPopup ID="AdmissionReportViewPopup" runat="server" />

</asp:Content>
