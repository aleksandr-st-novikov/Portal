<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Employee/EmployeeMain.master" AutoEventWireup="true" CodeBehind="ImportEmployee.aspx.cs" Inherits="Portal.Pages.Admin.Employee.ImportEmployee" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxCallback ID="ASPxCallbackImport" runat="server" ClientInstanceName="ASPxClientCallbackImport" OnCallback="ASPxCallbackImport_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {
	            ASPxClientLoadingPanelLoad.Hide();
                alert('Данные загружены успешно.');
            }" />
    </dx:ASPxCallback>
    <dx:ASPxCallback ID="ASPxCallbackImportEmployee" runat="server" ClientInstanceName="ASPxClientCallbackImportEmployee" OnCallback="ASPxCallbackImportEmployee_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) {
	            ASPxClientLoadingPanelLoad.Hide();
                alert('Данные загружены успешно.');
            }" />
    </dx:ASPxCallback>
    <div class="content">
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="500px" HeaderText="Путь к *.dbf файлу">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxTextBox ID="ASPxTextBoxPathDBF" runat="server" Width="100%">
                    </dx:ASPxTextBox>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="500px" RightToLeft="True">
            <Paddings PaddingTop="20px" />
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxButton ID="ASPxButtonImportDepartment" runat="server" Text="Загрузить подразделения" AutoPostBack="false" Width="250">
                        <ClientSideEvents Click="function(s, e) {
                                ASPxClientCallbackImport.PerformCallback();
	                            ASPxClientLoadingPanelLoad.Show();
                            }" />
                    </dx:ASPxButton>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
        <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="500px" RightToLeft="True">
            <Paddings PaddingTop="20px" />
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxButton ID="ASPxButtonImportEmployee" runat="server" Text="Загрузить сотрудников" AutoPostBack="false" Width="250">
                        <ClientSideEvents Click="function(s, e) {
                                ASPxClientCallbackImportEmployee.PerformCallback();
	                            ASPxClientLoadingPanelLoad.Show();
                            }" />
                    </dx:ASPxButton>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
    </div>
    <dx:ASPxLoadingPanel ID="ASPxLoadingPanelLoad" runat="server" ClientInstanceName="ASPxClientLoadingPanelLoad" Modal="True">
    </dx:ASPxLoadingPanel>
</asp:Content>
