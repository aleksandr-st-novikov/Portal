<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Employee/EmployeeMain.master" AutoEventWireup="true" CodeBehind="ManageDepartment.aspx.cs" Inherits="Portal.Pages.Admin.Employee.ManageDepartment" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v16.1, Version=16.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Department] WHERE [Id] = @original_Id AND (([HeadId] = @original_HeadId) OR ([HeadId] IS NULL AND @original_HeadId IS NULL)) AND [Name] = @original_Name AND (([ParentId] = @original_ParentId) OR ([ParentId] IS NULL AND @original_ParentId IS NULL))" InsertCommand="INSERT INTO [Department] ([HeadId], [Name], [ParentId]) VALUES (@HeadId, @Name, @ParentId)" OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT * FROM [Department] ORDER BY [Name]" UpdateCommand="UPDATE [Department] SET [HeadId] = @HeadId, [Name] = @Name, [ParentId] = @ParentId WHERE [Id] = @original_Id AND (([HeadId] = @original_HeadId) OR ([HeadId] IS NULL AND @original_HeadId IS NULL)) AND [Name] = @original_Name AND (([ParentId] = @original_ParentId) OR ([ParentId] IS NULL AND @original_ParentId IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_HeadId" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_ParentId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="HeadId" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ParentId" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="HeadId" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ParentId" Type="Int32" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_HeadId" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_ParentId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <dx:ASPxTreeList ID="ASPxTreeList1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDepartment" KeyFieldName="Id" ParentFieldName="ParentId" Width="900px">
            <Columns>
                <dx:TreeListTextColumn FieldName="HeadId" VisibleIndex="2" Caption="Руководитель">
                </dx:TreeListTextColumn>
                <dx:TreeListTextColumn FieldName="Name" VisibleIndex="0" Caption="Наименование подразделения" Width="400px">
                    <EditFormSettings VisibleIndex="1" />
                </dx:TreeListTextColumn>
                <dx:TreeListCommandColumn VisibleIndex="4" Caption=" " ShowInCustomizationForm="False" ShowNewButtonInHeader="True" Width="50px">
                    <EditButton Visible="True" Text=" ">
                        <Image IconID="edit_edit_16x16office2013">
                        </Image>
                    </EditButton>
                    <NewButton Text=" ">
                        <Image IconID="actions_additem_16x16office2013">
                        </Image>
                    </NewButton>
                    <DeleteButton Visible="True" Text=" ">
                        <Image IconID="actions_deletelist_16x16office2013">
                        </Image>
                    </DeleteButton>
                </dx:TreeListCommandColumn>
                <dx:TreeListTextColumn Caption="Код" FieldName="Id" Name="Id" VisibleIndex="1" Width="20px" Visible="False">
                    <EditFormSettings Visible="True" VisibleIndex="0" />
                </dx:TreeListTextColumn>
                <dx:TreeListComboBoxColumn Caption="Вышестоящее подразделение" FieldName="ParentId" Visible="False" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="SqlDataSourceDepartment" TextField="Name" ValueField="Id">
                        <ClearButton DisplayMode="Always">
                        </ClearButton>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:TreeListComboBoxColumn>
            </Columns>
            <SettingsBehavior AllowFocusedNode="True" />
            <SettingsEditing Mode="PopupEditForm" />
            <SettingsPopupEditForm Modal="True" VerticalAlign="Above" Width="800px" />
        </dx:ASPxTreeList>
    </div>
</asp:Content>
