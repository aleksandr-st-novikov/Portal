<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/AdmissionSRT/AdmissionSRTMain.master" AutoEventWireup="true" CodeBehind="ManageAdmissionSRT.aspx.cs" Inherits="Portal.Pages.Journal.AdmissionSRT.ManageAdmissionSRT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxCallback ID="ASPxCallbackImportEmployee" runat="server" ClientInstanceName="ASPxClientCallbackImportEmployee" OnCallback="ASPxCallbackImportEmployee_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {
	            ASPxClientLoadingPanelLoad.Hide();
            }" />
    </dx:ASPxCallback>
    <div class="content">

        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="500px" RightToLeft="False">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxButton ID="ASPxButtonPopulateEmployee" runat="server" Text="Заполнить сотрудников" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {
                                ASPxClientCallbackImportEmployee.PerformCallback();
	                            ASPxClientLoadingPanelLoad.Show();
                            }" />
                    </dx:ASPxButton>
                    <dx:ASPxLabel ID="ASPxLabelDepartment" runat="server">
                    </dx:ASPxLabel>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
        <dx:ASPxGridView ID="ASPxGridViewAdmissionSRT" ClientInstanceName="ASPxClientGridViewAdmissionSRT" runat="server" DataSourceID="SqlDataSourceAdmissionSRT">
            <SettingsCommandButton>
                <ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

                <HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
            </SettingsCommandButton>
            <SettingsSearchPanel Visible="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSourceAdmissionSRT" runat="server"></asp:SqlDataSource>

    </div>
    <dx:ASPxLoadingPanel ID="ASPxLoadingPanelLoad" runat="server" ClientInstanceName="ASPxClientLoadingPanelLoad" Modal="True">
    </dx:ASPxLoadingPanel>
</asp:Content>
