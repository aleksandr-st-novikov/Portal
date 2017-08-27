<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pages.ascx.cs" Inherits="Portal.Pages.Journal.Exit.Pages" %>
<%@ Register Src="~/Pages/Journal/Exit/ExitGrid.ascx" TagPrefix="uc1" TagName="ExitGrid" %>
<%@ Register Src="~/Pages/Journal/Exit/EntranceGrid.ascx" TagPrefix="uc1" TagName="EntranceGrid" %>
<%@ Register Src="~/Pages/Journal/Exit/PurposeGrid.ascx" TagPrefix="uc1" TagName="PurposeGrid" %>

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

<dx:ASPxPageControl ID="ASPxPageControlExit" runat="server" ActiveTabIndex="0" ClientInstanceName="ASPxClientPageControlExit" EnableCallBacks="True">
    <TabPages>
        <dx:TabPage Text="Согласование ВЫХОДОВ">
            <ContentCollection>
                <dx:ContentControl runat="server">
                    <uc1:ExitGrid runat="server" ID="ExitGrid" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="Согласование ВХОДОВ">
            <ContentCollection>
                <dx:ContentControl runat="server">
                    <uc1:EntranceGrid runat="server" ID="EntranceGrid" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="Настройки">
            <ContentCollection>
                <dx:ContentControl runat="server">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Цели выхода" Font-Size="Large"></dx:ASPxLabel>
                    <uc1:PurposeGrid runat="server" ID="PurposeGrid" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
    </TabPages>
</dx:ASPxPageControl>

<dx:ASPxCallback ID="ASPxCallbackRefresh" runat="server" ClientInstanceName="ASPxClientCallbackRefresh" OnCallback="ASPxCallbackRefresh_Callback">
    <ClientSideEvents CallbackComplete="function(s, e) {
	ASPxClientGridViewExit.Refresh();
}" />
</dx:ASPxCallback>


