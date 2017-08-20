<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExitGrid.ascx.cs" Inherits="Portal.Pages.Journal.Exit.ExitGrid" %>
<%@ Register Src="~/Pages/Journal/Exit/InfoPopup.ascx" TagPrefix="uc1" TagName="InfoPopup" %>

<dx:ASPxGridView ID="ASPxGridViewExit" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceExit" KeyFieldName="Id" Width="1200px" Font-Size="Small" ClientInstanceName="ASPxClientGridViewExit" OnRowInserting="ASPxGridViewExit_RowInserting" OnInitNewRow="ASPxGridViewExit_InitNewRow" OnStartRowEditing="ASPxGridViewExit_StartRowEditing" OnHtmlEditFormCreated="ASPxGridViewExit_HtmlEditFormCreated" OnCellEditorInitialize="ASPxGridViewExit_CellEditorInitialize" OnCommandButtonInitialize="ASPxGridViewExit_CommandButtonInitialize" OnInit="ASPxGridViewExit_Init" OnHtmlDataCellPrepared="ASPxGridViewExit_HtmlDataCellPrepared" OnRowUpdating="ASPxGridViewExit_RowUpdating">
    <SettingsPopup>
        <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="900px" />
    </SettingsPopup>
    <SettingsSearchPanel Visible="True" />
    <Templates>
        <EditForm>
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanelDescription" runat="server" Height="100px" Width="100%" ClientInstanceName="ASPxClientCallbackPanelDescription" OnCallback="ASPxCallbackPanelDescription_Callback">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <table style="margin: 0 17px 10px 0; height: 100px; width: 100%">
                            <tr>
                                <td style="width: 204px; text-align: center;">
                                    <dx:ASPxImage ID="ASPxImagePhoto" runat="server" ShowLoadingImage="True" Width="120px">
                                    </dx:ASPxImage>
                                </td>
                                <td style="width: 490px;">
                                    <dx:ASPxLabel ID="ASPxLabelFIO" runat="server" Font-Size="Large" Text="">
                                    </dx:ASPxLabel>
                                    <br />
                                    <dx:ASPxLabel ID="ASPxLabelPosition" runat="server" Text="">
                                    </dx:ASPxLabel>
                                    <br />
                                    <dx:ASPxLabel ID="ASPxLabelDepartment" runat="server" Text="">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabelJobTime" runat="server" Font-Bold="true" Font-Size="Small" Text="">
                                    </dx:ASPxLabel>
                                    <br />
                                    <dx:ASPxLabel ID="ASPxLabelOne" runat="server" Font-Size="Small" Text="">
                                    </dx:ASPxLabel>
                                    <br />
                                    <dx:ASPxLabel ID="ASPxLabelTwo" runat="server" Font-Size="Small" Text="">
                                    </dx:ASPxLabel>
                                    <br />
                                    <dx:ASPxLabel ID="ASPxLabelThree" runat="server" Font-Size="Small" Text="">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement1" runat="server" ReplacementType="EditFormEditors" />
            <div style="margin: 0 17px 10px 0;">
                <dx:ASPxPanel ID="ASPxPanel1" runat="server" RightToLeft="True" Width="100%">
                    <Paddings PaddingTop="10px" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement3" runat="server" ColumnID="" ReplacementType="EditFormCancelButton" />
                            <dx:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement2" runat="server" ColumnID="" ReplacementType="EditFormUpdateButton" />
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </div>
        </EditForm>
    </Templates>
    <SettingsPager PageSize="100">
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
    <StylesPopup>
        <EditForm>
            <Header BackColor="WhiteSmoke">
            </Header>
        </EditForm>
    </StylesPopup>
    <Columns>
        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Caption=" ">
            <CellStyle>
                <Paddings PaddingBottom="3px" PaddingTop="3px" />
            </CellStyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="RunType" Visible="False" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Время выхода" FieldName="DateFrom" VisibleIndex="5" Width="65px">
            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" EditFormatString="dd/MM/yyyy HH:mm" UseMaskBehavior="True" ClientInstanceName="ClientDateFrom" ShowOutOfRangeWarning="False">
                <CalendarProperties FirstDayOfWeek="Monday">
                </CalendarProperties>
                <TimeSectionProperties Visible="True">
                </TimeSectionProperties>
                <ClientSideEvents Init="function(s, e) {
	//s.SetMinDate(new Date());
}" Validation="function(s, e) {
                    if(isAdmin != true)
                    {
	e.isValid = (ClientDateFrom.GetDate() &gt;= new Date())
                    }
}" />
                <ValidationSettings Display="Dynamic">
                    <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                </ValidationSettings>
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="Отметка выхода" FieldName="DateFromCheck" VisibleIndex="7" Width="65px">
            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" EditFormatString="dd/MM/yyyy HH:mm" UseMaskBehavior="True">
                <TimeSectionProperties Visible="True">
                </TimeSectionProperties>
            </PropertiesDateEdit>
            <EditFormSettings Visible="False" />
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="Время входа" FieldName="DateTo" VisibleIndex="6" Width="65px">
            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="Custom" EditFormatString="dd/MM/yyyy HH:mm" UseMaskBehavior="True" ClientInstanceName="ClientDateTo" ShowOutOfRangeWarning="False">
                <TimeSectionProperties Visible="True">
                </TimeSectionProperties>
                <ClientSideEvents Validation="function(s, e) {
	e.isValid = (ClientDateFrom.GetDate() &lt; ClientDateTo.GetDate())
}" />
                <ValidationSettings Display="Dynamic">
                    <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                </ValidationSettings>
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="Отметка входа" FieldName="DateToCheck" VisibleIndex="8" Width="65px">
            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="DateTime" EditFormatString="dd/MM/yyyy HH:mm" UseMaskBehavior="True">
                <TimeSectionProperties Visible="True">
                </TimeSectionProperties>
            </PropertiesDateEdit>
            <EditFormSettings Visible="False" />
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn Caption="Сотрудник" FieldName="EmployeeId" VisibleIndex="3" SortIndex="0" SortOrder="Ascending">
            <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" TextField="FIO" ValueField="Id">
                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                ASPxClientCallbackPanelDescription.PerformCallback(s.GetValue());
                }" />
                <ValidationSettings Display="Dynamic">
                    <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Подразделение" FieldName="DepartmentId" VisibleIndex="10">
            <PropertiesComboBox DataSourceID="SqlDataSourceDepartment" TextField="ShortName" ValueField="Id">
            </PropertiesComboBox>
            <EditFormSettings Visible="False" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Согласовано" FieldName="PetmitEmployeeId" VisibleIndex="9">
            <PropertiesComboBox DataSourceID="SqlDataSourcePetmitEmployee" TextField="FIO" ValueField="Id">
            </PropertiesComboBox>
            <EditFormSettings Visible="False" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Цель выхода" FieldName="ExitPurposeId" VisibleIndex="4">
            <PropertiesComboBox DataSourceID="SqlDataSourceExitPurpose" TextField="Name" ValueField="Id">
                <ValidationSettings Display="Dynamic">
                    <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataMemoColumn Caption="Комментарий" FieldName="DescriptionOne" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
            <PropertiesMemoEdit Height="50px">
            </PropertiesMemoEdit>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataMemoColumn Caption="Дополнение к коментарию" FieldName="DescriptionTwo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
            <PropertiesMemoEdit Height="50px">
            </PropertiesMemoEdit>
            <EditFormSettings ColumnSpan="2" Visible="True" />
        </dx:GridViewDataMemoColumn>
    </Columns>
    <FormatConditions>
        <dx:GridViewFormatConditionHighlight ApplyToRow="True" Expression="[DateFrom] &lt;= Now()" FieldName="DateFrom" Format="Custom">
            <RowStyle ForeColor="#999999" />
        </dx:GridViewFormatConditionHighlight>
    </FormatConditions>
    <Styles>
        <Header Wrap="True">
        </Header>
    </Styles>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSourceExit" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
    DeleteCommand="DELETE FROM [Exit] WHERE [Id] = @original_Id AND [RunType] = @original_RunType AND [DateFrom] = @original_DateFrom AND (([DateFromCheck] = @original_DateFromCheck) OR ([DateFromCheck] IS NULL AND @original_DateFromCheck IS NULL)) AND (([DateTo] = @original_DateTo) OR ([DateTo] IS NULL AND @original_DateTo IS NULL)) AND (([DateToCheck] = @original_DateToCheck) OR ([DateToCheck] IS NULL AND @original_DateToCheck IS NULL)) AND (([EmployeeId] = @original_EmployeeId) OR ([EmployeeId] IS NULL AND @original_EmployeeId IS NULL)) AND (([PetmitEmployeeId] = @original_PetmitEmployeeId) OR ([PetmitEmployeeId] IS NULL AND @original_PetmitEmployeeId IS NULL)) AND (([ExitPurposeId] = @original_ExitPurposeId) OR ([ExitPurposeId] IS NULL AND @original_ExitPurposeId IS NULL)) AND (([DescriptionOne] = @original_DescriptionOne) OR ([DescriptionOne] IS NULL AND @original_DescriptionOne IS NULL)) AND (([DescriptionTwo] = @original_DescriptionTwo) OR ([DescriptionTwo] IS NULL AND @original_DescriptionTwo IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL))"
    InsertCommand="INSERT INTO [Exit] ([RunType], [DateFrom], [DateFromCheck], [DateTo], [DateToCheck], [EmployeeId], [PetmitEmployeeId], [ExitPurposeId], [DescriptionOne], [DescriptionTwo], [DepartmentId]) VALUES (@RunType, @DateFrom, @DateFromCheck, @DateTo, @DateToCheck, @EmployeeId, @PetmitEmployeeId, @ExitPurposeId, @DescriptionOne, @DescriptionTwo, @DepartmentId)"
    OldValuesParameterFormatString="original_{0}"
    UpdateCommand="UPDATE [Exit] SET [RunType] = @RunType, [DateFrom] = @DateFrom, [DateFromCheck] = @DateFromCheck, [DateTo] = @DateTo, [DateToCheck] = @DateToCheck, [EmployeeId] = @EmployeeId, [PetmitEmployeeId] = @PetmitEmployeeId, [ExitPurposeId] = @ExitPurposeId, [DescriptionOne] = @DescriptionOne, [DescriptionTwo] = @DescriptionTwo, [DepartmentId] = @DepartmentId WHERE [Id] = @original_Id AND [RunType] = @original_RunType AND [DateFrom] = @original_DateFrom AND (([DateFromCheck] = @original_DateFromCheck) OR ([DateFromCheck] IS NULL AND @original_DateFromCheck IS NULL)) AND (([DateTo] = @original_DateTo) OR ([DateTo] IS NULL AND @original_DateTo IS NULL)) AND (([DateToCheck] = @original_DateToCheck) OR ([DateToCheck] IS NULL AND @original_DateToCheck IS NULL)) AND (([EmployeeId] = @original_EmployeeId) OR ([EmployeeId] IS NULL AND @original_EmployeeId IS NULL)) AND (([PetmitEmployeeId] = @original_PetmitEmployeeId) OR ([PetmitEmployeeId] IS NULL AND @original_PetmitEmployeeId IS NULL)) AND (([ExitPurposeId] = @original_ExitPurposeId) OR ([ExitPurposeId] IS NULL AND @original_ExitPurposeId IS NULL)) AND (([DescriptionOne] = @original_DescriptionOne) OR ([DescriptionOne] IS NULL AND @original_DescriptionOne IS NULL)) AND (([DescriptionTwo] = @original_DescriptionTwo) OR ([DescriptionTwo] IS NULL AND @original_DescriptionTwo IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL))" OnInit="SqlDataSourceExit_Init" SelectCommand="SELECT * FROM [Exit] WHERE (([DateFrom] &gt;= @DateFrom) AND ([DateTo] &lt;= @DateTo) AND ([DepartmentId] = @DepartmentId) AND ([RunType] = @RunType))">
    <DeleteParameters>
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_RunType" Type="Int32" />
        <asp:Parameter Name="original_DateFrom" Type="DateTime" />
        <asp:Parameter Name="original_DateFromCheck" Type="DateTime" />
        <asp:Parameter Name="original_DateTo" Type="DateTime" />
        <asp:Parameter Name="original_DateToCheck" Type="DateTime" />
        <asp:Parameter Name="original_EmployeeId" Type="Int32" />
        <asp:Parameter Name="original_PetmitEmployeeId" Type="Int32" />
        <asp:Parameter Name="original_ExitPurposeId" Type="Int32" />
        <asp:Parameter Name="original_DescriptionOne" Type="String" />
        <asp:Parameter Name="original_DescriptionTwo" Type="String" />
        <asp:Parameter Name="original_DepartmentId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="RunType" Type="Int32" />
        <asp:Parameter Name="DateFrom" Type="DateTime" />
        <asp:Parameter Name="DateFromCheck" Type="DateTime" />
        <asp:Parameter Name="DateTo" Type="DateTime" />
        <asp:Parameter Name="DateToCheck" Type="DateTime" />
        <asp:Parameter Name="EmployeeId" Type="Int32" />
        <asp:Parameter Name="PetmitEmployeeId" Type="Int32" />
        <asp:Parameter Name="ExitPurposeId" Type="Int32" />
        <asp:Parameter Name="DescriptionOne" Type="String" />
        <asp:Parameter Name="DescriptionTwo" Type="String" />
        <asp:Parameter Name="DepartmentId" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="DateFrom" SessionField="DateFromExit" Type="DateTime" />
        <asp:SessionParameter Name="DateTo" SessionField="DateToExit" Type="DateTime" />
        <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="Int32" />
        <asp:Parameter DefaultValue="0" Name="RunType" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="RunType" Type="Int32" />
        <asp:Parameter Name="DateFrom" Type="DateTime" />
        <asp:Parameter Name="DateFromCheck" Type="DateTime" />
        <asp:Parameter Name="DateTo" Type="DateTime" />
        <asp:Parameter Name="DateToCheck" Type="DateTime" />
        <asp:Parameter Name="EmployeeId" Type="Int32" />
        <asp:Parameter Name="PetmitEmployeeId" Type="Int32" />
        <asp:Parameter Name="ExitPurposeId" Type="Int32" />
        <asp:Parameter Name="DescriptionOne" Type="String" />
        <asp:Parameter Name="DescriptionTwo" Type="String" />
        <asp:Parameter Name="DepartmentId" Type="Int32" />
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_RunType" Type="Int32" />
        <asp:Parameter Name="original_DateFrom" Type="DateTime" />
        <asp:Parameter Name="original_DateFromCheck" Type="DateTime" />
        <asp:Parameter Name="original_DateTo" Type="DateTime" />
        <asp:Parameter Name="original_DateToCheck" Type="DateTime" />
        <asp:Parameter Name="original_EmployeeId" Type="Int32" />
        <asp:Parameter Name="original_PetmitEmployeeId" Type="Int32" />
        <asp:Parameter Name="original_ExitPurposeId" Type="Int32" />
        <asp:Parameter Name="original_DescriptionOne" Type="String" />
        <asp:Parameter Name="original_DescriptionTwo" Type="String" />
        <asp:Parameter Name="original_DepartmentId" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" OnInit="SqlDataSourceEmployee_Init"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourcePetmitEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" OnInit="SqlDataSourcePetmitEmployee_Init"></asp:SqlDataSource>


<asp:SqlDataSource ID="SqlDataSourceExitPurpose" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [ExitPurpose] ORDER BY [Name]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], [ShortName] FROM [Department] ORDER BY [ShortName]"></asp:SqlDataSource>

<uc1:InfoPopup runat="server" id="InfoPopup" />