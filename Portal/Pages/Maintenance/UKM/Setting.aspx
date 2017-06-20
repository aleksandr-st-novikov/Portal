<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Maintenance/UKM/UKMMain.master" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="Portal.Pages.Maintenance.UKM.Setting" Async="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="ASPxGridViewStore" runat="server" ClientInstanceName="ASPxClientGridViewStore" DataSourceID="SqlDataSourceStore">
        <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
        </Columns>
    </dx:ASPxGridView>
</asp:Content>
