<%@ Page Title="ثبت نام" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="Guest_Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    ثبت نام
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="contactForm">
        <asp:CreateUserWizard ID="RegisterUser" runat="server" ActiveStepIndex="0" OnCreatedUser="RegisterUser_CreatedUser" ContinueDestinationPageUrl="~/Account/Profile.aspx">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                    <ContentTemplate>
                        <h5>رمز عبور باید حداقل  <%= Membership.MinRequiredPasswordLength %> کاراکتر باشد.
                        </h5>
                        <asp:TextBox ID="UserName" required title="نام کاربری را وارد کنید" placeholder="نام کاربری" data-icon="U" CssClass="field" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                            ErrorMessage="نام کاربری اجباری است" ToolTip="نام کاربری اجباری است."
                            ValidationGroup="RegisterUserValidationGroup" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="Email" required title="آدرس الکترونیکی را وارد کنید" placeholder="آدرس الکترونیکی" data-icon="U" CssClass="field" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                            ErrorMessage="آدرس الکترونیکی اجباری است." ToolTip="آدرس الکترونیکی اجباری است"
                            ValidationGroup="RegisterUserValidationGroup" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="Password" required title="رمز عبور را وارد کنید" placeholder="رمز عبور" data-icon="U" CssClass="field" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                            ErrorMessage="رمز عبور اجباری است." ToolTip="Password is required." Display="Dynamic"
                            ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="ConfirmPassword" required title="تاییدیه رمز عبور را وارد کنید" placeholder="تاییدیه رمز عبور" data-icon="U" CssClass="field" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" Display="Dynamic"
                            ErrorMessage="تاییدیه رمز عبور اجباری است" ID="ConfirmPasswordRequired" runat="server"
                            ToolTip="تاییدیه رمز عبور اجباری است." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                            Display="Dynamic" ErrorMessage="رمز عبور و تاییدیه رمز عبور باید یکسان باشند."
                            ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                        <br />
                        <span>
                            <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                        </span>
                        <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" ValidationGroup="RegisterUserValidationGroup" />
                    </ContentTemplate>
                    <CustomNavigationTemplate>
                        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="ثبت نام" ValidationGroup="RegisterUserValidationGroup" />
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="RegisterCompleteWizardStep" runat="server">
                    <ContentTemplate>
                        <h2>کاربر شما با موفقیت اضافه شد </h2>

                        <br />
                        <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" OnClick="ContinueButton_Click" Text="ادامه" ValidationGroup="RegisterUser" />
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
            <FinishNavigationTemplate>
                <asp:Button runat="server" CausesValidation="False" CommandName="MovePrevious" Text="بازگشت" ID="FinishPreviousButton"></asp:Button>
                <asp:Button runat="server" CommandName="MoveComplete" Text="پایان" ID="FinishButton"></asp:Button>
            </FinishNavigationTemplate>
        </asp:CreateUserWizard>
    </div>
</asp:Content>
