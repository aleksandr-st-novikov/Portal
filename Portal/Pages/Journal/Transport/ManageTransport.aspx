<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/Transport/TransportMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageTransport.aspx.cs" Inherits="Portal.Pages.Journal.Transport.ManageTransport" %>

<%@ Register Src="~/Pages/Journal/Transport/TransportGrid.ascx" TagPrefix="uc1" TagName="TransportGrid" %>
<%@ Register Src="~/Pages/Journal/Transport/TransportReportViewPopup.ascx" TagPrefix="uc1" TagName="TransportReportViewPopup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div style="margin-bottom: 10px;">
            <dx:ASPxLabel ID="ASPxLabelDepartment" runat="server" Font-Size="Large">
            </dx:ASPxLabel>
            <dx:ASPxCallback ID="ASPxCallbackRefresh" runat="server" ClientInstanceName="ASPxClientCallbackRefresh" OnCallback="ASPxCallbackRefresh_Callback">
                <ClientSideEvents EndCallback="function(s, e) {
	ASPxClientGridViewTransport.Refresh();
}" />
            </dx:ASPxCallback>
        </div>
        <table style="margin: 15px 0;">
            <tr>
                <td>
                    <dx:ASPxDateEdit ID="ASPxDateEditGridFrom" ClientInstanceName="ASPxClientDateEditGridFrom" runat="server" Caption="Период: с">
                        <CalendarProperties ShowClearButton="False">
                        </CalendarProperties>
                    </dx:ASPxDateEdit>
                </td>
                <td style="padding-left: 10px;">
                    <dx:ASPxDateEdit ID="ASPxDateEditGridTo" ClientInstanceName="ASPxClientDateEditGridTo" runat="server" Caption="по">
                        <CalendarProperties ShowClearButton="False">
                        </CalendarProperties>
                    </dx:ASPxDateEdit>
                </td>
                <td style="padding-left: 10px;">
                    <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Обновить" AutoPostBack="False" UseSubmitBehavior="False">
                        <ClientSideEvents Click="function(s, e) {
	                        ASPxClientCallbackRefresh.PerformCallback();
                        }" />
                        <Image IconID="actions_refresh_16x16office2013">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td style="padding-left: 50px;">
                    <dx:ASPxButton ID="ASPxButtonTransportPrint" runat="server" AutoPostBack="False" ClientInstanceName="ASPxClientButtonTransportPrint" Text="Печать" UseSubmitBehavior="False" Visible="False">
                        <ClientSideEvents Click="function(s, e) {
	ASPxClientCallbackPanelTransportReport.PerformCallback();
}" />
                        <Image IconID="print_print_16x16office2013">
                        </Image>
                    </dx:ASPxButton>

                </td>
            </tr>
        </table>
        <uc1:TransportGrid runat="server" ID="TransportGrid" />
    </div>
    <uc1:TransportReportViewPopup runat="server" id="TransportReportViewPopup" Visible="false"/>
</asp:Content>
