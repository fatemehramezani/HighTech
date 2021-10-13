<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/UserMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Applicant_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="Server">
     <div class="pages-content">
        <h1>
            <%= Profile.FullName %>،
             به پرتال متقاضیان نمایشگاه خوش آمدید          </h1>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="DescriptionContent" runat="Server">
   متقاضی محترم! جهت ارسال درخواست های خود از برگزار کنندگان نمایشگاه می توانید از این پنل استفاده نمایید.
    مواردی مانند درخواست کالا و فرآروده  و یا حضور در نمایشگاه و کارگاه ها از این پنل قابل انجام می باشد.
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
   
</asp:Content>

