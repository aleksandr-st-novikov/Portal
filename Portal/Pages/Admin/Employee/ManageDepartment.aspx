<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Employee/EmployeeMain.master" AutoEventWireup="true" CodeBehind="ManageDepartment.aspx.cs" Inherits="Portal.Pages.Admin.Employee.ManageDepartment" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Department] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [Department] ([HeadId], [Name], [ParentId], [IsActive], [ShortName]) VALUES (@HeadId, @Name, @ParentId, @IsActive, @ShortName)" OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT * FROM [Department] ORDER BY [Name]" UpdateCommand="UPDATE [Department] SET [HeadId] = @HeadId, [Name] = @Name, [ParentId] = @ParentId, [IsActive] = @IsActive, [ShortName] = @ShortName WHERE [Id] = @original_Id">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="HeadId" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ParentId" Type="Int32" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:Parameter Name="ShortName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="HeadId" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ParentId" Type="Int32" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:Parameter Name="ShortName" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDepartment" KeyFieldName="Id" ParentFieldName="ParentId" Width="900px" OnInitNewNode="ASPxTreeList1_InitNewNode">
            <Columns>
                <dx:TreeListTextColumn Caption="Наименование" FieldName="Name" VisibleIndex="0" Width="320px">
                </dx:TreeListTextColumn>
                <dx:TreeListCheckColumn Caption="Активный" FieldName="IsActive" Visible="False" VisibleIndex="4">
                    <EditFormSettings Visible="True" />
                </dx:TreeListCheckColumn>
                <dx:TreeListTextColumn FieldName="ShortName" VisibleIndex="1" Caption="Краткое наименование" Width="160px">
                    <EditFormSettings Visible="True" />
                </dx:TreeListTextColumn>
                <dx:TreeListCommandColumn Caption=" " VisibleIndex="5" Width="20px" ShowNewButtonInHeader="True">
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
                </dx:TreeListCommandColumn>
                <dx:TreeListComboBoxColumn Caption="Подчинение" FieldName="ParentId" Visible="False" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="SqlDataSourceDepartment" TextField="Name" ValueField="Id">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:TreeListComboBoxColumn>
                <dx:TreeListComboBoxColumn Caption="Руководитель" FieldName="HeadId" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" TextField="FIO" ValueField="Id">
                    </PropertiesComboBox>
                    <CellStyle HorizontalAlign="Left">
                    </CellStyle>
                </dx:TreeListComboBoxColumn>
            </Columns>
            <SettingsBehavior AllowFocusedNode="True" />
            <SettingsEditing Mode="PopupEditForm" />
            <SettingsPopupEditForm Modal="True" VerticalAlign="Above" Width="800px" />
        </dx:ASPxTreeList>
        <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], CONCAT([Lastname], ' ', [Firstname], ' ', [Patronymic]) AS FIO FROM [Employee] WHERE ([IsWork] = @IsWork) ORDER BY [FIO]">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="IsWork" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
