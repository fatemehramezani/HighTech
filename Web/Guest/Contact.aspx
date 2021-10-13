<%@ Page Title="تماس با ما" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Guest_Contact" %>
<%@ OutputCache duration="10" varybyparam="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../App_Themes/Default/css/style-contact.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    تماس با ما
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="contact-content">
        <!-- column (left)-->
        <div class="one-column">
            <asp:MultiView ID="ContactMultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="SendView" runat="server">
                    <!-- form -->
                    <script type="text/javascript" src="../App_Themes/Default/js/form-validation.js"></script>
                    <div id="contactForm">
                        <fieldset style="padding: 20px; border: none">
                            <div>
                                <label>عنوان</label>
                                <asp:TextBox ID="title" runat="server" name="title" class="form-poshytip" title="عنوان پیام خود را وارد کنید" />
                            </div>
                            <div>
                                <label>نام و نام خانوادگی</label>
                                <asp:TextBox ID="name" runat="server" name="name" class="form-poshytip" title="نام کامل خود را وارد کنید" />
                            </div>
                            <div>
                                <label>پست الکترونیکی</label>
                                <asp:TextBox runat="server" name="email" type="text" class="form-poshytip" ID="email" title="پست الکترونیکی خود را وارد کنید" />
                            </div>
                            <div>
                                <label>پیام</label>
                                <asp:TextBox ID="comments" name="comments" runat="server" TextMode="MultiLine" Rows="5" cols="20" class="form-poshytip" title="لطفا پیام خود را بنویسید" />
                                
                                  </div>                                 
                            <div>
                                <asp:Button ID="submit" name="submit" runat="server" value="ارسال" Text="ارسال" OnClick="AcceptImageButton_Click" />
                            </div>
                            <br /><br />
                             <label><b>پست الکترونیکی : info@hitech-arak.ir</b></label>
                        </fieldset>
                    </div>
                    <!-- ENDS form -->
                </asp:View>
                <asp:View runat="server" ID="FinishView">
                    <h2>
                         با تشکر از تماس شما
                    </h2>
                    <asp:Button ID="ReturnButton" name="submit" runat="server" value="بازگشت" Text="بازگشت" OnClick="ReturnButton_Click" />
                </asp:View>
            </asp:MultiView>
        </div>
        <!-- ENDS column -->
        <!-- column (right)-->
        <div class="one-column" style="margin-left: 0px; margin-right: 37px;">
            <!-- content -->
            <p>&nbsp;</p>
            <div id="map_canvas">
                <div style="left: 0px; top: 0px; width: 100%; height: 100%;">
                    <iframe width="438px" height="300px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=WA,+United+States&amp;aq=0&amp;oq=WA&amp;sll=47.605288,-122.329296&amp;sspn=0.008999,0.016544&amp;ie=UTF8&amp;hq=&amp;hnear=Washington,+District+of+Columbia&amp;t=m&amp;z=7&amp;iwloc=A&amp;output=embed"></iframe>
                </div>
            </div>
            <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
            <p>
                Chambers St 1254 New York City<br />
                USA ZIP 44511<br />
                (33) 1234 5677, (33) 12459876<br />
                <a href="mailto:email@server.com">email@server.com</a>
            </p>
            <!-- ENDS content -->
        </div>
    </div>
</asp:Content>
