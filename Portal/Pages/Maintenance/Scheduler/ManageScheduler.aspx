<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Maintenance/Scheduler/SchedulerMain.master" AutoEventWireup="true" CodeBehind="ManageScheduler.aspx.cs" Inherits="Portal.Pages.Maintenance.Scheduler.ManageScheduler" %>

<%@ Register Src="~/Pages/Maintenance/Scheduler/JobGrid.ascx" TagPrefix="uc1" TagName="JobGrid" %>
<%@ Register Src="~/Pages/Maintenance/Scheduler/DetailPopup.ascx" TagPrefix="uc1" TagName="DetailPopup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="1200px" HeaderText="Состояние службы Portal.Service">
            <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxLabel ID="ASPxLabelServiceState" runat="server" Font-Italic="False" ForeColor="#3399FF" Text="ASPxLabel">
    </dx:ASPxLabel>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
        <br/>
        <table style="width:1200px;">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabelHead" runat="server" Font-Size="Large"></dx:ASPxLabel>
                </td>
                <td style="text-align:right;">
                    <dx:ASPxLabel ID="ASPxLabelFormat" runat="server" Text="Формат расписания" CssClass="hint" ClientInstanceName="ASPxClientLabelFormat"></dx:ASPxLabel>
                    <dx:ASPxHint ID="ASPxHint1" runat="server" TargetSelector=".hint" EncodeHtml="False" Position="Bottom"></dx:ASPxHint>
                </td>
            </tr>
        </table>
        <uc1:JobGrid runat="server" ID="JobGrid" />
        <uc1:DetailPopup runat="server" id="DetailPopup" />
    </div>
</asp:Content>
