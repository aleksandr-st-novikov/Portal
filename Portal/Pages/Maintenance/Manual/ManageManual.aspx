<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Maintenance/Manual/ManualMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageManual.aspx.cs" Inherits="Portal.Pages.Maintenance.Manual.ManageManual" %>

<%@ Register Src="~/Pages/Maintenance/Manual/AddManual.ascx" TagPrefix="uc1" TagName="AddManual" %>
<%@ Register Src="~/Pages/Maintenance/Manual/ViewManual.ascx" TagPrefix="uc2" TagName="ViewManual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div style="margin: 10px 0;">

            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Добавить инструкцию" AutoPostBack="False">
                <ClientSideEvents Click="function(s, e) {
	ASPxClientCallbackAddManual.PerformCallback();
}" />
            </dx:ASPxButton>
            <dx:ASPxButton ID="ASPxButtonEditManual" runat="server" ClientInstanceName="ASPxClientButtonEditManual" Text="Редактировать" Visible="False">
            </dx:ASPxButton>
        </div>
    </div>
    <uc1:AddManual runat="server" id="AddManual" />
    <uc2:ViewManual runat="server" ID="ViewManual" />
</asp:Content>
