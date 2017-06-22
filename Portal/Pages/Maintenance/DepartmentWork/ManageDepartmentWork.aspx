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
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDepartmentWorkInWork" KeyFieldName="Id" Width="900px">
                                <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                                <SettingsSearchPanel Visible="True" />
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="RegisterUserId" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="RegisterEmployeeId" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn FieldName="RegisterDate" ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataDateColumn FieldName="CloseDate" ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn FieldName="FromWhom" ShowInCustomizationForm="True" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="RegisterDescription" ShowInCustomizationForm="True" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CloseUserId" ShowInCustomizationForm="True" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CloseEmployeeId" ShowInCustomizationForm="True" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CloseDescription" ShowInCustomizationForm="True" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="DepartmentId" ShowInCustomizationForm="True" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="SqlDataSourceDepartmentWorkInWork" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [DepartmentWork] WHERE [Id] = @Id" InsertCommand="INSERT INTO [DepartmentWork] ([RegisterUserId], [RegisterEmployeeId], [RegisterDate], [CloseDate], [FromWhom], [RegisterDescription], [CloseUserId], [CloseEmployeeId], [CloseDescription], [DepartmentId]) VALUES (@RegisterUserId, @RegisterEmployeeId, @RegisterDate, @CloseDate, @FromWhom, @RegisterDescription, @CloseUserId, @CloseEmployeeId, @CloseDescription, @DepartmentId)" SelectCommand="SELECT * FROM [DepartmentWork] WHERE (([DepartmentId] = @DepartmentId) AND ([CloseDate] IS NULL))" UpdateCommand="UPDATE [DepartmentWork] SET [RegisterUserId] = @RegisterUserId, [RegisterEmployeeId] = @RegisterEmployeeId, [RegisterDate] = @RegisterDate, [CloseDate] = @CloseDate, [FromWhom] = @FromWhom, [RegisterDescription] = @RegisterDescription, [CloseUserId] = @CloseUserId, [CloseEmployeeId] = @CloseEmployeeId, [CloseDescription] = @CloseDescription, [DepartmentId] = @DepartmentId WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="RegisterUserId" Type="String" />
                                    <asp:Parameter Name="RegisterEmployeeId" Type="Int32" />
                                    <asp:Parameter Name="RegisterDate" Type="DateTime" />
                                    <asp:Parameter Name="CloseDate" Type="DateTime" />
                                    <asp:Parameter Name="FromWhom" Type="String" />
                                    <asp:Parameter Name="RegisterDescription" Type="String" />
                                    <asp:Parameter Name="CloseUserId" Type="String" />
                                    <asp:Parameter Name="CloseEmployeeId" Type="Int32" />
                                    <asp:Parameter Name="CloseDescription" Type="String" />
                                    <asp:Parameter Name="DepartmentId" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="RegisterUserId" Type="String" />
                                    <asp:Parameter Name="RegisterEmployeeId" Type="Int32" />
                                    <asp:Parameter Name="RegisterDate" Type="DateTime" />
                                    <asp:Parameter Name="CloseDate" Type="DateTime" />
                                    <asp:Parameter Name="FromWhom" Type="String" />
                                    <asp:Parameter Name="RegisterDescription" Type="String" />
                                    <asp:Parameter Name="CloseUserId" Type="String" />
                                    <asp:Parameter Name="CloseEmployeeId" Type="Int32" />
                                    <asp:Parameter Name="CloseDescription" Type="String" />
                                    <asp:Parameter Name="DepartmentId" Type="Int32" />
                                    <asp:Parameter Name="Id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
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
                                <dx:ASPxComboBox ID="ASPxComboBoxFromWhom" runat="server" Caption="Источник" DataSourceID="SqlDataSourceFromWhom" DropDownStyle="DropDown" TextField="FromWhom" ValueField="FromWhom" Width="100%">
                                    <DropDownButton Visible="False">
                                    </DropDownButton>
                                    <CaptionSettings Position="Top" />
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="AddWorkForm">
                                        <RequiredField ErrorText="Обязательно для заполнения" IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                                <asp:SqlDataSource ID="SqlDataSourceFromWhom" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT DISTINCT [FromWhom] FROM [DepartmentWork] ORDER BY [FromWhom]"></asp:SqlDataSource>
                                <dx:ASPxMemo ID="ASPxMemoDescription" runat="server" Caption="Описание" Height="150px" Width="100%">
                                    <CaptionSettings Position="Top" />
                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="AddWorkForm">
                                        <RequiredField ErrorText="Обязательно для заполнения" IsRequired="True" />
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
