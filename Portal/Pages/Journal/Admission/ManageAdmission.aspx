﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/Admission/AdmissionMain.master" AutoEventWireup="true" CodeBehind="ManageAdmission.aspx.cs" Inherits="Portal.Pages.Journal.Admission.ManageAdmission" Async="true" %>

<%@ Register Assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxCallback ID="ASPxCallbackSave" runat="server" ClientInstanceName="ASPxClientCallbackSave" OnCallback="ASPxCallbackSave_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {
	            ASPxClientPopupControlSaveParams.Hide();
                ASPxClientPopupControlReport.Show();
            }" />
    </dx:ASPxCallback>
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
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="ASPxButtonShowSaveParams" runat="server" AutoPostBack="False" ClientInstanceName="ASPxClientButtonShowSaveParams" Text="Сохранить">
                        <ClientSideEvents Click="function(s, e) {
	                            ASPxClientPopupControlSaveParams.Show();
                            }" />
                        <Image IconID="export_exporttoxls_16x16office2013">
                        </Image>
                    </dx:ASPxButton>
                    <dx:ASPxPopupControl ID="ASPxPopupControlSaveParams" runat="server" ClientInstanceName="ASPxClientPopupControlSaveParams" HeaderText="Параметры отчета" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalOffset="100" Width="450px">
                        <ContentCollection>
                            <dx:PopupControlContentControl runat="server">
                                <dx:ASPxPanel ID="ASPxPanel2" runat="server" RightToLeft="False" Width="100%">
                                    <PanelCollection>
                                        <dx:PanelContent runat="server">
                                            <dx:ASPxFormLayout ID="ASPxFormLayoutSave" runat="server" ColCount="2">
                                                <Items>
                                                    <dx:LayoutItem Caption="Период с">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxDateEdit ID="ASPxFormLayoutSaveDateFrom" runat="server" EditFormat="Custom" EditFormatString="dd.MM.yyyy">
                                                                </dx:ASPxDateEdit>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                    <dx:LayoutItem Caption="по">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer runat="server">
                                                                <dx:ASPxDateEdit ID="ASPxFormLayoutSaveDateTo" runat="server">
                                                                </dx:ASPxDateEdit>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>
                                                </Items>
                                                <Paddings PaddingBottom="20px" />
                                            </dx:ASPxFormLayout>
                                            <dx:ASPxPanel ID="ASPxPanel3" runat="server" RightToLeft="True" Width="100%">
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <dx:ASPxButton ID="ASPxButtonCancel" runat="server" AutoPostBack="False" Text="Отмена">
                                                            <ClientSideEvents Click="function(s, e) {
	                                                                ASPxClientPopupControlSaveParams.Hide();
                                                                }" />
                                                        </dx:ASPxButton>
                                                        <dx:ASPxButton ID="ASPxButtonSave" runat="server" AutoPostBack="False" Text="Сохранить">
                                                            <ClientSideEvents Click="function(s, e) {
	                                                                //ASPxClientCallbackSave.PerformCallback();
                                                                    ASPxClientCallbackPanel1.PerformCallback();
                                                                    //document.getElementById('hf').value = s.GetSelectedItem().value;
				                                                    //ASPxClientDocumentViewerReport.GetViewer().Refresh();
                                                                    //ASPxClientDocumentViewerReport.Refresh();
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
        <dx:ASPxGridView ID="ASPxGridViewAdmission" ClientInstanceName="ASPxClientGridViewAdmission" runat="server" DataSourceID="SqlDataSourceAdmission" AutoGenerateColumns="False" KeyFieldName="Id" Width="1230px" Font-Size="Small">
            <SettingsPager PageSize="100000" Visible="False">
            </SettingsPager>
            <SettingsEditing Mode="Batch">
                <BatchEditSettings EditMode="Row" />
            </SettingsEditing>
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
                <dx:GridViewDataComboBoxColumn Caption="ФИО" FieldName="EmployeeId" VisibleIndex="2" Width="350px" ReadOnly="True" ShowInCustomizationForm="False">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" TextField="FIO" ValueField="Id">
                        <DropDownButton ClientVisible="False" Enabled="False" Visible="False">
                        </DropDownButton>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Должность" FieldName="PositionId" VisibleIndex="3" Width="250px" ReadOnly="True">
                    <PropertiesComboBox DataSourceID="SqlDataSourcePosition" TextField="Name" ValueField="Id">
                        <DropDownButton Visible="False">
                        </DropDownButton>
                    </PropertiesComboBox>
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
                <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="Int32" />
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
    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" ClientInstanceName="ASPxClientCallbackPanel1" runat="server" OnCallback="ASPxCallbackPanel1_Callback" Width="1000px" Height="500px">
        <ClientSideEvents EndCallback="function(s, e) {
	//ASPxClientDocumentViewerReport.GetViewer().Refresh();
                                                                    //ASPxClientDocumentViewerReport.Refresh();
}" />
        <PanelCollection>
            <dx:PanelContent runat="server">
                <br />
                <asp:HiddenField ID="hf" runat="server" />
                <dx:ASPxDocumentViewer ID="ASPxDocumentViewerReport" runat="server" Height="100%" ClientInstanceName="ASPxClientDocumentViewerReport" OnCacheReportDocument="ASPxDocumentViewerReport_CacheReportDocument" OnRestoreReportDocumentFromCache="ASPxDocumentViewerReport_RestoreReportDocumentFromCache">
                    <SettingsReportViewer ShouldDisposeReport="False" />
                </dx:ASPxDocumentViewer>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
</asp:Content>