<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pages.ascx.cs" Inherits="Portal.Pages.Journal.Exit.Pages" %>
<%@ Register Src="~/Pages/Journal/Exit/ExitGrid.ascx" TagPrefix="uc1" TagName="ExitGrid" %>
<%@ Register Src="~/Pages/Journal/Exit/EntranceGrid.ascx" TagPrefix="uc1" TagName="EntranceGrid" %>
<%@ Register Src="~/Pages/Journal/Exit/PurposeGrid.ascx" TagPrefix="uc1" TagName="PurposeGrid" %>

<dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0">
    <TabPages>
        <dx:TabPage Text="Согласование ВЫХОДОВ">
            <ContentCollection>
                <dx:ContentControl runat="server">
                    <uc1:ExitGrid runat="server" ID="ExitGrid" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="Согласование ВХОДОВ">
            <ContentCollection>
                <dx:ContentControl runat="server">
                    <uc1:EntranceGrid runat="server" id="EntranceGrid" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="Настройки">
            <ContentCollection>
                <dx:ContentControl runat="server">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Цели выхода" Font-Size="Large"></dx:ASPxLabel>
                    <uc1:PurposeGrid runat="server" id="PurposeGrid" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
    </TabPages>
</dx:ASPxPageControl>

