<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccessoriesTable.ascx.cs" Inherits="Portal.Pages.Journal.Accessories.AccessoriesTable" %>


<dx:ASPxCallbackPanel ID="ASPxCallbackPanelShowPopup" runat="server" ClientInstanceName="ASPxClientCallbackPanelShowPopup" OnCallback="ASPxCallbackPanelShowPopup_Callback">
    <SettingsLoadingPanel Enabled="False" />
    <ClientSideEvents EndCallback="function(s, e) {
	ASPxClientPopupControlAccessoriesTable.Show();
                ASPxClientGridViewAccessoriesTable.Refresh();
}" />
    <PanelCollection>
        <dx:PanelContent runat="server">
            <dx:ASPxPopupControl ID="ASPxPopupControlAccessoriesTable" runat="server" AllowDragging="True" ClientInstanceName="ASPxClientPopupControlAccessoriesTable" HeaderText="Заявка" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalOffset="50" Width="900px" Height="850px" CloseAction="None">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%">
                            <Paddings PaddingBottom="15px" />
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Заявка на дату: " Width="150px">
                                    </dx:ASPxLabel>
                                    <dx:ASPxLabel ID="ASPxLabelDate" runat="server" ClientInstanceName="ASPxClientLabelDate">
                                    </dx:ASPxLabel>
                                    <br />
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Подразделение:" Width="150px">
                                    </dx:ASPxLabel>
                                    <dx:ASPxLabel ID="ASPxLabelDepartmentEmployee" runat="server" ClientInstanceName="ASPxClientLabelDepartmentEmployee">
                                    </dx:ASPxLabel>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                        <dx:ASPxGridView ID="ASPxGridViewAccessoriesTable" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAccessoriesTable" KeyFieldName="Id" Width="100%" ClientInstanceName="ASPxClientGridViewAccessoriesTable">
                            <SettingsPager Mode="EndlessPaging">
                            </SettingsPager>
                            <SettingsEditing Mode="Batch">
                            </SettingsEditing>
                            <Settings VerticalScrollableHeight="470" />
                            <SettingsCommandButton>
                                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                                <UpdateButton>
                                    <Image ToolTip="Сохранить" IconID="actions_save_16x16devav" />
                                </UpdateButton>
                                <CancelButton>
                                    <Image ToolTip="Отмена" IconID="actions_cancel_16x16office2013" />
                                </CancelButton>
                            </SettingsCommandButton>
                            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                            <SettingsSearchPanel Visible="True" />
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="AccessoriesId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QuantityAgreed" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Наименование" FieldName="AccessoriesProductId" ShowInCustomizationForm="True" VisibleIndex="2" Width="500px" ReadOnly="True">
                                    <PropertiesComboBox DataSourceID="SqlDataSourceAccessoriesProduct" TextField="Name" ValueField="Id">
                                    </PropertiesComboBox>
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Ед.изм." FieldName="AccessoriesProductId" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px" ReadOnly="True">
                                    <PropertiesComboBox DataSourceID="SqlDataSourceAccessoriesProduct" TextField="Unit" ValueField="Id">
                                    </PropertiesComboBox>
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataSpinEditColumn Caption="Кол-во" FieldName="Quantity" ShowInCustomizationForm="True" VisibleIndex="4" Width="120px">
                                    <PropertiesSpinEdit DisplayFormatString="g" MaxValue="100" NumberType="Integer">
                                    </PropertiesSpinEdit>
                                </dx:GridViewDataSpinEditColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSourceAccessoriesTable" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                            DeleteCommand="DELETE FROM [AccessoriesTable] WHERE [Id] = @Id"
                            InsertCommand="INSERT INTO [AccessoriesTable] ([AccessoriesId], [AccessoriesProductId], [Quantity], [QuantityAgreed]) VALUES (@AccessoriesId, @AccessoriesProductId, @Quantity, @QuantityAgreed)"
                            SelectCommand="SELECT * FROM [AccessoriesTable] WHERE ([AccessoriesId] = @AccessoriesId)"
                            UpdateCommand="UPDATE [AccessoriesTable] SET [Quantity] = @Quantity, [QuantityAgreed] = @QuantityAgreed WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="AccessoriesId" Type="Int32" />
                                <asp:Parameter Name="AccessoriesProductId" Type="Int32" />
                                <asp:Parameter Name="Quantity" Type="Int32" />
                                <asp:Parameter Name="QuantityAgreed" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="AccessoriesId" SessionField="AccessoriesId" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <%--<asp:Parameter Name="AccessoriesId" Type="Int32" />
                                <asp:Parameter Name="AccessoriesProductId" Type="Int32" />--%>
                                <asp:Parameter Name="Quantity" Type="Int32" />
                                <asp:Parameter Name="QuantityAgreed" Type="Int32" />
                                <asp:Parameter Name="Id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                        <asp:SqlDataSource ID="SqlDataSourceAccessoriesProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], [Name], [Unit] FROM [AccessoriesProduct] ORDER BY [Name]"></asp:SqlDataSource>
                        <dx:ASPxPanel ID="ASPxPanel2" runat="server" RightToLeft="True" Width="100%">
                            <Paddings PaddingBottom="15px" />
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Закрыть" UseSubmitBehavior="False">
                                        <ClientSideEvents Click="function(s, e) {
	                                        ASPxClientPopupControlAccessoriesTable.Hide();
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

