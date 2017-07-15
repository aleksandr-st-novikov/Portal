<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BirthdayParams.ascx.cs" Inherits="Portal.Pages.Report.Birthday.BirthdayParams" %>
<%@ Register Src="~/Pages/Report/Birthday/CongratulateReportViewPopup.ascx" TagPrefix="uc1" TagName="CongratulateReportViewPopup" %>
<%@ Register Src="~/Pages/Report/Birthday/CongratulateWeekReportViewPopup.ascx" TagPrefix="uc1" TagName="CongratulateWeekReportViewPopup" %>

<dx:ASPxRoundPanel ID="ASPxRoundPanelBirthday" runat="server" HeaderText="Дни рождения" Width="200px">
    <PanelCollection>
        <dx:PanelContent runat="server">
            <table style="margin: 15px 0;">
                <tr>
                    <td>
                        <dx:ASPxDateEdit ID="ASPxDateEditGridFrom" ClientInstanceName="ASPxClientDateEditGridFrom" runat="server" Caption="Период: с">
                            <CalendarProperties ShowClearButton="False">
                            </CalendarProperties>
                            <ClientSideEvents ValueChanged="function(s, e) {
	ASPxClientCallbackDate.PerformCallback();
}" />
                        </dx:ASPxDateEdit>
                    </td>
                    <td style="padding-left: 10px;">
                        <dx:ASPxDateEdit ID="ASPxDateEditGridTo" ClientInstanceName="ASPxClientDateEditGridTo" runat="server" Caption="по">
                            <CalendarProperties ShowClearButton="False">
                            </CalendarProperties>
                            <ClientSideEvents ValueChanged="function(s, e) {
	ASPxClientCallbackDate.PerformCallback();	
}" />
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
            </table>
            <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" RightToLeft="True">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxButton ID="ASPxButtonCongratulateWeek" runat="server" Text="Поздравляем - неделя" ClientInstanceName="ASPxClientButtonCongratulateWeek" AutoPostBack="False" UseSubmitBehavior="False">
                            <ClientSideEvents Click="function(s, e) {
	ASPxClientCallbackPanelCongtatulateWeek.PerformCallback();
}" />
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="ASPxButtonCongratulate" runat="server" Text="Поздравляем" ClientInstanceName="ASPxClientButtonCongratulate" AutoPostBack="False" UseSubmitBehavior="False">
                            <ClientSideEvents Click="function(s, e) {
	ASPxClientCallbackPanelCongtatulate.PerformCallback();
}" />
                        </dx:ASPxButton>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxRoundPanel>

<dx:ASPxCallback ID="ASPxCallbackDate" runat="server" ClientInstanceName="ASPxClientCallbackDate" OnCallback="ASPxCallbackDate_Callback">
</dx:ASPxCallback>


<uc1:CongratulateReportViewPopup runat="server" ID="CongratulateReportViewPopup" />
<uc1:CongratulateWeekReportViewPopup runat="server" id="CongratulateWeekReportViewPopup" />