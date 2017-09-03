<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Logs/LogsMain.master" AutoEventWireup="true" CodeBehind="ManageLogs.aspx.cs" Inherits="Portal.Pages.Admin.Logs.ManageLogs" %>

<%@ Register Src="~/Pages/Admin/Logs/GridUserLogs.ascx" TagPrefix="uc1" TagName="GridUserLogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <uc1:GridUserLogs runat="server" id="GridUserLogs" />
    </div>
</asp:Content>
