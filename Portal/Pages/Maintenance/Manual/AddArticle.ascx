<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddArticle.ascx.cs" Inherits="Portal.Pages.Maintenance.Manual.AddArticle" %>
<%@ Register assembly="DevExpress.Web.ASPxRichEdit.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRichEdit" tagprefix="dx" %>
<dx:ASPxPopupControl ID="ASPxPopupControlAddArticle" runat="server" HeaderText="Создание инструкции" Modal="True" Width="900px" ClientInstanceName="ASPxClientPopupControlAddArticle" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
    <HeaderStyle BackColor="WhiteSmoke" />
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <div class="input-margin-bottom">
                            <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Caption="Название" Width="100%">
                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="SaveArticle">
                                    <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                                </ValidationSettings>
                                <CaptionCellStyle Width="150px">
                                </CaptionCellStyle>
                            </dx:ASPxTextBox>
                            <dx:ASPxRichEdit ID="ASPxRichEdit1" runat="server" RibbonMode="OneLineRibbon" ShowStatusBar="False" WorkDirectory="~\App_Data\WorkDirectory">
                            </dx:ASPxRichEdit>
                        </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
            <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="100%">
                <Paddings PaddingBottom="10px" PaddingTop="10px" />
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="ASPxButton">
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="ASPxButton2" runat="server" Text="ASPxButton">
                        </dx:ASPxButton>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxCallback ID="ASPxCallbackAddArticle" runat="server" ClientInstanceName="ASPxClientCallbackAddArticle">
    <ClientSideEvents EndCallback="function(s, e) {
	ASPxClientPopupControlAddArticle.Show();
}" />
</dx:ASPxCallback>


