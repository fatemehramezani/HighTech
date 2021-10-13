<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    ورود کاربران
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="contactForm">
        <h5>لطفا نام کاربری و رمز عبور خود را وارد نمایید:
        اگر حساب کاربری ندارید   
                        <b>
                            <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">ثبت نام کنید  </asp:HyperLink></b>
        </h5>
        <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false" OnLoggedIn="LoginUser_LoggedIn" FailureText="نام کاربری یا رمز عبور اشتباه است">
            <LayoutTemplate>
                <div>
                    <asp:TextBox ID="UserName" required title="نام کاربری را وارد کنید" placeholder="نام کاربری" data-icon="U" CssClass="field" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                        ErrorMessage="نام کاربری اجباری است" ToolTip="نام کاربری اجباری است"
                        ValidationGroup="LoginValidationGroup" Display="Dynamic">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="Password" CssClass="field" runat="server" type="password" required title="کلمه عبور را وارد کنید" placeholder="کلمه عبور" data-icon="x"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                        ErrorMessage="رمز عبور اجباری است" ToolTip="رمز عبور اجباری است"
                        ValidationGroup="LoginValidationGroup" Display="Dynamic">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:CheckBox ID="RememberMe" CssClass="checkbox" runat="server" Text="ذخیره سازی مشخصات" />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="LoginLinkButton" runat="server" CommandName="Login" Text="ورود" ValidationGroup="LoginValidationGroup" />
                    <br />
                    <span>
                        <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                    </span>
                    <br />
                    <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server"
                        ValidationGroup="LoginValidationGroup" />
                </div>
            </LayoutTemplate>
        </asp:Login>
    </div>
</asp:Content>

