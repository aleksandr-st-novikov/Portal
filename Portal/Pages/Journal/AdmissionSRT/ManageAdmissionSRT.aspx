<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/AdmissionSRT/AdmissionSRTMain.master" AutoEventWireup="true" CodeBehind="ManageAdmissionSRT.aspx.cs" Inherits="Portal.Pages.Journal.AdmissionSRT.ManageAdmissionSRT" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxCallback ID="ASPxCallbackImportEmployee" runat="server" ClientInstanceName="ASPxClientCallbackImportEmployee" OnCallback="ASPxCallbackImportEmployee_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {
	            ASPxClientLoadingPanelLoad.Hide();
            }" />
    </dx:ASPxCallback>
    <div class="content">
        <div style="margin-bottom: 10px;">
            <dx:ASPxLabel ID="ASPxLabelDepartment" runat="server" Font-Size="Large">
            </dx:ASPxLabel>
        </div>
        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="500px" RightToLeft="True">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxButton ID="ASPxButtonPopulateEmployee" runat="server" Text="Заполнить сотрудников" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
                                ASPxClientCallbackImportEmployee.PerformCallback();
	                            ASPxClientLoadingPanelLoad.Show();
                            }" />
                    </dx:ASPxButton>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
        <dx:ASPxGridView ID="ASPxGridViewAdmissionSRT" ClientInstanceName="ASPxClientGridViewAdmissionSRT" runat="server" DataSourceID="SqlDataSourceAdmissionSRT" AutoGenerateColumns="False" KeyFieldName="Id" Width="100%">
            <SettingsPager PageSize="100000" Visible="False">
            </SettingsPager>
            <SettingsCommandButton>
                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
            </SettingsCommandButton>
            <SettingsDataSecurity AllowInsert="False" />
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewCommandColumn Visible="False" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DateFlu" VisibleIndex="4" Caption="Дата флюорографии">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="NumFlu" VisibleIndex="5" Caption="Номер флюорографии">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Dopusk" VisibleIndex="6" Caption="Допуск">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="SanMin" VisibleIndex="7" Caption="Сан. минимум">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Commentary" VisibleIndex="8" Caption="Комментарий">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="ФИО" FieldName="EmployeeId" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" TextField="FIO" ValueField="Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Должность" FieldName="PositionId" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="SqlDataSourcePosition" TextField="Name" ValueField="Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceAdmissionSRT" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [AdmissionSRT] WHERE [Id] = @original_Id AND (([DateFlu] = @original_DateFlu) OR ([DateFlu] IS NULL AND @original_DateFlu IS NULL)) AND (([NumFlu] = @original_NumFlu) OR ([NumFlu] IS NULL AND @original_NumFlu IS NULL)) AND (([Dopusk] = @original_Dopusk) OR ([Dopusk] IS NULL AND @original_Dopusk IS NULL)) AND (([SanMin] = @original_SanMin) OR ([SanMin] IS NULL AND @original_SanMin IS NULL)) AND (([Commentary] = @original_Commentary) OR ([Commentary] IS NULL AND @original_Commentary IS NULL)) AND (([EmployeeId] = @original_EmployeeId) OR ([EmployeeId] IS NULL AND @original_EmployeeId IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL)) AND (([PositionId] = @original_PositionId) OR ([PositionId] IS NULL AND @original_PositionId IS NULL))" InsertCommand="INSERT INTO [AdmissionSRT] ([DateFlu], [NumFlu], [Dopusk], [SanMin], [Commentary], [EmployeeId], [DepartmentId], [PositionId]) VALUES (@DateFlu, @NumFlu, @Dopusk, @SanMin, @Commentary, @EmployeeId, @DepartmentId, @PositionId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [AdmissionSRT] WHERE ([DepartmentId] = @DepartmentId)" UpdateCommand="UPDATE [AdmissionSRT] SET [DateFlu] = @DateFlu, [NumFlu] = @NumFlu, [Dopusk] = @Dopusk, [SanMin] = @SanMin, [Commentary] = @Commentary, [EmployeeId] = @EmployeeId, [DepartmentId] = @DepartmentId, [PositionId] = @PositionId WHERE [Id] = @original_Id AND (([DateFlu] = @original_DateFlu) OR ([DateFlu] IS NULL AND @original_DateFlu IS NULL)) AND (([NumFlu] = @original_NumFlu) OR ([NumFlu] IS NULL AND @original_NumFlu IS NULL)) AND (([Dopusk] = @original_Dopusk) OR ([Dopusk] IS NULL AND @original_Dopusk IS NULL)) AND (([SanMin] = @original_SanMin) OR ([SanMin] IS NULL AND @original_SanMin IS NULL)) AND (([Commentary] = @original_Commentary) OR ([Commentary] IS NULL AND @original_Commentary IS NULL)) AND (([EmployeeId] = @original_EmployeeId) OR ([EmployeeId] IS NULL AND @original_EmployeeId IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL)) AND (([PositionId] = @original_PositionId) OR ([PositionId] IS NULL AND @original_PositionId IS NULL))">
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
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DateFlu" Type="DateTime" />
                <asp:Parameter Name="NumFlu" Type="String" />
                <asp:Parameter Name="Dopusk" Type="DateTime" />
                <asp:Parameter Name="SanMin" Type="DateTime" />
                <asp:Parameter Name="Commentary" Type="String" />
                <asp:Parameter Name="EmployeeId" Type="Int32" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
                <asp:Parameter Name="PositionId" Type="Int32" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_DateFlu" Type="DateTime" />
                <asp:Parameter Name="original_NumFlu" Type="String" />
                <asp:Parameter Name="original_Dopusk" Type="DateTime" />
                <asp:Parameter Name="original_SanMin" Type="DateTime" />
                <asp:Parameter Name="original_Commentary" Type="String" />
                <asp:Parameter Name="original_EmployeeId" Type="Int32" />
                <asp:Parameter Name="original_DepartmentId" Type="Int32" />
                <asp:Parameter Name="original_PositionId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            SelectCommand="SELECT [Id], CONCAT([Lastname], ' ', [Firstname], ' ', [Patronymic]) AS FIO FROM [Employee] WHERE ([IsWork] = @IsWork) ORDER BY [FIO]">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="IsWork" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcePosition" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], [Name] FROM [Position] WHERE ([IsActive] = @IsActive) ORDER BY [Name]">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="IsActive" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
    <dx:ASPxLoadingPanel ID="ASPxLoadingPanelLoad" runat="server" ClientInstanceName="ASPxClientLoadingPanelLoad" Modal="True">
    </dx:ASPxLoadingPanel>
</asp:Content>
