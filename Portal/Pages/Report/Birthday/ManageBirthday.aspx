<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Report/Birthday/BirthdayMain.master" Async="true" AutoEventWireup="true" CodeBehind="ManageBirthday.aspx.cs" Inherits="Portal.Pages.Report.Birthday.ManageBirthday" %>
<%@ Register Src="~/Pages/Report/Birthday/BirthdayParams.ascx" TagPrefix="uc1" TagName="BirthdayParams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <uc1:BirthdayParams runat="server" id="BirthdayParams" />
    </div>
</asp:Content>
