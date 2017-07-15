<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TransportGrid.ascx.cs" Inherits="Portal.Pages.Journal.Transport.TransportGrid" %>
<dx:ASPxGridView ID="ASPxGridViewTransport" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxClientGridViewTransport" DataSourceID="SqlDataSourceTransport" KeyFieldName="Id" Width="1200px" OnInitNewRow="ASPxGridViewTransport_InitNewRow" OnRowInserting="ASPxGridViewTransport_RowInserting">
    <SettingsPager PageSize="20">
    </SettingsPager>
    <SettingsEditing Mode="PopupEditForm">
    </SettingsEditing>
    <SettingsBehavior ConfirmDelete="True" />
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
        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Width="50px">
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Дата" FieldName="DateTransport" VisibleIndex="2" Width="100px">
            <PropertiesDateEdit>
                <ValidationSettings Display="Dynamic">
                    <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                </ValidationSettings>
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn Caption="Сотрудник" FieldName="EmployeeId" VisibleIndex="3" Width="300px">
            <PropertiesComboBox DataSourceID="SqlDataSourceEmployee" TextField="FIO" ValueField="Id">
                <ValidationSettings Display="Dynamic">
                    <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Адрес" FieldName="Address" VisibleIndex="4" Width="400px">
            <PropertiesComboBox DropDownStyle="DropDown">
                <DropDownButton ClientVisible="False">
                </DropDownButton>
                <ValidationSettings Display="Dynamic">
                    <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Подразделение" FieldName="DepartmentId" VisibleIndex="5">
            <PropertiesComboBox DataSourceID="SqlDataSourceDepartment" TextField="ShortName" ValueField="Id">
            </PropertiesComboBox>
            <EditFormSettings Visible="False" />
        </dx:GridViewDataComboBoxColumn>
    </Columns>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSourceTransport" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Transport] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Transport] ([Address], [DateTransport], [EmployeeId], [DepartmentId]) VALUES (@Address, @DateTransport, @EmployeeId, @DepartmentId)" SelectCommand="SELECT * FROM [Transport] WHERE (([DateTransport] &gt;= @DateTransport) AND ([DateTransport] &lt;= @DateTransport2) AND ([DepartmentId] = @DepartmentId)) ORDER BY [DateTransport] DESC" UpdateCommand="UPDATE [Transport] SET [Address] = @Address, [DateTransport] = @DateTransport, [EmployeeId] = @EmployeeId, [DepartmentId] = @DepartmentId WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="DateTransport" Type="DateTime" />
        <asp:Parameter Name="EmployeeId" Type="Int32" />
        <asp:Parameter Name="DepartmentId" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="DateTransport" SessionField="DateFrom" Type="DateTime" />
        <asp:SessionParameter Name="DateTransport2" SessionField="DateTo" Type="DateTime" />
        <asp:SessionParameter Name="DepartmentId" SessionField="DepartmentId" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="DateTransport" Type="DateTime" />
        <asp:Parameter Name="EmployeeId" Type="Int32" />
        <asp:Parameter Name="DepartmentId" Type="Int32" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSourceDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], [ShortName] FROM [Department]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [Id], concat([Lastname], ' ', [Firstname], ' ', [Patronymic]) as FIO FROM [Employee]"></asp:SqlDataSource>


