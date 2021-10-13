<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/UserMasterPage.master" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="Admin_Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    تنظیمات
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DescriptionContent" runat="Server">
    مدیر گرامی! با استفاده از این قسمت می توانید تنظیمات سایت را مدیریت نمایید.
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="vars_fields_section">
        <div class="rows">
            <div class="input_section">
                <label>مدت زمان ویزیت</label>
                <asp:RequiredFieldValidator ID="IntervalRequired" runat="server" ControlToValidate="Interval"
                    ErrorMessage="مدت زمان ویزیت اجباری است" ToolTip="مدت زمان ویزیت اجباری است"
                    ValidationGroup="ChangeValidationGroup" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox class="field" ID="Interval" runat="server" />
            </div>
            <div class="input_section">
                <label>بازه مجاز وقت گیری بیمار</label>
                <asp:RequiredFieldValidator ID="DateIntervalRequiredFieldValidator" runat="server" ControlToValidate="DateInterval"
                    ErrorMessage="بازه مجاز وقت گیری بیمار اجباری است" ToolTip="بازه مجاز وقت گیری بیمار اجباری است"
                    ValidationGroup="ChangeValidationGroup" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox class="field" ID="DateInterval" runat="server" />
            </div>
            <div class="input_section" style="margin: 0px !important;">
                <label>
                    طول کد رهگیری
                </label>
                <asp:RequiredFieldValidator ID="VerificationSizeRequiredFieldValidator" runat="server" ControlToValidate="VerificationSize"
                    ErrorMessage="طول کد رهگیری اجباری است" ToolTip="طول کد رهگیری اجباری است"
                    ValidationGroup="ChangeValidationGroup" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox class="field" ID="VerificationSize" runat="server" />
            </div>
        </div>
        <div class="rows">
            <div class="input_section">
                <label>یادآور ارسال پیامک</label>
                <asp:RequiredFieldValidator ID="ReminderRequiredFieldValidator" runat="server" ControlToValidate="Reminder"
                    ErrorMessage="یادآور ارسال پیامک اجباری است" ToolTip="یادآور ارسال پیامک اجباری است"
                    ValidationGroup="ChangeValidationGroup" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox class="field" ID="Reminder" runat="server" />
            </div>
        </div>
    </div>
    <div class="vars_container">
        <div>
            <asp:Button ID="ChangeButton" runat="server" Text="تغییر" SkinID="MetroInsertModeButton" ValidationGroup="ChangeValidationGroup" OnClick="ChangeButton_Click" />
        </div>
        <div>
            <span style="color: red">
                <asp:Literal ID="FailureText" Text="کلمه عبور تغییر نکرد. لطفا دوباره تلاش کنید.کلمه عبور جدید باید حداقل 6 کاراکتر باشد." runat="server" Visible="false"></asp:Literal>
            </span>
        </div>
        <br />
        <div dir="rtl">
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" ValidationGroup="ChangeValidationGroup" />
        </div>
    </div>
</asp:Content>

