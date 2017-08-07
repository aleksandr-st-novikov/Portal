<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExitGrid.ascx.cs" Inherits="Portal.Pages.Journal.Exit.ExitGrid" %>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceExit" KeyFieldName="Id" Width="1200px">
    <SettingsSearchPanel Visible="True" />
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
    <Columns>
        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image">
            <CellStyle>
                <Paddings PaddingBottom="3px" PaddingTop="3px" />
            </CellStyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="RunType" Visible="False" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Время выхода" FieldName="DateFrom" VisibleIndex="5">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="Отметка выхода" FieldName="DateFromCheck" VisibleIndex="7">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="Время входа" FieldName="DateTo" VisibleIndex="6">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="Отметка входа" FieldName="DateToCheck" VisibleIndex="8">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="Комментарий" FieldName="DescriptionOne" Visible="False" VisibleIndex="11">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Дополнение к коментарию" FieldName="DescriptionTwo" Visible="False" VisibleIndex="12">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="Сотрудник" FieldName="EmployeeId" VisibleIndex="3">
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Подразделение" FieldName="DepartmentId" VisibleIndex="10">
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Кто согласовал" FieldName="PetmitEmployeeId" VisibleIndex="9">
            <PropertiesComboBox DataSourceID="SqlDataSourcePetmitEmployee" TextField="FIO" ValueField="Id">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Цель выхода" FieldName="ExitPurposeId" VisibleIndex="4">
        </dx:GridViewDataComboBoxColumn>
    </Columns>
    <Styles>
        <Cell>
            <Paddings PaddingBottom="3px" PaddingTop="3px" />
        </Cell>
    </Styles>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSourceExit" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Exit] WHERE [Id] = @original_Id AND [RunType] = @original_RunType AND [DateFrom] = @original_DateFrom AND (([DateFromCheck] = @original_DateFromCheck) OR ([DateFromCheck] IS NULL AND @original_DateFromCheck IS NULL)) AND (([DateTo] = @original_DateTo) OR ([DateTo] IS NULL AND @original_DateTo IS NULL)) AND (([DateToCheck] = @original_DateToCheck) OR ([DateToCheck] IS NULL AND @original_DateToCheck IS NULL)) AND (([EmployeeId] = @original_EmployeeId) OR ([EmployeeId] IS NULL AND @original_EmployeeId IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL)) AND (([PetmitEmployeeId] = @original_PetmitEmployeeId) OR ([PetmitEmployeeId] IS NULL AND @original_PetmitEmployeeId IS NULL)) AND (([ExitPurposeId] = @original_ExitPurposeId) OR ([ExitPurposeId] IS NULL AND @original_ExitPurposeId IS NULL)) AND (([DescriptionOne] = @original_DescriptionOne) OR ([DescriptionOne] IS NULL AND @original_DescriptionOne IS NULL)) AND (([DescriptionTwo] = @original_DescriptionTwo) OR ([DescriptionTwo] IS NULL AND @original_DescriptionTwo IS NULL))" InsertCommand="INSERT INTO [Exit] ([RunType], [DateFrom], [DateFromCheck], [DateTo], [DateToCheck], [EmployeeId], [DepartmentId], [PetmitEmployeeId], [ExitPurposeId], [DescriptionOne], [DescriptionTwo]) VALUES (@RunType, @DateFrom, @DateFromCheck, @DateTo, @DateToCheck, @EmployeeId, @DepartmentId, @PetmitEmployeeId, @ExitPurposeId, @DescriptionOne, @DescriptionTwo)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Exit] ORDER BY [EmployeeId]" UpdateCommand="UPDATE [Exit] SET [RunType] = @RunType, [DateFrom] = @DateFrom, [DateFromCheck] = @DateFromCheck, [DateTo] = @DateTo, [DateToCheck] = @DateToCheck, [EmployeeId] = @EmployeeId, [DepartmentId] = @DepartmentId, [PetmitEmployeeId] = @PetmitEmployeeId, [ExitPurposeId] = @ExitPurposeId, [DescriptionOne] = @DescriptionOne, [DescriptionTwo] = @DescriptionTwo WHERE [Id] = @original_Id AND [RunType] = @original_RunType AND [DateFrom] = @original_DateFrom AND (([DateFromCheck] = @original_DateFromCheck) OR ([DateFromCheck] IS NULL AND @original_DateFromCheck IS NULL)) AND (([DateTo] = @original_DateTo) OR ([DateTo] IS NULL AND @original_DateTo IS NULL)) AND (([DateToCheck] = @original_DateToCheck) OR ([DateToCheck] IS NULL AND @original_DateToCheck IS NULL)) AND (([EmployeeId] = @original_EmployeeId) OR ([EmployeeId] IS NULL AND @original_EmployeeId IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL)) AND (([PetmitEmployeeId] = @original_PetmitEmployeeId) OR ([PetmitEmployeeId] IS NULL AND @original_PetmitEmployeeId IS NULL)) AND (([ExitPurposeId] = @original_ExitPurposeId) OR ([ExitPurposeId] IS NULL AND @original_ExitPurposeId IS NULL)) AND (([DescriptionOne] = @original_DescriptionOne) OR ([DescriptionOne] IS NULL AND @original_DescriptionOne IS NULL)) AND (([DescriptionTwo] = @original_DescriptionTwo) OR ([DescriptionTwo] IS NULL AND @original_DescriptionTwo IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_RunType" Type="Int32" />
        <asp:Parameter Name="original_DateFrom" Type="DateTime" />
        <asp:Parameter Name="original_DateFromCheck" Type="DateTime" />
        <asp:Parameter Name="original_DateTo" Type="DateTime" />
        <asp:Parameter Name="original_DateToCheck" Type="DateTime" />
        <asp:Parameter Name="original_EmployeeId" Type="Int32" />
        <asp:Parameter Name="original_DepartmentId" Type="Int32" />
        <asp:Parameter Name="original_PetmitEmployeeId" Type="Int32" />
        <asp:Parameter Name="original_ExitPurposeId" Type="Int32" />
        <asp:Parameter Name="original_DescriptionOne" Type="String" />
        <asp:Parameter Name="original_DescriptionTwo" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="RunType" Type="Int32" />
        <asp:Parameter Name="DateFrom" Type="DateTime" />
        <asp:Parameter Name="DateFromCheck" Type="DateTime" />
        <asp:Parameter Name="DateTo" Type="DateTime" />
        <asp:Parameter Name="DateToCheck" Type="DateTime" />
        <asp:Parameter Name="EmployeeId" Type="Int32" />
        <asp:Parameter Name="DepartmentId" Type="Int32" />
        <asp:Parameter Name="PetmitEmployeeId" Type="Int32" />
        <asp:Parameter Name="ExitPurposeId" Type="Int32" />
        <asp:Parameter Name="DescriptionOne" Type="String" />
        <asp:Parameter Name="DescriptionTwo" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="RunType" Type="Int32" />
        <asp:Parameter Name="DateFrom" Type="DateTime" />
        <asp:Parameter Name="DateFromCheck" Type="DateTime" />
        <asp:Parameter Name="DateTo" Type="DateTime" />
        <asp:Parameter Name="DateToCheck" Type="DateTime" />
        <asp:Parameter Name="EmployeeId" Type="Int32" />
        <asp:Parameter Name="DepartmentId" Type="Int32" />
        <asp:Parameter Name="PetmitEmployeeId" Type="Int32" />
        <asp:Parameter Name="ExitPurposeId" Type="Int32" />
        <asp:Parameter Name="DescriptionOne" Type="String" />
        <asp:Parameter Name="DescriptionTwo" Type="String" />
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_RunType" Type="Int32" />
        <asp:Parameter Name="original_DateFrom" Type="DateTime" />
        <asp:Parameter Name="original_DateFromCheck" Type="DateTime" />
        <asp:Parameter Name="original_DateTo" Type="DateTime" />
        <asp:Parameter Name="original_DateToCheck" Type="DateTime" />
        <asp:Parameter Name="original_EmployeeId" Type="Int32" />
        <asp:Parameter Name="original_DepartmentId" Type="Int32" />
        <asp:Parameter Name="original_PetmitEmployeeId" Type="Int32" />
        <asp:Parameter Name="original_ExitPurposeId" Type="Int32" />
        <asp:Parameter Name="original_DescriptionOne" Type="String" />
        <asp:Parameter Name="original_DescriptionTwo" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" OnInit="SqlDataSourceEmployee_Init"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourcePetmitEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" OnInit="SqlDataSourcePetmitEmployee_Init"></asp:SqlDataSource>


