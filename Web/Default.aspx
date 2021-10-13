<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ OutputCache Duration="10" VaryByParam="None" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>وب سایت رسمی اولین نمایشگاه فناوری های پیشرفته استان مرکزی  | Markzai Exhibition Official Website</title>
   <meta content="index, follow" name="robots"></meta>
<meta content="شرکت فناوران آیریس iRIS Music Player" name="title"></meta>
<meta content="شرکت فناوران آیریس در تاریخ 21/01/1392 تحت شماره ثبت 436859 فعالیت رسمی خود را با هدف ارتقاء سطح کیفی تولید نرم افزار در کشور، شروع و اقدام به تولید محصولات جذاب در حوزه های مختلف کرده است که در این راه موفق به ثبت اختراع اولین پلیرهای هوشمند کمک آموزشی زبان در جهان گردیده که چالش دیرینه زبان دوستان که علاقه مند به تقویت زبان خود از طریق دیدن فیلم، شنیدن موسیقی و یا خواندن کتاب بوده اند را حل کرده است. لازم به ذکر است شرکت فناوران آیریس در راستای تولید نرم افزار های خود و سرآمد تمامی آن ها، پروژه ی مترجم هوشمند خود اقدام به راه اندازی موسسه ی زبان خود به نام پردیس دانش نموده و تمامی نرم افزار های مرتبط به شاخه ی زبان های خارجی خود را ابتدا در آموزشگاه پردیس دانش تست و سپس راهی بازارهای جهانی میکند." name="description"></meta>
<meta content="lyrics,subtitle,player,download,iris music player,music player,iris media player,media player,iris movie player,movie player,iris ebook reader,زیر نویس,دیکشنری هوشمند,دیکشنری,کتاب,دانلود زیر نویس فیلم,دانلود متن آهنگ,آیریس,ایریس,عکس,نرم افزار,آهنگ,فیلم" name="keywords"></meta>
<meta content="شرکت فناوران آیریس" name="author"></meta>

    <link rel="stylesheet" type="text/css" href="App_Themes/Default/css/style.css" />
    <link href="App_Themes/Default/css/demo.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="App_Themes/Default/css/stimenu.css" />
    <script type="text/javascript" src="App_Themes/Default/js/jquery-1.10.1.min.js"></script>
    <script type="text/JavaScript">
        $(document).ready(function () {
            $('.sti-menu li a span').each(function () {
                $(this).addClass('sti-icon-' + (($(this).attr('data-id')).toString()));
            });
        });
    </script>
    <script type="text/javascript" src="App_Themes/Default/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="App_Themes/Default/js/jquery.iconmenu.js"></script>
    <script src="App_Themes/Default/Scripts/swfobject_modified.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('#sti-menu').iconmenu();
        });
    </script>
    <script type="text/javascript">
        $(function () { $('.read-more, .left-col-banner, #footer-logo, .infobox-continue-btn').hover(function () { $(this).stop().animate({ "opacity": 0.5 }, 200) }, function () { $(this).stop().animate({ "opacity": 1 }, 500) }) });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper">
            <div id="menu-container">
                <div id="menu-container2">
                    <ul id="sti-menu" class="sti-menu">
                        <asp:Repeater runat="server" ID="Repeater1" DataSourceID="UserSiteMapDataSource">
                            <ItemTemplate>
                                <li data-hovercolor="#fff">
                                    <a href='<%# Eval("url") %>' runat="server" target="_self">
                                        <h2 data-type="mText" class="sti-item">
                                            <img src='<%# Eval("description") %>' width="88" height="20" border="0" alt='<%# Eval("title") %>' /></h2>
                                        <h3 data-type="sText" class="sti-item sti-icon-bottom">&nbsp;</h3>
                                        <span data-type="icon" data-id='<%# Eval("title") %>' class="sti-icon sti-item"></span>
                                    </a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SiteMapDataSource ID="UserSiteMapDataSource" runat="server" ShowStartingNode="false" />
                    </ul>
                </div>
            </div>

            <div id="banner">
            </div>
            <div id="info-box-container">
                <div class="info-box" style="margin-right: 0 !important;">
                    <div class="infobox-top">
                        <div class="infobox-icon">
                            <img src="App_Themes/Default/images/infobox-icon-1.jpg" width="106" height="107" alt="icon-1" />
                        </div>
                        <div class="infobox-title">
                            <img src="App_Themes/Default/images/infobox-title-1.png" width="194" height="47" alt="محصولات عرضه شده" />
                        </div>
                        <div class="infobox-text">محصولات و طرح های متفاوتی در نمایشگاه فناوری های پیشرفته ارائه و معرفی می شوند. ...</div>
                        <div class="infobox-continue-btn">
                            <a href="Guest/Product.aspx">
                                <img src="App_Themes/Default/images/continue-btn.png" alt="ادامه" width="79" height="26" border="0" /></a>
                        </div>
                    </div>
                    <div class="infobox-shadow"></div>
                </div>
                <div class="info-box">
                    <div class="infobox-top">
                        <div class="infobox-icon">
                            <img src="App_Themes/Default/images/infobox-icon-2.jpg" width="106" height="106" alt="icon-2" />
                        </div>
                        <div class="infobox-title">
                            <img src="App_Themes/Default/images/infobox-title-2.png" width="194" height="47" alt="فن بازار استان مرکزی" />
                        </div>
                        <div class="infobox-text">فن بازار، مرکز مبادلات فن آوری و جامع ترین خدمات تخصصی استان مرکزی است که به عنوان نهادی پیشتاز در ...</div>
                        <div class="infobox-continue-btn">
                            <a href="Guest/Technique.aspx">
                                <img src="App_Themes/Default/images/continue-btn.png" width="79" height="26" border="0" alt="ادامه" /></a>
                        </div>
                    </div>
                    <div class="infobox-shadow"></div>
                </div>
                <div class="info-box">
                    <div class="infobox-top">
                        <div class="infobox-icon">
                            <img src="App_Themes/Default/images/infobox-icon-3.jpg" width="106" height="106" alt="icon-3" />
                        </div>
                        <div class="infobox-title">
                            <img src="App_Themes/Default/images/infobox-title-3.png" width="194" height="47" alt="برگزار کنندگان" />
                        </div>
                        <div class="infobox-text">برگزار کنندگان نمایشگاه شامل  دانشگاهها و مراکز علمی و تحقیقاتی شرکت های ...</div>
                        <div class="infobox-continue-btn">
                            <a href="Guest/Organizer.aspx">
                                <img src="App_Themes/Default/images/continue-btn.png" width="79" height="26" border="0" alt="ادامه" /></a>
                        </div>
                    </div>
                    <div class="infobox-shadow"></div>
                </div>
                <div class="info-box">
                    <div class="infobox-top">
                        <div class="infobox-icon">
                            <img src="App_Themes/Default/images/infobox-icon-4.jpg" width="106" height="106" alt="icon-4" />
                        </div>
                        <div class="infobox-title">
                            <img src="App_Themes/Default/images/infobox-title-4.png" width="194" height="47" alt="درباره استان مرکزی" />
                        </div>
                        <div class="infobox-text">
                            استان مرکزی به عنوان پایتخت صنعتی ایران تقریباً در مرکز ایران قرار دارد. بزرگترین شهر و مرکز استان مرکزی ...
                        </div>
                        <div class="infobox-continue-btn">
                            <a href="Guest/Markazi.aspx">
                                <img src="App_Themes/Default/images/continue-btn.png" width="79" height="26" border="0" alt="ادامه" /></a>
                        </div>
                    </div>
                    <div class="infobox-shadow"></div>
                </div>
            </div>
            <div id="quick-launch-container">
                <div class="quick-launch-item-container" style="margin-right: 0; background-color: #8afff6;">
                    <div class="view view-tenth">
                        <img src="App_Themes/Default/images/ql-3.jpg" alt="">
                        <div class="mask">
                            <p>اخبار اطلاعیه ها و رویدادهای نمایشگاه را از این مسیر مشاهده نمایید</p>
                            <a href="Guest/News.aspx" class="info">ادامه</a>
                        </div>
                    </div>
                </div>
                <div class="quick-launch-item-container">
                    <div class="view view-tenth" style="background-color: #6bfecc;">
                        <img src="App_Themes/Default/images/ql-2.jpg" alt="">
                        <div class="mask">
                            <p>لیست خدمات و کارگاه های برگزار شده را از این مسیر مشاهده نمایید</p>
                            <a href="Guest/Service.aspx" class="info">ادامه</a>
                        </div>
                    </div>
                </div>
                <div class="quick-launch-item-container">
                    <div class="view view-tenth" style="background-color: #d2ff71;">
                        <img src="App_Themes/Default/images/ql-1.jpg" alt="">
                        <div class="mask">
                            <p>سوالات خود را از این مسیر مطرح نمایید</p>
                            <a href="Guest/Faq.aspx" class="info">ادامه</a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="container">
                <div class="content">
                    <div id="content-right-col">
                        <h1>نمایشگاه فناوری های پیشرفته</h1>
                        در راستای تحقق منویات مقام معظم رهبری در زمینه اقتصاد مقاومتی، به منظور فراهم شدن بستر و زمینه مناسب برای شناسائی طرح های تحقیقاتی در حوزه های مختلف کشاورزی، صنعت، زیست فناوری، پزشکی و غیره و همچنین حمایت از شرکت های دانش بنیان در سطح استان به خصوص در حوزه فناوری های نوین و معرفی توان علمی و رقابتی شرکت های دانش بنیان استان این ضرورت در استان احساس شد تا از ظرفیت های علمی به صورت نهادینه استفاده شود.
                        <br />
                        از آنجائیکه این امر جز با روی آوردن به اقتصاد دانش بنیان صورت نخواهد گرفت و از طرفی علیرغم اینکه زیرساخت های فناوری های پیشرفته در استان و کشور فراهم شده اما حلقه اتصالی بین این طرح ها و صنایع وجود ندارد، با بهره گیری از نظر مساعد جناب آقای مهندس مقیمی استاندار محترم مرکزی برگزای نمایشگاه «فناوری های پیشرفته» مورد توجه قرار گرفته است.
                        <br />
                        امید است با برپایی این نمایشگاه، زمینه برای ایجاد این حلقه فراهم گردیده و طرح های علمی نو را که توسط افراد و یا شرکت های دانش بنیان ارائه گردیده اما به دلایل مختلف از جمله به دلیل عدم توانایی افراد شرایط مناسب برای اجرایی شدن آن فراهم نشده ارایه شده و با مشارکت سرمایه گذاران، این طرح ها به مرحله تجاری سازی برسند .
                         <br />

                        <a href="Guest/AboutUs.aspx">
                            <img src="App_Themes/Default/images/read-more.png" alt="ادامه مطلب" width="83" height="17" border="0" class="read-more" /></a>
                    </div>
                    <div id="content-left-col">
                        <div class="left-col-banner">
                            <a href="Guest/Message1.aspx">
                                <img src="App_Themes/Default/images/ban-1.png" width="333" height="107" border="0" alt="banner-1" /></a>
                        </div>
                        <div class="left-col-banner">
                            <a href="Guest/Message2.aspx">
                                <img src="App_Themes/Default/images/ban-2.png" width="333" height="107" border="0" alt="banner-2" /></a>
                        </div>
                        <div class="left-col-banner">
                            <a href="Guest/Message3.aspx">
                                <img src="App_Themes/Default/images/ban-4.png" width="333" height="107" border="0" alt="banner-2" /></a>
                        </div>
                     <%--   <div class="left-col-banner">
                            <a href="Guest/Contact.aspx">
                                <img src="App_Themes/Default/images/ban-3.png" width="333" height="107" border="0" alt="banner-3" /></a>
                        </div>--%>
                       
                    </div>
                </div>
                <div id="footer">
                    <div id="footer-text">
                        <a href="Default.aspx">صفحه اصلی</a> |  <a href="Guest/Gallery.aspx">گالری</a> |  <a href="Guest/Paper.aspx">مقالات</a> |  <a href="Guest/AboutUs.aspx">درباره ما</a> |  <a href="Guest/Contact.aspx">تماس با ما</a> |  <a href="Guest/Service.aspx">کارگاه آموزشی</a> |  <a href="Guest/Faq.aspx">سوالات متداول</a><br />
                        <br />
                        تمامی حقوق مادی و معنوی این سایت متعلق به استانداری استان مرکزی می باشد.<br />
                        طراحی وب سایت و بهینه سازی از شرکت حصین 09128840828-09183688125
                    </div>
                    <div id="footer-logo">
                        <a href="#">
                            <img src="App_Themes/Default/images/footer-logo.png" width="165" height="86" border="0" alt="footer-logo" /></a>
                    </div>
                </div>

      
            </div>

        </div>
        <div id="fixedtop1">
            <div id="center900">
                <marquee behavior="scroll" scrolldelay="40" scrollamount="1" direction="right" width="100%">
                    <span id="sentenceSpan" dir="rtl">
                        کلید موفقیت در عرصه فناوری های نو تبدیل علم به ثروت است.
                    </span></marquee>

                <div id:"visitorCount" style="position:absolute;top:100%; right:50%">
                       <center>
                         <!-- PersianStat -->
                         <!-- URL: http://www.hitech-arak.ir -->
                         <script language='javascript' type='text/javascript' src='http://www.persianstat.com/service/stat.js'></script>
                         <script language='javascript' type='text/javascript'>
                             persianstat(10213577, 0);
                         </script>
                         <!-- /PersianStat -->
                         </center>
                       </div>
      
        </div>
         </div>
                      
    </form>
    
</body>
</html>
