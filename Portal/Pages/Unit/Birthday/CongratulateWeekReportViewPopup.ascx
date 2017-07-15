<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CongratulateWeekReportViewPopup.ascx.cs" Inherits="Portal.Pages.Unit.Birthday.CongratulateWeekReportViewPopup" %>
<%@ Register Assembly="DevExpress.XtraReports.v17.1.Web, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<dx:ASPxPopupControl ID="ASPxPopupControlViewCongtatulateWeek" runat="server" ClientInstanceName="ASPxClientPopupControlViewCongtatulateWeek" AllowDragging="True" CloseAction="CloseButton" HeaderText="Отчет" Height="800px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalOffset="50" Width="1200px">
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanelCongtatulateWeek" ClientInstanceName="ASPxClientCallbackPanelCongtatulateWeek"
                runat="server" OnCallback="ASPxCallbackPanelCongtatulateWeek_Callback" Width="100%" Height="100%">
                <SettingsLoadingPanel Enabled="False" />
                <ClientSideEvents EndCallback="function(s, e) {
	                ASPxClientPopupControlViewCongtatulateWeek.Show();
                }" />
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxDocumentViewer ID="ASPxDocumentViewerReportCongtatulateWeek" runat="server" Height="100%" Width="100%">
                            <SettingsReportViewer EnableReportMargins="True" />
                        </dx:ASPxDocumentViewer>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
