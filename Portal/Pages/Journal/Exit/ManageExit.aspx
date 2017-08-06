<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Journal/Exit/ExitMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageExit.aspx.cs" Inherits="Portal.Pages.Journal.Exit.ManageExit" %>

<%@ Register Src="~/Pages/Journal/Exit/ExitGrid.ascx" TagPrefix="uc1" TagName="ExitGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div style="padding-bottom:10px;">
            <dx:ASPxLabel ID="ASPxLabelDepartment" runat="server" Font-Size="Large">
            </dx:ASPxLabel>
        </div>
        <uc1:ExitGrid runat="server" id="ExitGrid" />
    </div>
</asp:Content>
