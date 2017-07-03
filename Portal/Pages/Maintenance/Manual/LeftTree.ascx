<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftTree.ascx.cs" Inherits="Portal.Pages.Maintenance.DepartmentWork.LeftTree" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>


<div style="margin: 10px 0;">
    <dx:ASPxTreeList ID="ASPxTreeListCategory" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCategory" KeyFieldName="Id" ParentFieldName="ParentId" ClientInstanceName="ASPxClientTreeListCategory" Height="100%" Width="100%">
        <Columns>
            <dx:TreeListTextColumn FieldName="Name" VisibleIndex="0" Caption="Категории">
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:TreeListTextColumn>
            <dx:TreeListCommandColumn Caption=" " VisibleIndex="1" ButtonType="Image" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" Width="20%">
                <EditButton Visible="True">
                    <Image IconID="edit_edit_16x16office2013">
                    </Image>
                </EditButton>
                <NewButton>
                    <Image IconID="actions_additem_16x16office2013">
                    </Image>
                </NewButton>
                <DeleteButton Visible="True">
                    <Image IconID="actions_deletelist_16x16office2013">
                    </Image>
                </DeleteButton>
                <UpdateButton>
                    <Image IconID="save_save_16x16office2013">
                    </Image>
                </UpdateButton>
                <CancelButton>
                    <Image IconID="actions_cancel_16x16office2013">
                    </Image>
                </CancelButton>
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:TreeListCommandColumn>
        </Columns>
        <SettingsBehavior AllowFocusedNode="True" AllowEllipsisInText="True" ExpandCollapseAction="NodeClick" />
        <SettingsEditing AllowNodeDragDrop="True" />
        <Styles>
            <Header Font-Size="Large">
            </Header>
            <SelectedNode Font-Bold="False">
            </SelectedNode>
            <FocusedNode BackColor="WhiteSmoke" ForeColor="#484848">
            </FocusedNode>
        </Styles>
    </dx:ASPxTreeList>
</div>

<asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], [ParentId], [IsCategory], [Name] FROM [Manual] ORDER BY [Name]" DeleteCommand="DELETE FROM [Manual] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Manual] ([ParentId], [IsCategory], [Name]) VALUES (@ParentId, @IsCategory, @Name)" UpdateCommand="UPDATE [Manual] SET [ParentId] = @ParentId, [IsCategory] = @IsCategory, [Name] = @Name WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ParentId" Type="Int32" />
        <asp:Parameter Name="IsCategory" Type="Boolean" />
        <asp:Parameter Name="Name" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="ParentId" Type="Int32" />
        <asp:Parameter Name="IsCategory" Type="Boolean" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>



