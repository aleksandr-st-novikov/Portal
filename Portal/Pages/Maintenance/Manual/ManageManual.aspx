<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Maintenance/Manual/ManualMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageManual.aspx.cs" Inherits="Portal.Pages.Maintenance.Manual.ManageManual" %>

<%@ Register Src="~/Pages/Maintenance/Manual/AddArticle.ascx" TagPrefix="uc1" TagName="AddArticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div style="margin: 10px 0;">

            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Добавить инструкцию" AutoPostBack="False">
                <ClientSideEvents Click="function(s, e) {
	ASPxClientCallbackAddArticle.PerformCallback();
}" />
            </dx:ASPxButton>
        </div>
    </div>
    <uc1:AddArticle runat="server" id="AddArticle" />
</asp:Content>
