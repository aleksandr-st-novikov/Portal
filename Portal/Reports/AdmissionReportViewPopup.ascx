﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdmissionReportViewPopup.ascx.cs" Inherits="Portal.Reports.AdmissionReportViewPopup" %>
<%@ Register assembly="DevExpress.XtraReports.v17.1.Web, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>

<dx:ASPxPopupControl ID="ASPxPopupControlView" runat="server" ClientInstanceName="ASPxClientPopupControlView" AllowDragging="True" CloseAction="CloseButton" HeaderText="Отчет" Height="800px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalOffset="50" Width="1200px">
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanelAdmissionReport" ClientInstanceName="ASPxClientCallbackPanelAdmissionReport" runat="server" OnCallback="ASPxCallbackPanelAdmissionReport_Callback" Width="100%" Height="100%">
                <SettingsLoadingPanel Enabled="False" />
                <ClientSideEvents EndCallback="function(s, e) {
	                ASPxClientPopupControlView.Show();
                }" />
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxDocumentViewer ID="ASPxDocumentViewerReport" runat="server" Height="100%" Width="100%">
                        </dx:ASPxDocumentViewer>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
