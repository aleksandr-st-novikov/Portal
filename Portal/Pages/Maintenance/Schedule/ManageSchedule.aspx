<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Maintenance/Schedule/ScheduleMain.master" AutoEventWireup="true" CodeBehind="ManageSchedule.aspx.cs" Inherits="Portal.Pages.Maintenance.Schedule.ManageSchedule" %>

<%@ Register Src="~/Pages/Maintenance/Schedule/JobGrid.ascx" TagPrefix="uc1" TagName="JobGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <dx:ASPxLabel ID="ASPxLabelHead" runat="server" Font-Size="Large"></dx:ASPxLabel>
        <uc1:JobGrid runat="server" ID="JobGrid" />
    </div>
</asp:Content>
