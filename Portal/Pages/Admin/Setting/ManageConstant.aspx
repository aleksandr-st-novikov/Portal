<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Setting/SettingMain.master" AutoEventWireup="true" CodeBehind="ManageConstant.aspx.cs" Inherits="Portal.Pages.Admin.Setting.ManageConstant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Справочник констант" Font-Bold="False" Font-Size="Large"></dx:ASPxLabel>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceConstant" KeyFieldName="Id" Width="800px">
            <SettingsPager Visible="False">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" Width="800px" Modal="True" />
            </SettingsPopup>
            <SettingsSearchPanel Visible="True" />
            <StylesPopup>
                <EditForm>
                    <Header BackColor="WhiteSmoke">
                    </Header>
                </EditForm>
            </StylesPopup>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Width="20px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Наименование" FieldName="Name" VisibleIndex="2" Width="200px">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Значение" FieldName="Value" VisibleIndex="3" Width="300px">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn Caption="Описание" FieldName="Description" VisibleIndex="4" Width="300px">
                    <PropertiesMemoEdit Height="70px">
                    </PropertiesMemoEdit>
                    <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataMemoColumn>
            </Columns>
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
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceConstant" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Constant] WHERE [Id] = @original_Id AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Value] = @original_Value) OR ([Value] IS NULL AND @original_Value IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" InsertCommand="INSERT INTO [Constant] ([Name], [Value], [Description]) VALUES (@Name, @Value, @Description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Constant] ORDER BY [Name]" UpdateCommand="UPDATE [Constant] SET [Name] = @Name, [Value] = @Value, [Description] = @Description WHERE [Id] = @original_Id AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Value] = @original_Value) OR ([Value] IS NULL AND @original_Value IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Value" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Value" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Value" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Value" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
