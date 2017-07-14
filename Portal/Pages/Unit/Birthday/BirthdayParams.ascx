<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BirthdayParams.ascx.cs" Inherits="Portal.Pages.Unit.Birthday.BirthdayParams" %>
<dx:ASPxRoundPanel ID="ASPxRoundPanelBirthday" runat="server" HeaderText="Дни рождения" Width="200px">
    <PanelCollection>
        <dx:PanelContent runat="server">
            <table style="margin: 15px 0;">
                <tr>
                    <td>
                        <dx:ASPxDateEdit ID="ASPxDateEditGridFrom" ClientInstanceName="ASPxClientDateEditGridFrom" runat="server" Caption="Период: с">
                            <CalendarProperties ShowClearButton="False">
                            </CalendarProperties>
                        </dx:ASPxDateEdit>
                    </td>
                    <td style="padding-left: 10px;">
                        <dx:ASPxDateEdit ID="ASPxDateEditGridTo" ClientInstanceName="ASPxClientDateEditGridTo" runat="server" Caption="по">
                            <CalendarProperties ShowClearButton="False">
                            </CalendarProperties>
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
            </table>
            <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" RightToLeft="True">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxButton ID="ASPxButtonCongratulateWeek" runat="server" Text="Поздравляем - неделя" ClientInstanceName="ASPxClientButtonCongratulateWeek">
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="ASPxButtonCongratulate" runat="server" Text="Поздравляем" ClientInstanceName="ASPxClientButtonCongratulate"></dx:ASPxButton>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxRoundPanel>

