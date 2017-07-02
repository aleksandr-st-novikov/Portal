<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftTree.ascx.cs" Inherits="Portal.Pages.Maintenance.DepartmentWork.LeftTree" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<table style="width: 100%;">
    <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Категории" Font-Size="Large">
            </dx:ASPxLabel>
        </td>
        <td style="text-align: right; padding-right: 10px;">
            <dx:ASPxButton ID="ASPxButtonAddCategory" runat="server" HorizontalAlign="Right" Text="Добавить" AutoPostBack="False" ClientInstanceName="ASPxClientButtonAddCategory" ToolTip="Добавить категорию">
                <ClientSideEvents Click="function(s, e) {
	ASPxClientCallbackAddCategory.PerformCallback();
}" />
            </dx:ASPxButton>
        </td>
    </tr>
</table>
<div style="margin: 10px 0;">
    <dx:ASPxTreeList ID="ASPxTreeListCategory" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCategory" KeyFieldName="Id" ParentFieldName="ParentId" ClientInstanceName="ASPxClientTreeListCategory" OnCustomDataCallback="ASPxTreeListCategory_CustomDataCallback">
        <Columns>
            <dx:TreeListTextColumn FieldName="Name" VisibleIndex="0">
            </dx:TreeListTextColumn>
        </Columns>
        <Settings ShowColumnHeaders="False" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    </dx:ASPxTreeList>
</div>

<dx:ASPxCallback ID="ASPxCallbackAddCategory" runat="server" ClientInstanceName="ASPxClientCallbackAddCategory">
    <ClientSideEvents EndCallback="function(s, e) {
	ASPxClientPopupControlAddCategory.Show();
}" />
</dx:ASPxCallback>

<asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], [ParentId], [Name] FROM [Manual] WHERE ([IsCategory] = @IsCategory) ORDER BY [Name]">
    <SelectParameters>
        <asp:Parameter DefaultValue="true" Name="IsCategory" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>


<dx:ASPxPopupControl ID="ASPxPopupControlAddCategory" runat="server" AllowDragging="True" ClientInstanceName="ASPxClientPopupControlAddCategory" HeaderText="Добавить категорию" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="700px">
    <HeaderStyle BackColor="WhiteSmoke" />
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <div style="margin-bottom: 15px;">
                <dx:ASPxTextBox ID="ASPxTextBoxNameCategory" runat="server" Caption="Название" Width="100%" ClientInstanceName="ASPxClientTextBoxNameCategory">
                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="AddCategory">
                        <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                    </ValidationSettings>
                    <CaptionCellStyle Width="110px">
                    </CaptionCellStyle>
                </dx:ASPxTextBox>
            </div>
            <div style="margin-bottom: 15px;">
                <dx:ASPxComboBox ID="ASPxComboBoxParentCategory" runat="server" Caption="Поместить в" Width="100%" ClientInstanceName="ASPxClientComboBoxParentCategory" DataSourceID="SqlDataSourceCategory" DropDownStyle="DropDown" TextField="Name" ValueField="Id">
                    <ClearButton DisplayMode="OnHover">
                    </ClearButton>
                    <CaptionCellStyle Width="110px">
                    </CaptionCellStyle>
                </dx:ASPxComboBox>
            </div>
            <dx:ASPxPanel ID="ASPxPanel1" runat="server" RightToLeft="True" Width="100%">
                <Paddings PaddingBottom="10px" PaddingTop="10px" />
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxButton ID="ASPxButtonCancelCategory" runat="server" Text="Отмена" AutoPostBack="False" ClientInstanceName="ASPxClientButtonCancelCategory">
                            <ClientSideEvents Click="function(s, e) {
	ASPxClientPopupControlAddCategory.Hide();
}" />
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="ASPxButtonSaveCategory" runat="server" Text="Сохранить" AutoPostBack="False" ClientInstanceName="ASPxClientButtonSaveCategory" ValidationGroup="AddCategory">
                            <ClientSideEvents Click="function(s, e) {
                                    if(ASPxClientEdit.AreEditorsValid())
                                    {
                                        if(!ASPxClientCallbackSaveCategory.InCallback())
                                        {	
                                            ASPxClientCallbackSaveCategory.PerformCallback();
                                        }
                                    }
                                    }" />
                        </dx:ASPxButton>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxCallback ID="ASPxCallbackSaveCategory" runat="server" ClientInstanceName="ASPxClientCallbackSaveCategory" OnCallback="ASPxCallbackSaveCategory_Callback">
    <ClientSideEvents EndCallback="function(s, e) {
            ASPxClientEdit.ClearEditorsInContainerById('clientContainer');
            ASPxClientPopupControlAddCategory.Hide();
            ASPxClientTreeListCategory.PerformCallback();
            }" />
</dx:ASPxCallback>
