<%@ Page Title="پروفایل" Language="C#" MasterPageFile="~/App_MasterPage/UserMasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Account_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style>
        input[type="file"] {
            width: 190px;   
        }
    </style>
    <script language="javascript">
        function CheckChanged(isChecked) {
            var firstName = document.getElementById('FirstName');
            alert(firstName.text);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    اطلاعات پروفایل شخص حقیقی/حقوقی
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="DescriptionContent" runat="Server">
    متقاضی گرامی، در این قسمت می توانید اطلاعات پروفایل را ویرایش کنید.
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="vars_fields_section">
        <div class="rows">
            <div class="input_section">
                <br />
                <br />
                <br />
                <br />
                <asp:RadioButton ID="IsRealRadioButton" runat="server" Text="حقیقی" Checked="True" GroupName="Real" OnClick="CheckChanged(this.checked)" />
                <label id="FirstName">نام صاحب محصول</label>
                <asp:RequiredFieldValidator ID="FirstNameRequired" runat="server" ControlToValidate="FirstNameTextBox"
                    ErrorMessage="نام اجباری است" ToolTip="نام اجباری است"
                    ValidationGroup="ProfileValidationSummary" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="FirstNameTextBox" />
            </div>
            <div class="input_section">
                <br />
                <br />
                <br />
                <br />
                <asp:RadioButton ID="IsNotRealRadioButton" runat="server" Text="حقوقی" GroupName="Real" />
                <label id="LastName">نام خانوادگی صاحب محصول</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LastNameTextBox"
                    ErrorMessage="نام خانوادگی اجباری است" ToolTip="نام خانوادگی اجباری است"
                    ValidationGroup="ProfileValidationSummary" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="LastNameTextBox" />
            </div>
            <div class="input_section" style="margin: 0px !important;">
                <img src='<%# "Handler.ashx?ApplicantId=" + Profile.ApplicantId  %>' onerror="this.onerror=null; this.src='../App_Themes/Default/images/noImage.gif';" alt="تصویر" width="128" height="128" id="applicantImage" runat="server" />
                <input id="ImageFileUpload" type="file" name="uploadfile" runat="server" />
                <asp:CheckBox ID="PictureCheckBox" runat="server" Text="تغییر تصویر" TextAlign="Left" />
            </div>
        </div>
        <div class="rows">
            <div class="input_section">
                <label>کد ملی</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="NationalCodeTextBox"
                    ErrorMessage="کد ملی اجباری است" ToolTip="کد ملی اجباری است"
                    ValidationGroup="ProfileValidationSummary" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="NationalCodeTextBox" />
            </div>
            <div class="input_section">
                <label>آدرس الکترونیکی</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="EmailTextBox"
                    ErrorMessage="آدرس الکترونیکی اجباری است" ToolTip="آدرس الکترونیکی اجباری است"
                    ValidationGroup="ProfileValidationSummary" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="EmailTextBox" />
            </div>
            <div class="input_section" style="margin: 0px !important;">
                <label>آدرس سایت</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="WebSiteTextBox"
                    ErrorMessage="آدرس سایت اجباری است" ToolTip="آدرس سایت اجباری است"
                    ValidationGroup="ProfileValidationSummary" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="WebSiteTextBox" />
            </div>
        </div>
        <div class="rows">
            <div class="input_section">
                <label>آدرس</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="AddressTextBox"
                    ErrorMessage="آدرس اجباری است" ToolTip="آدرس اجباری است"
                    ValidationGroup="ProfileValidationSummary" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="AddressTextBox" />
            </div>
            <div class="input_section">
                <label>کدپستی</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ZipCodeTextBox"
                    ErrorMessage="کدپستی اجباری است" ToolTip="کدپستی اجباری است"
                    ValidationGroup="ProfileValidationSummary" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="ZipCodeTextBox" />
            </div>
            <div class="input_section" style="margin: 0px !important;">
                <label>تحصیلات</label>
                <asp:CustomValidator ID="DegreeCustomValidator" runat="server" ClientValidationFunction="SelectItem"
                    ControlToValidate="DegreeDropDownList" Display="Dynamic" ErrorMessage="تحصیلات اجباری است" ValidateEmptyText="true"
                    ValidationGroup="ProfileValidationSummary">*</asp:CustomValidator>
                <asp:DropDownList ID="DegreeDropDownList" runat="server" DataSourceID="DegreeEntityDataSource" DataTextField="Name" DataValueField="Id" OnDataBound="DegreeDropDownList_DataBound"></asp:DropDownList>
            </div>
        </div>
        <div class="rows">
            <div class="input_section">
                <label>تلفن همراه</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="MobileTextBox"
                    ErrorMessage="تلفن همراه اجباری است" ToolTip="تلفن همراه اجباری است"
                    ValidationGroup="ProfileValidationSummary" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="MobileTextBox" />
            </div>
            <div class="input_section">
                <label>تلفن</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PhoneTextBox"
                    ErrorMessage="تلفن اجباری است" ToolTip="تلفن اجباری است"
                    ValidationGroup="ProfileValidationSummary" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="PhoneTextBox" />
            </div>
            <div class="input_section" style="margin: 0px !important;">
                <label>نمابر</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FaxTextBox"
                    ErrorMessage="نمابر اجباری است" ToolTip="نمابر اجباری است"
                    ValidationGroup="ProfileValidationSummary" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="FaxTextBox" />
            </div>
        </div>
        <div class="rows" id="IsNotReal">
            <div class="input_section">
                <label>شرکت</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="CompanyTextBox"
                    ErrorMessage="شرکت اجباری است" ToolTip="شرکت اجباری است"
                    ValidationGroup="ProfileValidationSummary" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="CompanyTextBox" />
            </div>
            <div class="input_section">
                <label>سازمان معرفی کننده</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="PresenterCompanyTextBox"
                    ErrorMessage="سازمان معرفی کننده اجباری است" ToolTip="سازمان معرفی کننده اجباری است"
                    ValidationGroup="ProfileValidationSummary" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox runat="server" ID="PresenterCompanyTextBox" />
            </div>
        </div>
    </div>
    <div class="vars_container">
        <asp:Button ID="ConfirmButton" runat="server" SkinID="MetroInsertModeButton" CausesValidation="False" OnClick="ConfirmButton_Click" Text="ویرایش" ValidationGroup="ProfileValidationSummary" />
    </div>
    <asp:EntityDataSource ID="DegreeEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities" DefaultContainerName="DatabaseEntities" EntitySetName="Degrees" EnableFlattening="False">
    </asp:EntityDataSource>
</asp:Content>

