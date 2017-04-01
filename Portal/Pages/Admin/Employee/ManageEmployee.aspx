<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Employee/EmployeeMain.master" AutoEventWireup="true" CodeBehind="ManageEmployee.aspx.cs" Inherits="Portal.Pages.Admin.Employee.ManageEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">

        <dx:ASPxGridView ID="ASPxGridViewEmployee" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceEmployee" KeyFieldName="Id" Width="900px">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
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
                <EditForm VerticalAlign="Above" Width="900px" />
            </SettingsPopup>
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TabN" VisibleIndex="2" Caption="Таб. №">
                    <EditFormSettings Visible="True" VisibleIndex="0" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lastname" VisibleIndex="6" Caption="Фамилия" Visible="False">
                    <EditFormSettings Visible="True" VisibleIndex="2" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Firstname" VisibleIndex="7" Caption="Имя" Visible="False">
                    <EditFormSettings Visible="True" VisibleIndex="4" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Patronymic" VisibleIndex="8" Caption="Отчество" Visible="False">
                    <EditFormSettings Visible="True" VisibleIndex="6" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DateIn" VisibleIndex="9" Caption="Дата принятия" Visible="False">
                    <EditFormSettings Visible="True" VisibleIndex="5" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="DateBirth" VisibleIndex="10" Caption="Дата рождения" Visible="False">
                    <EditFormSettings Visible="True" VisibleIndex="8" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Category" VisibleIndex="11" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Department_Id" VisibleIndex="12" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn Caption="Работает" FieldName="IsWork" Visible="False" VisibleIndex="14">
                    <EditFormSettings Visible="True" VisibleIndex="7" />
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="FIO" VisibleIndex="3" Caption="ФИО" ReadOnly="True" Width="200px">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" ShowNewButtonInHeader="True" Width="20px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataComboBoxColumn Caption="Подразделение" FieldName="DepartmentId" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="SqlDataSourceDepartment" TextField="Name" ValueField="Id">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" VisibleIndex="1" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Должность" FieldName="PositionId" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="SqlDataSourcePosition" TextField="Name" ValueField="Id">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" VisibleIndex="3" />
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <FormatConditions>
                <dx:GridViewFormatConditionHighlight ApplyToRow="True" Expression="[IsWork] = False" Format="Custom">
                    <RowStyle ForeColor="#999999" />
                </dx:GridViewFormatConditionHighlight>
            </FormatConditions>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
            DeleteCommand="DELETE FROM [Employee] WHERE [Id] = @original_Id AND [TabN] = @original_TabN AND [Lastname] = @original_Lastname AND (([Firstname] = @original_Firstname) OR ([Firstname] IS NULL AND @original_Firstname IS NULL)) AND (([Patronymic] = @original_Patronymic) OR ([Patronymic] IS NULL AND @original_Patronymic IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL)) AND (([DateIn] = @original_DateIn) OR ([DateIn] IS NULL AND @original_DateIn IS NULL)) AND (([DateBirth] = @original_DateBirth) OR ([DateBirth] IS NULL AND @original_DateBirth IS NULL)) AND (([Category] = @original_Category) OR ([Category] IS NULL AND @original_Category IS NULL)) AND (([Department_Id] = @original_Department_Id) OR ([Department_Id] IS NULL AND @original_Department_Id IS NULL)) AND (([PositionId] = @original_PositionId) OR ([PositionId] IS NULL AND @original_PositionId IS NULL))" 
            InsertCommand="INSERT INTO [Employee] ([TabN], [Lastname], [Firstname], [Patronymic], [DepartmentId], [DateIn], [DateBirth], [Category], [Department_Id], [PositionId], [IsWork]) VALUES (@TabN, @Lastname, @Firstname, @Patronymic, @DepartmentId, @DateIn, @DateBirth, @Category, @Department_Id, @PositionId, @IsWork)" OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT *, CONCAT([Lastname], ' ', [Firstname], ' ', [Patronymic]) AS FIO FROM [Employee] ORDER BY [Lastname], [Firstname], [Patronymic]" 
            UpdateCommand="UPDATE [Employee] SET [TabN] = @TabN, [Lastname] = @Lastname, [Firstname] = @Firstname, [Patronymic] = @Patronymic, [DepartmentId] = @DepartmentId, [DateIn] = @DateIn, [DateBirth] = @DateBirth, [Category] = @Category, [Department_Id] = @Department_Id, [PositionId] = @PositionId, [IsWork] = @IsWork WHERE [Id] = @original_Id AND [TabN] = @original_TabN AND [Lastname] = @original_Lastname AND [IsWork] = @original_IsWork AND (([Firstname] = @original_Firstname) OR ([Firstname] IS NULL AND @original_Firstname IS NULL)) AND (([Patronymic] = @original_Patronymic) OR ([Patronymic] IS NULL AND @original_Patronymic IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL)) AND (([DateIn] = @original_DateIn) OR ([DateIn] IS NULL AND @original_DateIn IS NULL)) AND (([DateBirth] = @original_DateBirth) OR ([DateBirth] IS NULL AND @original_DateBirth IS NULL)) AND (([Category] = @original_Category) OR ([Category] IS NULL AND @original_Category IS NULL)) AND (([Department_Id] = @original_Department_Id) OR ([Department_Id] IS NULL AND @original_Department_Id IS NULL)) AND (([PositionId] = @original_PositionId) OR ([PositionId] IS NULL AND @original_PositionId IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_TabN" Type="String" />
                <asp:Parameter Name="original_Lastname" Type="String" />
                <asp:Parameter Name="original_Firstname" Type="String" />
                <asp:Parameter Name="original_Patronymic" Type="String" />
                <asp:Parameter Name="original_DepartmentId" Type="Int32" />
                <asp:Parameter Name="original_DateIn" Type="DateTime" />
                <asp:Parameter Name="original_DateBirth" Type="DateTime" />
                <asp:Parameter Name="original_Category" Type="String" />
                <asp:Parameter Name="original_Department_Id" Type="Int32" />
                <asp:Parameter Name="original_PositionId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TabN" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Patronymic" Type="String" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
                <asp:Parameter Name="DateIn" Type="DateTime" />
                <asp:Parameter Name="DateBirth" Type="DateTime" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="Department_Id" Type="Int32" />
                <asp:Parameter Name="PositionId" Type="Int32" />
                <asp:Parameter Name="IsWork" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TabN" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Patronymic" Type="String" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
                <asp:Parameter Name="DateIn" Type="DateTime" />
                <asp:Parameter Name="DateBirth" Type="DateTime" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="Department_Id" Type="Int32" />
                <asp:Parameter Name="PositionId" Type="Int32" />
                <asp:Parameter Name="IsWork" Type="Boolean" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_TabN" Type="String" />
                <asp:Parameter Name="original_Lastname" Type="String" />
                <asp:Parameter Name="original_Firstname" Type="String" />
                <asp:Parameter Name="original_Patronymic" Type="String" />
                <asp:Parameter Name="original_DepartmentId" Type="Int32" />
                <asp:Parameter Name="original_DateIn" Type="DateTime" />
                <asp:Parameter Name="original_DateBirth" Type="DateTime" />
                <asp:Parameter Name="original_Category" Type="String" />
                <asp:Parameter Name="original_Department_Id" Type="Int32" />
                <asp:Parameter Name="original_PositionId" Type="Int32" />
                <asp:Parameter Name="original_IsWork" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], [Name] FROM [Department] WHERE ([IsActive] = @IsActive) ORDER BY [Name]">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourcePosition" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], [Name] FROM [Position] WHERE ([IsActive] = @IsActive) ORDER BY [Name]">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
