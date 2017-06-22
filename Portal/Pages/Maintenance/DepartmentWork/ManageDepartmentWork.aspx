<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Maintenance/DepartmentWork/DepartmentWorkMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageDepartmentWork.aspx.cs" Inherits="Portal.Pages.Maintenance.DepartmentWork.ManageDepartmentWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div style="margin-bottom: 10px;">
            <dx:ASPxLabel ID="ASPxLabelDepartmentWork" runat="server" Font-Size="Large">
            </dx:ASPxLabel>
        </div>
        <div style="margin-bottom: 10px;">
            <dx:ASPxButton ID="ASPxButtonAddWork" runat="server" Text="Добавить" AutoPostBack="False">
                <ClientSideEvents Click="function(s, e) {
	if(!ASPxClientCallbackPanelAddWork.InCallback())
                ASPxClientCallbackPanelAddWork.PerformCallback();
}" />
            </dx:ASPxButton>
        </div>
        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%">
            <TabPages>
                <dx:TabPage Text="В работе">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Завершено">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
        </dx:ASPxPageControl>
        <dx:ASPxCallbackPanel ID="ASPxCallbackPanelAddWork" runat="server" Width="200px" ClientInstanceName="ASPxClientCallbackPanelAddWork">
            <ClientSideEvents EndCallback="function(s, e) {
	ASPxClientPopupControlAddWork.Show();
}" />
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxPopupControl ID="ASPxPopupControlAddWork" runat="server" HeaderText="Добавить задание" Modal="True" AllowDragging="True" ClientInstanceName="ASPxClientPopupControlAddWork" CloseOnEscape="True" PopupHorizontalAlign="WindowCenter" PopupVerticalOffset="200" Width="700px">
                        <HeaderStyle BackColor="WhiteSmoke" />
                        <ContentCollection>
                            <dx:PopupControlContentControl runat="server">
                                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Caption="Источник" DataSourceID="SqlDataSourceFromWhom" DropDownStyle="DropDown" TextField="FromWhom" ValueField="FromWhom" Width="100%">
                                    <DropDownButton Visible="False">
                                    </DropDownButton>
                                    <CaptionSettings Position="Top" />
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="AddWorkForm">
                                        <RequiredField ErrorText="Обязательно для заполнения" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SqlDataSourceFromWhom" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT DISTINCT [FromWhom] FROM [DepartmentWork] ORDER BY [FromWhom]"></asp:SqlDataSource>
                                <dx:ASPxMemo ID="ASPxMemo1" runat="server" Caption="Описание" Height="150px" Width="100%">
                                    <CaptionSettings Position="Top" />
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="AddWorkForm">
                                        <RequiredField ErrorText="Обязательно для заполения" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxMemo>
                                <dx:ASPxPanel ID="ASPxPanel1" runat="server" RightToLeft="True" Width="100%">
                                    <Styles>
                                        <Panel>
                                            <Paddings PaddingBottom="10px" PaddingTop="20px" />
                                        </Panel>
                                    </Styles>
                                    <PanelCollection>
                                        <dx:PanelContent runat="server">
                                            <dx:ASPxButton ID="ASPxButtonClose" runat="server" AutoPostBack="False" ClientInstanceName="ASPxClientButtonClose" Text="Отмена">
                                                <ClientSideEvents Click="function(s, e) {
	ASPxClientPopupControlAddWork.Hide();
}" />
                                            </dx:ASPxButton>
                                            <dx:ASPxButton ID="ASPxButtonSave" runat="server" ClientInstanceName="ASPxClientButtonSave" Text="Сохранить" ValidationGroup="AddWorkForm" AutoPostBack="False">
                                                <ClientSideEvents Click="function(s, e) {
	if(ASPxClientEdit.AreEditorsValid())
{
ASPxClientCallbackSaveWork.PerformCallback(); 
}
}" />
                                            </dx:ASPxButton>

                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxPanel>
                            </dx:PopupControlContentControl>
                        </ContentCollection>
                    </dx:ASPxPopupControl>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
        <dx:ASPxCallback ID="ASPxCallbackSaveWork" runat="server" ClientInstanceName="ASPxClientCallbackSaveWork" OnCallback="ASPxCallbackSaveWork_Callback">
            <ClientSideEvents CallbackComplete="function(s, e) {
ASPxClientEdit.ClearEditorsInContainerById('clientContainer')
ASPxClientPopupControlAddWork.Hide();
//ASPxClientGridViewHeadDepartment.Refresh();	
}" />
        </dx:ASPxCallback>
    </div>
</asp:Content>
