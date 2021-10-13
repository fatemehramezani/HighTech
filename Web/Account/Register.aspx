<%@ Page Title="عضویت" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="Account_Register" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    عضویت
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <p>
        <strong>
            <br />
            متقاضی گرامی، جهت درخواست کالا و فرآورده و یا حضور در نمایشگاه و ثبت نام در سایت عضو شوید تا بتوانید از امکانات پنل متقاضیان استفاده نمایید. </strong>
        <br />
        1. نهادها و موسسات مرتبط با فناوری که فقط متقاضی حضور در نمایشگاه به منظور ارائه توانمندی های خویش هستند قسمت درخواست حضور در نمایشگاه را تکمیل نمایند.  
        <br />
        2. افرادی که فقط متقاضی حضور در نمایشگاه به منظور معرفی محصول و فناوری میباشند قسمت ثبت محصول را تکمیل نمایند.  
        <br />
        3. افرادی که میخواهند دانش فنی محصول و فناوری را به فروش رسانند، علاوه بر تکمیل فرم ثبت نام محصول قسمت ثبت فناوری را نیز تکمیل نمایند.  
        <br />
        4. افرادی که متقاضی خرید یک یا چند نوع فناوری هستند قسمت تقاضای فناوری را تکمیل نمایند.  
        <br />
        5. افرادی که متقاضی خرید یک یا چند نوع محصول هستند قسمت تقاضای محصول را تکمیل نمایند.  
    </p>
    <p>
        <img src="../App_Themes/Default/images/img-19.jpg" class="pages-content-img2" width="250" height="250" alt="register" />
    </p>
    <br />
    <div id="contactForm">
        <asp:CreateUserWizard ID="RegisterUser" runat="server" OnCreatedUser="RegisterUser_CreatedUser" ContinueDestinationPageUrl="~/Account/Profile.aspx" meta:resourcekey="RegisterUserResource1">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server" meta:resourcekey="RegisterUserWizardStepResource1">
                    <ContentTemplate>
                        <asp:TextBox ID="UserName" required title="نام کاربری را وارد کنید" placeholder="نام کاربری" data-icon="U" CssClass="field" runat="server" meta:resourcekey="UserNameResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                            ErrorMessage="نام کاربری اجباری است" ToolTip="نام کاربری اجباری است."
                            ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" meta:resourcekey="UserNameRequiredResource1">* نام کاربری را وارد نمایید </asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="Email" required title="آدرس الکترونیکی را وارد کنید" placeholder="آدرس الکترونیکی" data-icon="U" CssClass="field" runat="server" meta:resourcekey="EmailResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                            ErrorMessage="آدرس الکترونیکی اجباری است." ToolTip="آدرس الکترونیکی اجباری است"
                            ValidationGroup="RegisterUserValidationGroup" Display="Dynamic" meta:resourcekey="EmailRequiredResource1">*آدرس الکترونیکی را وارد نمایید</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="Password" required title="رمز عبور را وارد کنید" placeholder="رمز عبور" data-icon="U" CssClass="field" runat="server" meta:resourcekey="PasswordResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                            ErrorMessage="رمز عبور اجباری است." ToolTip="Password is required." Display="Dynamic"
                            ValidationGroup="RegisterUserValidationGroup" meta:resourcekey="PasswordRequiredResource1">*رمز عبور را وارد نمایید</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ConfirmPassword" required title="تاییدیه رمز عبور را وارد کنید" placeholder="تاییدیه رمز عبور" data-icon="U" CssClass="field" runat="server" meta:resourcekey="ConfirmPasswordResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" Display="Dynamic"
                            ErrorMessage="تاییدیه رمز عبور اجباری است" ID="ConfirmPasswordRequired" runat="server"
                            ToolTip="تاییدیه رمز عبور اجباری است." ValidationGroup="RegisterUserValidationGroup" meta:resourcekey="ConfirmPasswordRequiredResource1">*رمز عبور را تکرار نمایید</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                            Display="Dynamic" ErrorMessage="رمز عبور و تاییدیه رمز عبور باید یکسان باشند."
                            ValidationGroup="RegisterUserValidationGroup" meta:resourcekey="PasswordCompareResource1">*</asp:CompareValidator>

                        <span>
                            <asp:Literal ID="ErrorMessage" runat="server" meta:resourcekey="ErrorMessageResource1"></asp:Literal>
                        </span>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" ValidationGroup="RegisterUserValidationGroup" meta:resourcekey="RegisterUserValidationSummaryResource1" />
                    </ContentTemplate>
                    <CustomNavigationTemplate>
                        <br />
                        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="ثبت نام" ValidationGroup="RegisterUserValidationGroup" meta:resourcekey="StepNextButtonResource1" />
                        <h5>رمز عبور باید حداقل کاراکتر باشد.
                        </h5>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="RegisterCompleteWizardStep" runat="server" meta:resourcekey="RegisterCompleteWizardStepResource1">
                    <ContentTemplate>
                        <h2>کاربر شما با موفقیت اضافه شد </h2>
                        <br />
                        <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" OnClick="ContinueButton_Click" Text="ادامه" ValidationGroup="RegisterUser" meta:resourcekey="ContinueButtonResource1" />
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
            <FinishNavigationTemplate>
                <asp:Button runat="server" CausesValidation="False" CommandName="MovePrevious" Text="بازگشت" ID="FinishPreviousButton" meta:resourcekey="FinishPreviousButtonResource1"></asp:Button>
                <asp:Button runat="server" CommandName="MoveComplete" Text="پایان" ID="FinishButton" meta:resourcekey="FinishButtonResource1"></asp:Button>
            </FinishNavigationTemplate>
        </asp:CreateUserWizard>
    </div>
</asp:Content>
