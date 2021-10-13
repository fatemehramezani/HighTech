<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/UserMasterPage.master" AutoEventWireup="true" CodeFile="ReportViewer.aspx.cs" Inherits="Administrator_Report_ReportViewer" %>

<%@ Register Assembly="FastReport.Web" Namespace="FastReport.Web" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DescriptionContent" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <cc1:WebReport ID="Report" runat="server" ReportFile="~/Administrator/Report/Product.frx"/>
</asp:Content>

