<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Maintenance/UKM/UKMMain.master" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="Portal.Pages.Maintenance.UKM.Setting" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div style="margin-bottom: 10px;">
            <dx:ASPxLabel ID="ASPxLabelStores" runat="server" Text="Справочник магазинов" Font-Size="Large">
            </dx:ASPxLabel>
        </div>

        <dx:ASPxGridView ID="ASPxGridViewStore" runat="server" ClientInstanceName="ASPxClientGridViewStore" DataSourceID="SqlDataSourceStore" AutoGenerateColumns="False" KeyFieldName="Id">
            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Caption=" ">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StoreId" VisibleIndex="2" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="3" Caption="Наименование" Width="300px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Address" VisibleIndex="5" Caption="Адрес" Width="300px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StoreName" VisibleIndex="4" Caption="Наименование ТЦ" Width="300px">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Cell>
                    <Paddings PaddingBottom="7px" PaddingTop="7px" PaddingLeft="10px" />
                </Cell>
            </Styles>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsCommandButton>
                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>
                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
                <EditButton>
                    <Image ToolTip="Редактировать" IconID="edit_edit_16x16office2013" />
                </EditButton>
                <UpdateButton RenderMode="Button">
                </UpdateButton>
                <CancelButton RenderMode="Button">
                </CancelButton>
            </SettingsCommandButton>
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="900px" />
            </SettingsPopup>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceStore" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" DeleteCommand="DELETE FROM [Store] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Store] ([StoreId], [Name], [Address], [StoreName]) VALUES (@StoreId, @Name, @Address, @StoreName)" SelectCommand="SELECT * FROM [Store] ORDER BY [Name]" UpdateCommand="UPDATE [Store] SET [StoreId] = @StoreId, [Name] = @Name, [Address] = @Address, [StoreName] = @StoreName WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StoreId" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="StoreName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StoreId" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="StoreName" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
