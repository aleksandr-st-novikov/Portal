<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailPopup.ascx.cs" Inherits="Portal.Pages.Maintenance.Schedule.DetailPopup" %>

<dx:ASPxPopupControl ID="ASPxPopupControlDetail" runat="server" ClientInstanceName="ASPxClientPopupControlDetail" HeaderText="История выполнения задания" Width="900px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <HeaderStyle BackColor="WhiteSmoke" />
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanelDetail" runat="server" ClientInstanceName="ASPxClientCallbackPanelDetail" Width="100%" OnCallback="ASPxCallbackPanelDetail_Callback">
                <ClientSideEvents EndCallback="function(s, e) {
	ASPxClientPopupControlDetail.Show();
    ASPxClientGridViewDetail.Refresh();
    
}" />
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxGridView ID="ASPxGridViewDetail" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceJobResult" KeyFieldName="Id" Width="100%" ClientInstanceName="ASPxClientGridViewDetail">
                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="JobId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn Caption="Время запуска" FieldName="DateRun" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="Custom" EditFormatString="dd/MM/yyyy HH:mm:ss">
                                    </PropertiesDateEdit>
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn Caption="Описание" FieldName="Description" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Результат" FieldName="Result" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                </dx:GridViewDataComboBoxColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSourceJobResult" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [JobResult] WHERE ([JobId] = @JobId) ORDER BY [DateRun] DESC">
                            <SelectParameters>
                                <asp:SessionParameter Name="JobId" SessionField="DetailJobId" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
            <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" RightToLeft="True">
                <Paddings PaddingTop="15px" />
                <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Закрыть" AutoPostBack="False">
        <ClientSideEvents Click="function(s, e) {
	ASPxClientPopupControlDetail.Hide();
}" />
    </dx:ASPxButton>
                </dx:PanelContent>
</PanelCollection>
            </dx:ASPxPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
