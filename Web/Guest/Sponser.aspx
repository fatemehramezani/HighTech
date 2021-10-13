<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Sponser.aspx.cs" Inherits="Guest_Sponser" %>
<%@ OutputCache duration="10" varybyparam="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style>
       .check {
            list-style-position: outside;
            list-style-image: url('../App_Themes/Default/images/check.gif');
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    حامیان نمایشگاه
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
        <img src="../App_Themes/Default/images/img-17.jpg" class="pages-content-img2"  alt="حامی" />
    </p>
    <br/>
    <br/>
    <br/>
    <ul class="check">
        <li>ستانداری آذربایجان شرقی    
        </li>
        <li>دفتر همکاریهای فناوری و نوآوری ریاست جمهوری
        </li>
        <li>اداره کل آموزش فنی و حرفه ای آذربایجان شرقی​
        </li>
        <li>سازمان جهاد کشاورزی استان
        </li>
        <li>شرکت شهرکهای صنعتی آذربایجان شرقی
        </li>
    </ul>
</asp:Content>

