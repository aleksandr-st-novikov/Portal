<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Maintenance/Manual/ManualMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageManual.aspx.cs" Inherits="Portal.Pages.Maintenance.Manual.ManageManual" %>

<%@ Register Src="~/Pages/Maintenance/Manual/AddManual.ascx" TagPrefix="uc1" TagName="AddManual" %>
<%@ Register Src="~/Pages/Maintenance/Manual/ViewManual.ascx" TagPrefix="uc2" TagName="ViewManual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div style="margin: 10px 0;">

            <dx:ASPxButton ID="ASPxButtonAddManual" runat="server" Text="Добавить инструкцию" AutoPostBack="False" ClientInstanceName="ASPxClientButtonAddManual" UseSubmitBehavior="False">
                <ClientSideEvents Click="function(s, e) {
	ASPxClientHiddenFieldEdit.Set('IsEdit','0');
    ASPxClientCallbackPanelAddManual.PerformCallback();
}" />
            </dx:ASPxButton>
            <dx:ASPxButton ID="ASPxButtonEditManual" runat="server" AutoPostBack="False" ClientInstanceName="ASPxClientButtonEditManual" Text="Редактировать" UseSubmitBehavior="False">
                <ClientSideEvents Click="function(s, e) {
	ASPxClientHiddenFieldEdit.Set('IsEdit','1');
    ASPxClientCallbackPanelAddManual.PerformCallback(nodeKey);
}" />
            </dx:ASPxButton>
        </div>
    </div>
    <uc1:AddManual runat="server" id="AddManual" />
    <uc2:ViewManual runat="server" ID="ViewManual" />
</asp:Content>
