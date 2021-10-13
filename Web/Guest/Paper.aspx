<%@ Page Title="مقالات" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Paper.aspx.cs" Inherits="Guest_Paper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link rel="stylesheet" href="../App_Themes/Default/css/jquery.mCustomScrollbar.css" type="text/css" />    
    <script type="text/javascript" src="../App_Themes/Default/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
    <script src="../App_Themes/Default/js/modernizr.js"></script>    
    <!--scroller-->
    <script>
        (function ($) {
            $(window).load(function () {
                $("#content-5").mCustomScrollbar({
                    scrollButtons: {
                        enable: true
                    },
                    theme: "light-thick"
                });

            });
        })(jQuery);
    </script>    
    <script>
        $(document).ready(function () {
            $('.article_ul li a').click(function () {
                $('#window').attr('data', $(this).attr('data'));
            });
        });
    </script>
    <!-- Script Part(Part1)-->
    <script>
        $(document).ready(function () {
            var paperCount = document.getElementById('<%= PaperCountHiddenField.ClientID %>').value;
            for (i = 1; i <= paperCount; i++) {
                $(".outer").hide();
                var tip__i = "#tip__" + i;
                $(tip__i).hover(function () {
                    for (j = 1; j <= paperCount; j++) {
                        if (i != j) {
                            var tip_j = "#tip_" + j;
                            $(tip_j).hide();
                        }
                    }
                    var tip_i = "#tip_" + i;
                    $(tip_i).stop(true, false).animate({ height: "toggle", opacity: "toggle" }, "slow");
                });
            }
        });
   </script>
    <style type="text/css">
        .alt, .altActive {
            background: #FFFFFF none repeat scroll 0 0;
            color: #000000;
            text-align: right;
        }

        .thread {
            padding: 4px;
            -x-system-font: none;
            background: #ffffff none repeat scroll 0 0;
            color: #003366;
            font-family: "mitra", tahoma,verdana,geneva,lucida,'lucida grande',arial,helvetica,sans-serif;
            font-size: 11px;
            font-size-adjust: none;
            font-stretch: normal;
            font-style: normal;
            font-variant: normal;
            font-weight: bold;
            line-height: normal;
            text-align: right;
            -webkit-border-top-left-radius: 6px;
            -webkit-border-top-right-radius: 6px;
            -moz-border-radius-topleft: 6px;
            -moz-border-radius-topright: 6px;
            border-top-left-radius: 6px;
            border-top-right-radius: 6px;
            border-top-right-radius: 6px;
            -webkit-border-bottom-left-radius: 6px;
            -webkit-border-bottom-right-radius: 6px;
            -moz-border-radius-bottomleft: 6px;
            -moz-border-radius-bottomright: 6px;
            border-bottom-left-radius: 6px;
            border-bottom-right-radius: 6px;
            border-bottom-right-radius: 6px;
        }
    </style>
    <script type="text/javascript">
        swfobject.registerObject("FlashID");
    </script>
    <script>
        $(document).ready(function () {
            $('.article_ul li a').click(function () {
                $('#window').attr('data', $(this).attr('data'));
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    مقالات
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
        <asp:HiddenField ID="PaperCountHiddenField" runat="server" />
    <!-- Title Part(Part2)-->     
        <div id="paperContainer" runat="server">
        </div>    
</asp:Content>
