<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/Accessories/AccessoriesMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageAccessories.aspx.cs" Inherits="Portal.Pages.Journal.Accessories.ManageAccessories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <dx:ASPxCallback ID="ASPxCallbackRefreshGrid" runat="server" ClientInstanceName="ASPxClientCallbackRefreshGrid" OnCallback="ASPxCallbackRefreshGrid_Callback">
        </dx:ASPxCallback>
        <asp:SqlDataSource ID="SqlDataSourceAccessoriesType" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [AccessoriesType] ORDER BY [Name]"></asp:SqlDataSource>
        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="900px">
            <Paddings PaddingBottom="15px" />
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxComboBox ID="ASPxComboBoxAccessoriesType" runat="server" DataSourceID="SqlDataSourceAccessoriesType" TextField="Name" ValueField="Id" Width="400px" Caption="Выберите категорию">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
                            ASPxClientCallbackRefreshGrid.PerformCallback();
	                        ASPxClientGridViewAccessoriesProduct.Refresh();
                        }" />
                    </dx:ASPxComboBox>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>



        <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="900px">
            <Paddings PaddingBottom="15px" />
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Создать заявку">
                    </dx:ASPxButton>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="900px">
            <SettingsCommandButton>
                <ShowAdaptiveDetailButton ButtonType="Image">
                </ShowAdaptiveDetailButton>
                <HideAdaptiveDetailButton ButtonType="Image">
                </HideAdaptiveDetailButton>
            </SettingsCommandButton>
        </dx:ASPxGridView>
    </div>
</asp:Content>
