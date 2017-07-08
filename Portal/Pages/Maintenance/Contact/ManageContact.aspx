<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Maintenance/Contact/ContactMain.master" AutoEventWireup="true" CodeBehind="ManageContact.aspx.cs" Inherits="Portal.Pages.Maintenance.Contact.ManageContact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">

        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="Large" Text="Организации, контакты">
        </dx:ASPxLabel>

        <dx:ASPxGridView ID="ASPxGridViewContact" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxClientGridViewContact" DataSourceID="SqlDataSourceContact" KeyFieldName="Id" Width="1200px">
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
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Width="50px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Caption="Код" Width="50px">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="2" Caption="Наименование" Width="200px">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Activity" VisibleIndex="3" Caption="Вид деятельности" Width="150px">
                    <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn Caption="Контакты" FieldName="Contacts" VisibleIndex="4">
                    <PropertiesMemoEdit Height="150px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesMemoEdit>
                    <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataMemoColumn>
            </Columns>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
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
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceContact" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Contact] WHERE [Id] = @original_Id AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Activity] = @original_Activity) OR ([Activity] IS NULL AND @original_Activity IS NULL)) AND (([Contacts] = @original_Contacts) OR ([Contacts] IS NULL AND @original_Contacts IS NULL))" InsertCommand="INSERT INTO [Contact] ([Name], [Activity], [Contacts]) VALUES (@Name, @Activity, @Contacts)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Contact] ORDER BY [Name]" UpdateCommand="UPDATE [Contact] SET [Name] = @Name, [Activity] = @Activity, [Contacts] = @Contacts WHERE [Id] = @original_Id AND (([Name] = @original_Name) OR ([Name] IS NULL AND @original_Name IS NULL)) AND (([Activity] = @original_Activity) OR ([Activity] IS NULL AND @original_Activity IS NULL)) AND (([Contacts] = @original_Contacts) OR ([Contacts] IS NULL AND @original_Contacts IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Activity" Type="String" />
                <asp:Parameter Name="original_Contacts" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Activity" Type="String" />
                <asp:Parameter Name="Contacts" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Activity" Type="String" />
                <asp:Parameter Name="Contacts" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Activity" Type="String" />
                <asp:Parameter Name="original_Contacts" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
