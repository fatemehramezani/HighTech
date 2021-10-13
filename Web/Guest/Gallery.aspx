<%@ Page Title="آلبوم تصاویر" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="Guest_Help" %>
<%@ OutputCache duration="10" varybyparam="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
   آلبوم تصاویر
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="content" style="height: 690px;">
        <iframe width="950" height="690" frameborder="0" src="GalleryIn.aspx"></iframe>
    </div>
</asp:Content>
