<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GridUserLogs.ascx.cs" Inherits="Portal.Pages.Admin.Logs.GridUserLogs" %>
<dx:ASPxGridView ID="ASPxGridViewUserLogs" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxClientGridViewUserLogs" DataSourceID="SqlDataSourceUserLogs" KeyFieldName="Id" Width="1200px">
    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    <SettingsSearchPanel Visible="True" />
    <Columns>
        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Имя пользователя" FieldName="UserName" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="IP адрес" FieldName="IPv4" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Страница" FieldName="Request" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Дата" FieldName="VisitDate" VisibleIndex="5">
            <PropertiesDateEdit DisplayFormatString="G">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="Имя компьютера" FieldName="PCName" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
    </Columns>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSourceUserLogs" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * FROM [UserLog] ORDER BY [VisitDate] DESC"></asp:SqlDataSource>
<dx:ASPxTimer ID="ASPxTimerRefresh" runat="server" Interval="30000">
    <ClientSideEvents Tick="function(s, e) {
	ASPxClientGridViewUserLogs.Refresh();
}" />
</dx:ASPxTimer>

