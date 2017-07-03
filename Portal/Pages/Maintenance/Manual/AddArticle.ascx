<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddArticle.ascx.cs" Inherits="Portal.Pages.Maintenance.Manual.AddArticle" %>
<%@ Register Assembly="DevExpress.Web.ASPxRichEdit.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRichEdit" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<dx:ASPxPopupControl ID="ASPxPopupControlAddArticle" runat="server" HeaderText="Создание инструкции" Modal="True" Width="1200px" ClientInstanceName="ASPxClientPopupControlAddArticle" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Height="800px">
    <HeaderStyle BackColor="WhiteSmoke" />
    <ContentCollection>
        <dx:PopupControlContentControl runat="server">
            <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <div class="input-margin-bottom">
                            <dx:ASPxTextBox ID="ASPxTextBoxName" runat="server" Caption="Название" Width="100%" ClientInstanceName="ASPxClientTextBoxName">
                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="SaveArticle">
                                    <RequiredField ErrorText="Обязательное поле" IsRequired="True" />
                                </ValidationSettings>
                                <CaptionCellStyle Width="150px">
                                </CaptionCellStyle>
                            </dx:ASPxTextBox>
                        </div>
                        <div class="input-margin-bottom">
                            <dx:ASPxHtmlEditor ID="ASPxHtmlEditorMainText" runat="server" Height="650px" Width="100%" ClientInstanceName="ASPxClientHtmlEditorMainText">
                                <Toolbars>
                                    <dx:HtmlEditorToolbar Name="StandardToolbar1">
                                        <Items>
                                            <dx:ToolbarCutButton>
                                            </dx:ToolbarCutButton>
                                            <dx:ToolbarCopyButton>
                                            </dx:ToolbarCopyButton>
                                            <dx:ToolbarPasteButton>
                                            </dx:ToolbarPasteButton>
                                            <dx:ToolbarPasteFromWordButton>
                                            </dx:ToolbarPasteFromWordButton>
                                            <dx:ToolbarUndoButton BeginGroup="True">
                                            </dx:ToolbarUndoButton>
                                            <dx:ToolbarRedoButton>
                                            </dx:ToolbarRedoButton>
                                            <dx:ToolbarRemoveFormatButton BeginGroup="True">
                                            </dx:ToolbarRemoveFormatButton>
                                            <dx:ToolbarSuperscriptButton BeginGroup="True">
                                            </dx:ToolbarSuperscriptButton>
                                            <dx:ToolbarSubscriptButton>
                                            </dx:ToolbarSubscriptButton>
                                            <dx:ToolbarInsertOrderedListButton BeginGroup="True">
                                            </dx:ToolbarInsertOrderedListButton>
                                            <dx:ToolbarInsertUnorderedListButton>
                                            </dx:ToolbarInsertUnorderedListButton>
                                            <dx:ToolbarIndentButton BeginGroup="True">
                                            </dx:ToolbarIndentButton>
                                            <dx:ToolbarOutdentButton>
                                            </dx:ToolbarOutdentButton>
                                            <dx:ToolbarInsertLinkDialogButton BeginGroup="True">
                                            </dx:ToolbarInsertLinkDialogButton>
                                            <dx:ToolbarUnlinkButton>
                                            </dx:ToolbarUnlinkButton>
                                            <dx:ToolbarInsertImageDialogButton>
                                            </dx:ToolbarInsertImageDialogButton>
                                            <dx:ToolbarInsertYouTubeVideoDialogButton>
                                            </dx:ToolbarInsertYouTubeVideoDialogButton>
                                            <dx:ToolbarTableOperationsDropDownButton BeginGroup="True">
                                                <Items>
                                                    <dx:ToolbarInsertTableDialogButton BeginGroup="True" Text="Insert Table..." ToolTip="Insert Table...">
                                                    </dx:ToolbarInsertTableDialogButton>
                                                    <dx:ToolbarTablePropertiesDialogButton BeginGroup="True">
                                                    </dx:ToolbarTablePropertiesDialogButton>
                                                    <dx:ToolbarTableRowPropertiesDialogButton>
                                                    </dx:ToolbarTableRowPropertiesDialogButton>
                                                    <dx:ToolbarTableColumnPropertiesDialogButton>
                                                    </dx:ToolbarTableColumnPropertiesDialogButton>
                                                    <dx:ToolbarTableCellPropertiesDialogButton>
                                                    </dx:ToolbarTableCellPropertiesDialogButton>
                                                    <dx:ToolbarInsertTableRowAboveButton BeginGroup="True">
                                                    </dx:ToolbarInsertTableRowAboveButton>
                                                    <dx:ToolbarInsertTableRowBelowButton>
                                                    </dx:ToolbarInsertTableRowBelowButton>
                                                    <dx:ToolbarInsertTableColumnToLeftButton>
                                                    </dx:ToolbarInsertTableColumnToLeftButton>
                                                    <dx:ToolbarInsertTableColumnToRightButton>
                                                    </dx:ToolbarInsertTableColumnToRightButton>
                                                    <dx:ToolbarSplitTableCellHorizontallyButton BeginGroup="True">
                                                    </dx:ToolbarSplitTableCellHorizontallyButton>
                                                    <dx:ToolbarSplitTableCellVerticallyButton>
                                                    </dx:ToolbarSplitTableCellVerticallyButton>
                                                    <dx:ToolbarMergeTableCellRightButton>
                                                    </dx:ToolbarMergeTableCellRightButton>
                                                    <dx:ToolbarMergeTableCellDownButton>
                                                    </dx:ToolbarMergeTableCellDownButton>
                                                    <dx:ToolbarDeleteTableButton BeginGroup="True">
                                                    </dx:ToolbarDeleteTableButton>
                                                    <dx:ToolbarDeleteTableRowButton>
                                                    </dx:ToolbarDeleteTableRowButton>
                                                    <dx:ToolbarDeleteTableColumnButton>
                                                    </dx:ToolbarDeleteTableColumnButton>
                                                </Items>
                                            </dx:ToolbarTableOperationsDropDownButton>
                                            <dx:ToolbarFindAndReplaceDialogButton BeginGroup="True">
                                            </dx:ToolbarFindAndReplaceDialogButton>
                                            <dx:ToolbarPrintButton BeginGroup="True" ToolTip="">
                                            </dx:ToolbarPrintButton>
                                            <dx:ToolbarExportDropDownButton>
                                            </dx:ToolbarExportDropDownButton>
                                            <dx:ToolbarFullscreenButton BeginGroup="True">
                                            </dx:ToolbarFullscreenButton>
                                        </Items>
                                    </dx:HtmlEditorToolbar>
                                    <dx:HtmlEditorToolbar Name="StandardToolbar2">
                                        <Items>
                                            <dx:ToolbarParagraphFormattingEdit Width="120px">
                                                <Items>
                                                    <dx:ToolbarListEditItem Text="Normal" Value="p" />
                                                    <dx:ToolbarListEditItem Text="Heading  1" Value="h1" />
                                                    <dx:ToolbarListEditItem Text="Heading  2" Value="h2" />
                                                    <dx:ToolbarListEditItem Text="Heading  3" Value="h3" />
                                                    <dx:ToolbarListEditItem Text="Heading  4" Value="h4" />
                                                    <dx:ToolbarListEditItem Text="Heading  5" Value="h5" />
                                                    <dx:ToolbarListEditItem Text="Heading  6" Value="h6" />
                                                    <dx:ToolbarListEditItem Text="Address" Value="address" />
                                                    <dx:ToolbarListEditItem Text="Normal (DIV)" Value="div" />
                                                </Items>
                                            </dx:ToolbarParagraphFormattingEdit>
                                            <dx:ToolbarFontNameEdit>
                                                <Items>
                                                    <dx:ToolbarListEditItem Text="Times New Roman" Value="Times New Roman" />
                                                    <dx:ToolbarListEditItem Text="Tahoma" Value="Tahoma" />
                                                    <dx:ToolbarListEditItem Text="Verdana" Value="Verdana" />
                                                    <dx:ToolbarListEditItem Text="Arial" Value="Arial" />
                                                    <dx:ToolbarListEditItem Text="MS Sans Serif" Value="MS Sans Serif" />
                                                    <dx:ToolbarListEditItem Text="Courier" Value="Courier" />
                                                    <dx:ToolbarListEditItem Text="Segoe UI" Value="Segoe UI" />
                                                </Items>
                                            </dx:ToolbarFontNameEdit>
                                            <dx:ToolbarFontSizeEdit>
                                                <Items>
                                                    <dx:ToolbarListEditItem Text="1 (8pt)" Value="1" />
                                                    <dx:ToolbarListEditItem Text="2 (10pt)" Value="2" />
                                                    <dx:ToolbarListEditItem Text="3 (12pt)" Value="3" />
                                                    <dx:ToolbarListEditItem Text="4 (14pt)" Value="4" />
                                                    <dx:ToolbarListEditItem Text="5 (18pt)" Value="5" />
                                                    <dx:ToolbarListEditItem Text="6 (24pt)" Value="6" />
                                                    <dx:ToolbarListEditItem Text="7 (36pt)" Value="7" />
                                                </Items>
                                            </dx:ToolbarFontSizeEdit>
                                            <dx:ToolbarBoldButton BeginGroup="True">
                                            </dx:ToolbarBoldButton>
                                            <dx:ToolbarItalicButton>
                                            </dx:ToolbarItalicButton>
                                            <dx:ToolbarUnderlineButton>
                                            </dx:ToolbarUnderlineButton>
                                            <dx:ToolbarStrikethroughButton>
                                            </dx:ToolbarStrikethroughButton>
                                            <dx:ToolbarJustifyLeftButton BeginGroup="True">
                                            </dx:ToolbarJustifyLeftButton>
                                            <dx:ToolbarJustifyCenterButton>
                                            </dx:ToolbarJustifyCenterButton>
                                            <dx:ToolbarJustifyRightButton>
                                            </dx:ToolbarJustifyRightButton>
                                            <dx:ToolbarBackColorButton BeginGroup="True">
                                            </dx:ToolbarBackColorButton>
                                            <dx:ToolbarFontColorButton>
                                            </dx:ToolbarFontColorButton>
                                        </Items>
                                    </dx:HtmlEditorToolbar>
                                </Toolbars>
                                <SettingsHtmlEditing AllowedDocumentType="Both" AllowHTML5MediaElements="True" AllowIFrames="True" AllowScripts="True" AllowYouTubeVideoIFrames="True">
                                </SettingsHtmlEditing>
                                <SettingsDialogs>
                                    <InsertImageDialog>
                                        <SettingsImageUpload>
                                            <FileSystemSettings UploadFolder="~/Content/Articles/" />
                                        </SettingsImageUpload>
                                        <SettingsImageSelector Enabled="True">
                                        </SettingsImageSelector>
                                    </InsertImageDialog>
                                </SettingsDialogs>
                            </dx:ASPxHtmlEditor>
                        </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
            <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="100%" RightToLeft="True">
                <Paddings PaddingBottom="10px" PaddingTop="10px" />
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxButton ID="ASPxButtonCancelArticle" runat="server" Text="Отмена" AutoPostBack="False" ClientInstanceName="ASPxClientButtonCancelArticle">
                            <ClientSideEvents Click="function(s, e) {
	ASPxClientPopupControlAddArticle.Hide();
}" />
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="ASPxButtonSaveArticle" runat="server" Text="Сохранить" AutoPostBack="False" ClientInstanceName="ASPxClientButtonSaveArticle">
                            <ClientSideEvents Click="function(s, e) {
	ASPxClientCallbackSaveArticle.PerformCallback();
}" />
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


<dx:ASPxCallback ID="ASPxCallbackSaveArticle" runat="server" ClientInstanceName="ASPxClientCallbackSaveArticle" OnCallback="ASPxCallbackSaveArticle_Callback">
    <ClientSideEvents CallbackComplete="function(s, e) {
	ASPxClientPopupControlAddArticle.Hide();
}" />
</dx:ASPxCallback>



