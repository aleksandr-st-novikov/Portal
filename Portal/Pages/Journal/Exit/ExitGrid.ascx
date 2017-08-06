<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExitGrid.ascx.cs" Inherits="Portal.Pages.Journal.Exit.ExitGrid" %>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceExit" KeyFieldName="Id" Width="1200px">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="RunType" Visible="False" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Время выхода" FieldName="DateFrom" VisibleIndex="4">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="Отметка выхода" FieldName="DateFromCheck" VisibleIndex="6">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="Время входа" FieldName="DateTo" VisibleIndex="5">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="Отметка входа" FieldName="DateToCheck" VisibleIndex="7">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="Комментарий" FieldName="DescriptionOne" Visible="False" VisibleIndex="10">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Дополнение к коментарию" FieldName="DescriptionTwo" Visible="False" VisibleIndex="11">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="Сотрудник" FieldName="EmployeeId" VisibleIndex="2">
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Подразделение" FieldName="DepartmentId" VisibleIndex="9">
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Кто согласовал" FieldName="PetmitEmployeeId" VisibleIndex="8">
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Цель выхода" FieldName="ExitPurposeId" VisibleIndex="3">
        </dx:GridViewDataComboBoxColumn>
    </Columns>
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

