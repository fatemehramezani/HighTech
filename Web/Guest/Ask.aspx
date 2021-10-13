<%@ Page Title="پرسش" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Ask.aspx.cs" Inherits="Guest_Ask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    پرسش
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:MultiView ID="AskMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="InsertView" runat="server">
            <table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td bgcolor="#E6E6E6" class="bg1" style="padding: 10px 50px;">
                        <table width="100%" border="0" cellpadding="4" cellspacing="1">
                            <style type="text/css">
                                @import url('../App_Themes/Default/assets/css/contact.css');
                                @import url('../App_Themes/Default/assets/css/lay.css');

                                .style1 {
                                    color: #FFFFFF;
                                }
                            </style>

                            <script type="text/javascript" src="'../App_Themes/Default/assets/js/jquery.js"></script>
                            <script type="text/javascript" src="'../App_Themes/Default/assets/js/js.js"></script>

                            <div id="contact">
                                <div id="top">
                                    <h2>تمامی گزینه های ستاره دار را پر کنید</h2>
                                </div>
                                <div id="center">
                                    <div id="contact_form" dir="rtl">
                                        <asp:Label ID="TitleLabel" runat="server" Text="عنوان پرسش:"></asp:Label>
                                        <asp:TextBox ID="TitleTextBox" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" ControlToValidate="TitleTextBox" runat="server" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:Label ID="NameLabel" runat="server" Text="نام:"></asp:Label>
                                        <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" ControlToValidate="NameTextBox" runat="server" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:Label ID="EmailLabel" runat="server" Text="آدرس الکترونیکی:"></asp:Label>
                                        <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" ControlToValidate="EmailTextBox" runat="server" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:Label ID="ContextLabel" runat="server" Text="سوال:"></asp:Label>
                                        <asp:TextBox ID="ContextTextBox" runat="server" Height="99px" TextMode="MultiLine" Width="245px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ContextRequiredFieldValidator" ControlToValidate="ContextTextBox" runat="server" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:CheckBox ID="PrivateCheckBox" Text="پرسش خصوصی" runat="server" />
                                        <br />
                                        <div dir="ltr" style="margin-left: 40px;">
                                            <asp:ImageButton ID="AcceptImageButton" AlternateText="ثبت" runat="server" SkinID="ConfirmButton" OnClick="AcceptImageButton_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="FinishView" runat="server">
            <h2>پرسش شما به موفقیت ثبت شد.        
            </h2>
            <asp:Button ID="ReturnButton" name="submit" runat="server" value="بازگشت" Text="بازگشت" OnClick="ReturnButton_Click" />
        </asp:View>
    </asp:MultiView>
</asp:Content>

