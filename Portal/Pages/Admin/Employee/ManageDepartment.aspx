<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Employee/EmployeeMain.master" AutoEventWireup="true" CodeBehind="ManageDepartment.aspx.cs" Inherits="Portal.Pages.Admin.Employee.ManageDepartment" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Department] WHERE [Id] = @original_Id AND (([HeadId] = @original_HeadId) OR ([HeadId] IS NULL AND @original_HeadId IS NULL)) AND [Name] = @original_Name AND (([ParentId] = @original_ParentId) OR ([ParentId] IS NULL AND @original_ParentId IS NULL)) AND [IsActive] = @original_IsActive AND (([ShortName] = @original_ShortName) OR ([ShortName] IS NULL AND @original_ShortName IS NULL)) AND (([NotChangeHead] = @original_NotChangeHead) OR ([NotChangeHead] IS NULL AND @original_NotChangeHead IS NULL))" InsertCommand="INSERT INTO [Department] ([HeadId], [Name], [ParentId], [IsActive], [ShortName], [NotChangeHead]) VALUES (@HeadId, @Name, @ParentId, @IsActive, @ShortName, @NotChangeHead)" OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT * FROM [Department] ORDER BY [Name]" UpdateCommand="UPDATE [Department] SET [HeadId] = @HeadId, [Name] = @Name, [ParentId] = @ParentId, [IsActive] = @IsActive, [ShortName] = @ShortName, [NotChangeHead] = @NotChangeHead WHERE [Id] = @original_Id AND (([HeadId] = @original_HeadId) OR ([HeadId] IS NULL AND @original_HeadId IS NULL)) AND [Name] = @original_Name AND (([ParentId] = @original_ParentId) OR ([ParentId] IS NULL AND @original_ParentId IS NULL)) AND [IsActive] = @original_IsActive AND (([ShortName] = @original_ShortName) OR ([ShortName] IS NULL AND @original_ShortName IS NULL)) AND (([NotChangeHead] = @original_NotChangeHead) OR ([NotChangeHead] IS NULL AND @original_NotChangeHead IS NULL))" ConflictDetection="CompareAllValues">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_HeadId" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_ParentId" Type="Int32" />
                <asp:Parameter Name="original_IsActive" Type="Boolean" />
                <asp:Parameter Name="original_ShortName" Type="String" />
                <asp:Parameter Name="original_NotChangeHead" Type="Boolean" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="HeadId" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ParentId" Type="Int32" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:Parameter Name="ShortName" Type="String" />
                <asp:Parameter Name="NotChangeHead" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="HeadId" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ParentId" Type="Int32" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:Parameter Name="ShortName" Type="String" />
                <asp:Parameter Name="NotChangeHead" Type="Boolean" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_HeadId" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_ParentId" Type="Int32" />
                <asp:Parameter Name="original_IsActive" Type="Boolean" />
                <asp:Parameter Name="original_ShortName" Type="String" />
                <asp:Parameter Name="original_NotChangeHead" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDepartment" KeyFieldName="Id" ParentFieldName="ParentId" Width="900px" OnInitNewNode="ASPxTreeList1_InitNewNode">
            <Columns>
                <dx:TreeListTextColumn Caption="Наименование" FieldName="Name" VisibleIndex="0" Width="250px">
                </dx:TreeListTextColumn>
                <dx:TreeListCheckColumn Caption="Активный" FieldName="IsActive" Visible="False" VisibleIndex="4">
                    <EditFormSettings Visible="True" />
                </dx:TreeListCheckColumn>
                <dx:TreeListTextColumn FieldName="ShortName" VisibleIndex="1" Caption="Краткое наименование" Width="160px">
                    <EditFormSettings Visible="True" />
                </dx:TreeListTextColumn>
                <dx:TreeListCommandColumn Caption=" " VisibleIndex="6" Width="50px" ShowNewButtonInHeader="True">
                    <EditButton Text=" " Visible="True">
                        <Image IconID="edit_edit_16x16office2013">
                        </Image>
                    </EditButton>
                    <NewButton Text=" ">
                        <Image IconID="actions_additem_16x16office2013">
                        </Image>
                    </NewButton>
                    <DeleteButton Text=" " Visible="True">
                        <Image IconID="actions_deletelist_16x16office2013">
                        </Image>
                    </DeleteButton>
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:TreeListCommandColumn>
                <dx:TreeListComboBoxColumn Caption="Подчинение" FieldName="ParentId" Visible="False" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="SqlDataSourceDepartment" TextField="Name" ValueField="Id">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:TreeListComboBoxColumn>
                <dx:TreeListComboBoxColumn Caption="Руководитель" FieldName="HeadId" VisibleIndex="2" Width="250px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" TextField="FIO" ValueField="Id">
                    </PropertiesComboBox>
                    <CellStyle HorizontalAlign="Left">
                    </CellStyle>
                </dx:TreeListComboBoxColumn>
                <dx:TreeListCheckColumn Caption="Не изменять руководителя" FieldName="NotChangeHead" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                    <EditFormSettings Visible="True" VisibleIndex="4" />
                </dx:TreeListCheckColumn>
            </Columns>
            <SettingsBehavior AllowEllipsisInText="True" ExpandCollapseAction="NodeClick" />
            <SettingsEditing Mode="PopupEditForm" />
            <SettingsPopupEditForm Modal="True" VerticalAlign="WindowCenter" Width="800px" HorizontalAlign="WindowCenter" />
        </dx:ASPxTreeList>
        <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], CONCAT([Lastname], ' ', [Firstname], ' ', [Patronymic]) AS FIO FROM [Employee] WHERE ([IsWork] = @IsWork) ORDER BY [FIO]">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="IsWork" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
