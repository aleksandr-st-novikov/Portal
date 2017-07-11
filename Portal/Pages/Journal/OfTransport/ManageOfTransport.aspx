﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/OfTransport/OfTransportMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageOfTransport.aspx.cs" Inherits="Portal.Pages.Journal.OfTransport.ManageOfTransport" %>

<%@ Register Src="~/Pages/Journal/OfTransport/OfTransportGrid.ascx" TagPrefix="uc1" TagName="OfTransportGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <dx:ASPxLabel ID="ASPxLabelMain" runat="server" Text="ASPxLabel" Font-Size="Large">
        </dx:ASPxLabel>
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
	                        ASPxClientCallbackRefreshData.PerformCallback();
                        }" />
                        <Image IconID="actions_refresh_16x16office2013">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td style="padding-left: 50px;">
                    <dx:ASPxButton ID="ASPxButtonPrint" runat="server" Text="Печать" AutoPostBack="False" UseSubmitBehavior="False"></dx:ASPxButton>

                </td>
            </tr>
        </table>

        <uc1:OfTransportGrid runat="server" ID="OfTransportGrid" />
    </div>
</asp:Content>
