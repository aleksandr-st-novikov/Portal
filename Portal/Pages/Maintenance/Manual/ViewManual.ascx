<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewManual.ascx.cs" Inherits="Portal.Pages.Maintenance.Manual.ViewManual" %>
<dx:ASPxCallbackPanel ID="ASPxCallbackPanelViewManual" runat="server" ClientInstanceName="ASPxClientCallbackPanelViewManual" OnCallback="ASPxCallbackPanelViewManual_Callback" Width="100%">
    <ClientSideEvents EndCallback="function(s, e) {
var isCategory = ASPxClientHiddenFieldManual.Get('IsCategory');
if(isCategory == '0') {
    ASPxClientButtonEditManual.SetEnabled(true);
}
else {
    ASPxClientButtonEditManual.SetEnabled(false);
}	
}" />
    <PanelCollection>
        <dx:PanelContent runat="server">
            <section class="content" style="color: #484848;">
                <div style="text-align: right;">
                    <dx:ASPxLabel ID="ASPxLabelAuthorDate" runat="server">
                    </dx:ASPxLabel>
                </div>
                <div style="border-bottom: 5px solid #f5f5f5; margin-bottom: 10px;">
                    <dx:ASPxLabel ID="ASPxLabelTitle" runat="server" ClientInstanceName="ASPxClientLabelTitle" Font-Bold="False" Font-Size="X-Large">
                    </dx:ASPxLabel>
                </div>
                <div>
                    <asp:Literal ID="LiteralMainText" runat="server"></asp:Literal>
                </div>
                <dx:ASPxHiddenField ID="ASPxHiddenFieldManual" runat="server" ClientInstanceName="ASPxClientHiddenFieldManual"></dx:ASPxHiddenField>
            </section>
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>




