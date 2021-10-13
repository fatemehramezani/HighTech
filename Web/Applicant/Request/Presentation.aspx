<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/UserMasterPage.master" AutoEventWireup="true" CodeFile="Presentation.aspx.cs" Inherits="Applicant_Request_Presentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script src="../../App_Themes/Default/js/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="../../App_Themes/Default/source/jquery.fancybox.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="../../App_Themes/Default/source/jquery.fancybox.css?v=2.1.5" media="screen" />
	<script type="text/javascript">
	    function simulateClick(id) {
	        var evt = document.createEvent("MouseEvents");
	        evt.initMouseEvent("click", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
	        var cb = document.getElementById(id);
	        var canceled = !cb.dispatchEvent(evt);
	    }
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" Runat="Server">
     درخواست حضور در نمایشگاه
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DescriptionContent" Runat="Server">
    متقاضی گرامی از طریق این صفحه می توانید در خواست حضور در نمایشگاه و گرفتن غرفه خود را داشته باشید.
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
         در صورت ارسال درخواست در اسرع وقت با شما تماس گرفته خواهد شد
    </h2>
    <asp:Button ID="PresentationButton" runat="server" CausesValidation="False"  OnClick="PresentationButton_Click" Text="ارسال درخواست" SkinID="MetroInsertModeButton"/>
    <a id="showAlert1" class="fancybox" href="#inline1" title="ایراد در ارسال درخواست"></a>
    <a id="showAlert2" class="fancybox" href="#inline2" title="ایراد در ارسال درخواست"></a>
    <a id="showAlert3" class="fancybox" href="#inline3" title="ایراد در ارسال درخواست"></a>
    <div id="inline1" style="width:200px;display: none;text-align: center;">
		<h2>اطلاعات ناقص</h2>
        <hr/>
		<h3>
			برای ارسال درخواست باید ابتدا اطلاعات خود را تکمیل نمایید
		</h3>
        <a href="../../Account/Profile.aspx">تکمیل اطلاعات</a>
	</div>
     <div id="inline2" style="width:200px;display: none;text-align: center;">
		<h2>درخواست تکراری</h2>
        <hr/>
		<h3>
			درخواست شما قبلا ثبت شده است. در اسرع وقت رسیدگی خواهد شد
		</h3>
	</div>
     <div id="inline2" style="width:200px;display: none;text-align: center;">
		<h2>ارسال درخواست </h2>
        <hr/>
		<h3>
با تشکر از ارسال درخواست. درخواست شما در اسرع وقت رسیدگی خواهد شد		</h3>
	</div>
</asp:Content>

