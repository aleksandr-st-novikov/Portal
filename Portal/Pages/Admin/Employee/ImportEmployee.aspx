<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/Employee/EmployeeMain.master" AutoEventWireup="true" CodeBehind="ImportEmployee.aspx.cs" Inherits="Portal.Pages.Admin.Employee.ImportEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="500px" HeaderText="Путь к *.dbf файлу">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxTextBox ID="ASPxTextBoxPathDBF" runat="server" Width="100%">
                    </dx:ASPxTextBox>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="500px" RightToLeft="True">
            <Paddings PaddingTop="20px" />
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxButton ID="ASPxButtonImportEmployee" runat="server" Text="Загрузить" OnClick="ASPxButtonImportEmployee_Click">
                    </dx:ASPxButton>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
    </div>
</asp:Content>
