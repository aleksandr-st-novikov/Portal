<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MainDefault.master" CodeBehind="Default.aspx.cs" Inherits="Portal._Default" %>


<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 100%">
        <div style="text-align:center;margin-top:100px;">
            <% #if DEBUG %>
                <img src="../Content/Images/logo-x2.png" style="width:100px;"/>
            <% #else %>
                <img src="/portal/Content/Images/logo-x2.png" style="width:100px;"/>
            <% #endif %>
        </div>
    </div>
</asp:Content>
