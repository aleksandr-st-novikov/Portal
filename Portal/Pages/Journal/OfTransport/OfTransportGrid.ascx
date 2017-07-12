<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OfTransportGrid.ascx.cs" Inherits="Portal.Pages.Journal.OfTransport.OfTransportGrid" %>
<dx:ASPxGridView ID="ASPxGridViewOfTransport" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxClientGridViewOfTransport" DataSourceID="SqlDataSourceOfTransport" KeyFieldName="Id" OnRowInserting="ASPxGridViewOfTransport_RowInserting" Width="1200px">
    <SettingsEditing Mode="PopupEditForm">
    </SettingsEditing>
    <SettingsPopup>
        <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="900px" />
    </SettingsPopup>
    <SettingsSearchPanel Visible="True" />
    <StylesPopup>
        <EditForm>
            <Header BackColor="WhiteSmoke">
            </Header>
        </EditForm>
    </StylesPopup>
    <SettingsBehavior ConfirmDelete="True" />
    <SettingsCommandButton>
                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                <NewButton>
                    <Image ToolTip="Создать" IconID="actions_additem_16x16office2013">
                    </Image>
                </NewButton>
                <EditButton>
                    <Image ToolTip="Редактировать" IconID="edit_edit_16x16office2013" />
                </EditButton>
                <DeleteButton>
                    <Image ToolTip="Удалить" IconID="actions_deletelist_16x16office2013" />
                </DeleteButton>
                <UpdateButton RenderMode="Button">
                </UpdateButton>
                <CancelButton RenderMode="Link">
                </CancelButton>
            </SettingsCommandButton>
    <Columns>
        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Width="30px">
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn Caption="Код" FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Дата, время" FieldName="Date" Name="colDate" VisibleIndex="2" Width="120px">
            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm" EditFormat="Custom" EditFormatString="dd/MM/yyyy HH:mm">
                <TimeSectionProperties Visible="True">
                </TimeSectionProperties>
                <ValidationSettings Display="Dynamic">
                    <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                </ValidationSettings>
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn Caption="Автор" FieldName="EmployeeId" Visible="False" VisibleIndex="8">
            <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" DropDownStyle="DropDown" TextField="FIO" ValueField="Id">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Сопровождающий" FieldName="Attendant" VisibleIndex="7">
            <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" DropDownStyle="DropDown" TextField="FIO" ValueField="Id">
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Заказчик" FieldName="Customer" VisibleIndex="3" Width="250px">
            <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" DropDownStyle="DropDown" TextField="FIO" ValueField="Id">
                <ValidationSettings Display="Dynamic">
                    <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataMemoColumn Caption="Маршрут" FieldName="Route" VisibleIndex="4" Width="300px">
            <PropertiesMemoEdit Height="80px">
                <ValidationSettings Display="Dynamic">
                    <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                </ValidationSettings>
            </PropertiesMemoEdit>
            <EditFormSettings ColumnSpan="2" />
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataMemoColumn Caption="Цель" FieldName="Purpose" VisibleIndex="6" Width="300px">
            <PropertiesMemoEdit Height="80px">
            </PropertiesMemoEdit>
            <EditFormSettings ColumnSpan="2" />
        </dx:GridViewDataMemoColumn>
    </Columns>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSourceOfTransport" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [OfTransport] WHERE [Id] = @original_Id AND [Date] = @original_Date AND (([Customer] = @original_Customer) OR ([Customer] IS NULL AND @original_Customer IS NULL)) AND (([Route] = @original_Route) OR ([Route] IS NULL AND @original_Route IS NULL)) AND (([Purpose] = @original_Purpose) OR ([Purpose] IS NULL AND @original_Purpose IS NULL)) AND (([Attendant] = @original_Attendant) OR ([Attendant] IS NULL AND @original_Attendant IS NULL)) AND [EmployeeId] = @original_EmployeeId" InsertCommand="INSERT INTO [OfTransport] ([Date], [Customer], [Route], [Purpose], [Attendant], [EmployeeId]) VALUES (@Date, @Customer, @Route, @Purpose, @Attendant, @EmployeeId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [OfTransport] WHERE (([Date] &lt;= @Date2) AND ([Date] &gt;= @Date)) ORDER BY [Date] DESC" UpdateCommand="UPDATE [OfTransport] SET [Date] = @Date, [Customer] = @Customer, [Route] = @Route, [Purpose] = @Purpose, [Attendant] = @Attendant, [EmployeeId] = @EmployeeId WHERE [Id] = @original_Id AND [Date] = @original_Date AND (([Customer] = @original_Customer) OR ([Customer] IS NULL AND @original_Customer IS NULL)) AND (([Route] = @original_Route) OR ([Route] IS NULL AND @original_Route IS NULL)) AND (([Purpose] = @original_Purpose) OR ([Purpose] IS NULL AND @original_Purpose IS NULL)) AND (([Attendant] = @original_Attendant) OR ([Attendant] IS NULL AND @original_Attendant IS NULL)) AND [EmployeeId] = @original_EmployeeId">
    <DeleteParameters>
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_Date" Type="DateTime" />
        <asp:Parameter Name="original_Customer" Type="String" />
        <asp:Parameter Name="original_Route" Type="String" />
        <asp:Parameter Name="original_Purpose" Type="String" />
        <asp:Parameter Name="original_Attendant" Type="String" />
        <asp:Parameter Name="original_EmployeeId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Date" Type="DateTime" />
        <asp:Parameter Name="Customer" Type="String" />
        <asp:Parameter Name="Route" Type="String" />
        <asp:Parameter Name="Purpose" Type="String" />
        <asp:Parameter Name="Attendant" Type="String" />
        <asp:Parameter Name="EmployeeId" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="Date2" SessionField="DateTo" Type="DateTime" />
        <asp:SessionParameter Name="Date" SessionField="DateFrom" Type="DateTime" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Date" Type="DateTime" />
        <asp:Parameter Name="Customer" Type="String" />
        <asp:Parameter Name="Route" Type="String" />
        <asp:Parameter Name="Purpose" Type="String" />
        <asp:Parameter Name="Attendant" Type="String" />
        <asp:Parameter Name="EmployeeId" Type="Int32" />
        <asp:Parameter Name="original_Id" Type="Int32" />
        <asp:Parameter Name="original_Date" Type="DateTime" />
        <asp:Parameter Name="original_Customer" Type="String" />
        <asp:Parameter Name="original_Route" Type="String" />
        <asp:Parameter Name="original_Purpose" Type="String" />
        <asp:Parameter Name="original_Attendant" Type="String" />
        <asp:Parameter Name="original_EmployeeId" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="GetEmployeeFIO" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="0" Name="departmentId" Type="Int32" />
        <asp:Parameter DefaultValue="1" Name="isWork" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

