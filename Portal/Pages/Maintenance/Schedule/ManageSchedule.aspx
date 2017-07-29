<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Maintenance/Schedule/ScheduleMain.master" AutoEventWireup="true" CodeBehind="ManageSchedule.aspx.cs" Inherits="Portal.Pages.Maintenance.Schedule.ManageSchedule" %>

<%@ Register Src="~/Pages/Maintenance/Schedule/JobGrid.ascx" TagPrefix="uc1" TagName="JobGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
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
    </div>
</asp:Content>
