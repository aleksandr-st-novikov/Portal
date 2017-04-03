﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/Transport/TransportMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageTransport.aspx.cs" Inherits="Portal.Pages.Journal.Transport.ManageTransport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div style="margin-bottom: 10px;">
            <dx:ASPxLabel ID="ASPxLabelDepartment" runat="server" Font-Size="Large">
            </dx:ASPxLabel>
        </div>
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Добавить запись" AutoPostBack="False">
            <ClientSideEvents Click="function(s, e) {
	ASPxClientPopupControlAddRecord.Show();
}" />
            <Image IconID="actions_driving_16x16devav">
            </Image>
        </dx:ASPxButton>
        <dx:ASPxGridView ID="ASPxGridViewHeadDepartment" runat="server" Width="1000" AutoGenerateColumns="False" ClientInstanceName="ASPxClientGridViewHeadDepartment" DataSourceID="SqlDataSourceTransportHeadDepartment" KeyFieldName="Id">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsCommandButton>
                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
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
            <SettingsDataSecurity AllowInsert="False" />
            <SettingsPopup>
                <EditForm HorizontalAlign="NotSet" HorizontalOffset="200" Modal="True" VerticalAlign="WindowCenter" Width="800px" />
            </SettingsPopup>
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Caption=" " Width="50">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Address" VisibleIndex="6" Caption="Адрес" Width="300">
                    <PropertiesTextEdit MaxLength="300">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DateTransport" VisibleIndex="2" Caption="Дата" Width="80">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Сотрудник" FieldName="EmployeeId" VisibleIndex="5" Width="370">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEmployeeHeadDepartment" TextField="FIO" ValueField="Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Подразделение" FieldName="DepartmentId" VisibleIndex="4" Width="200">
                    <PropertiesComboBox DataSourceID="SqlDataSourceDepartment" TextField="ShortName" ValueField="Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceTransportHeadDepartment" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Transport] WHERE [Id] = @original_Id AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND [DateTransport] = @original_DateTransport AND (([EmployeeId] = @original_EmployeeId) OR ([EmployeeId] IS NULL AND @original_EmployeeId IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL))" InsertCommand="INSERT INTO [Transport] ([Address], [DateTransport], [EmployeeId], [DepartmentId]) VALUES (@Address, @DateTransport, @EmployeeId, @DepartmentId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Transport] WHERE (([DepartmentId] = @DepartmentId) AND ([DateTransport] &gt;= @DateTransport2) AND ([DateTransport] &lt;= @DateTransport)) ORDER BY [DateTransport] DESC, [Id] DESC" UpdateCommand="UPDATE [Transport] SET [Address] = @Address, [DateTransport] = @DateTransport, [EmployeeId] = @EmployeeId, [DepartmentId] = @DepartmentId WHERE [Id] = @original_Id AND (([Address] = @original_Address) OR ([Address] IS NULL AND @original_Address IS NULL)) AND [DateTransport] = @original_DateTransport AND (([EmployeeId] = @original_EmployeeId) OR ([EmployeeId] IS NULL AND @original_EmployeeId IS NULL)) AND (([DepartmentId] = @original_DepartmentId) OR ([DepartmentId] IS NULL AND @original_DepartmentId IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_DateTransport" Type="DateTime" />
                <asp:Parameter Name="original_EmployeeId" Type="Int32" />
                <asp:Parameter Name="original_DepartmentId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="DateTransport" Type="DateTime" />
                <asp:Parameter Name="EmployeeId" Type="Int32" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="Int32" />
                <asp:SessionParameter Name="DateTransport2" SessionField="DateTo" Type="DateTime" />
                <asp:SessionParameter Name="DateTransport" SessionField="DateFrom" Type="DateTime" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="DateTransport" Type="DateTime" />
                <asp:Parameter Name="EmployeeId" Type="Int32" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_DateTransport" Type="DateTime" />
                <asp:Parameter Name="original_EmployeeId" Type="Int32" />
                <asp:Parameter Name="original_DepartmentId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceEmployeeHeadDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            SelectCommand="SELECT [Id], CONCAT([Lastname], ' ', [Firstname], ' ', [Patronymic]) AS FIO FROM [Employee] WHERE ([IsWork] = @IsWork) AND ([DepartmentId] = @DepartmentId) ORDER BY [FIO]">
            <SelectParameters>
                <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="Int32" />
                <asp:Parameter DefaultValue="True" Name="IsWork" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceEmployeeEntrance" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
            SelectCommand="SELECT [Id], CONCAT([Lastname], ' ', [Firstname], ' ', [Patronymic]) AS FIO FROM [Employee] WHERE ([IsWork] = @IsWork) ORDER BY [FIO]">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="IsWork" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <dx:ASPxCallback ID="ASPxCallbackAdd" runat="server" ClientInstanceName="ASPxClientCallbackAdd" OnCallback="ASPxCallbackAdd_Callback">
            <ClientSideEvents CallbackComplete="function(s, e) {
                ASPxClientPopupControlAddRecord.Hide();
                ASPxClientGridViewHeadDepartment.Refresh();
            }" />
        </dx:ASPxCallback>
        <asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], [Name], [ShortName] FROM [Department] ORDER BY [Name], [ShortName]"></asp:SqlDataSource>
        <dx:ASPxPopupControl ID="ASPxPopupControlAddRecord" runat="server" AllowDragging="True" ClientInstanceName="ASPxClientPopupControlAddRecord" CloseOnEscape="True" HeaderText="Добавить запись" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalOffset="200" Width="700px">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <table style="width: 100%; vertical-align: top; margin: 15px 0 20px 0;">
                        <tr>
                            <td style="width: 40%;">
                                <dx:ASPxDateEdit ID="ASPxDateEditTransport" runat="server" Caption="Дата">
                                    <CaptionCellStyle Width="60px">
                                    </CaptionCellStyle>
                                    <ValidationSettings ValidationGroup="FormAddValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                        <RequiredField ErrorText="Дата не указана." IsRequired="true" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </td>
                            <td style="width: 60%;">
                                <dx:ASPxComboBox ID="ASPxComboBoxEmployee" runat="server" ValueType="System.String" Caption="Сотрудник" Width="100%" DataSourceID="SqlDataSourceEmployeeHeadDepartment" TextField="FIO" ValueField="Id">
                                    <ValidationSettings ValidationGroup="FormAddValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                        <RequiredField ErrorText="Сотрудник не указан." IsRequired="true" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding-top: 10px;">
                                <dx:ASPxTextBox ID="ASPxTextBoxAddress" runat="server" Width="100%" Caption="Адрес">
                                    <CaptionCellStyle Width="60px">
                                    </CaptionCellStyle>
                                    <ValidationSettings ValidationGroup="FormAddValidationGroup" Display="Dynamic" ErrorTextPosition="Bottom" ErrorDisplayMode="Text">
                                        <RequiredField ErrorText="Вы не указали адрес." IsRequired="true" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                    <dx:ASPxPanel ID="ASPxPanel1" runat="server" RightToLeft="True" Width="100%">
                        <PanelCollection>
                            <dx:PanelContent runat="server">
                                <dx:ASPxButton ID="ASPxButton2" runat="server" AutoPostBack="False" Text="Отмена">
                                    <ClientSideEvents Click="function(s, e) {
	                                    ASPxClientPopupControlAddRecord.Hide();
                                    }" />
                                </dx:ASPxButton>
                                <dx:ASPxButton ID="ASPxButton3" runat="server" AutoPostBack="False" Text="Сохранить">
                                    <ClientSideEvents Click="function(s, e) {
	                                    ASPxClientCallbackAdd.PerformCallback();
                                    }" />
                                </dx:ASPxButton>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
