<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/UserMasterPage.master" AutoEventWireup="true" CodeFile="Technology.aspx.cs" Inherits="Applicant_Technology" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style>
        span {
            width: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    فناوری
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DescriptionContent" runat="Server">
    متقاضی محترم از طریق این صفحه می توانید اطلاعات فناوری های خود را مدیریت نمایید.
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="Server">
    <script language="jv" type="text/javascript">
        function SelectItem(sender, e) {
            e.IsValid = (e.Value != '0');
        }
    </script>
    <asp:MultiView runat="server" ID="TechnologyMultiView" ActiveViewIndex="0">
        <asp:View runat="server" ID="ShowView">
            <asp:ImageButton ID="NewImageButton" runat="server" OnClick="NewImageButton_Click" SkinID="PanelAddImageButton" />
            <asp:ImageButton ID="SearchImageButton" runat="server" OnClick="SearchImageButton_Click"
                SkinID="PanelSearchImageButton" />
            <asp:ImageButton ID="ClearImageButton" runat="server" OnClick="ClearImageButton_Click"
                OnClientClick="return false;" SkinID="PanelClearImageButton" />
            <br />
            <asp:Label ID="PersianNameLabel" runat="server" Text="نام فارسی:" SkinID="Caption" CssClass="lable"></asp:Label>
            <asp:TextBox ID="PersianNameTextBox" runat="server" SkinID="TextBox"></asp:TextBox>
            <asp:Label ID="EnglishNameLabel" runat="server" Text="نام انگلیسی:" SkinID="Caption" CssClass="lable"></asp:Label>
            <asp:TextBox ID="EnglishNameTextBox" runat="server" SkinID="TextBox"></asp:TextBox>
            <br />
            <asp:Label ID="SizePageLabel" runat="server" Text="سایز صفحه:" SkinID="Caption" CssClass="lable"></asp:Label>
            <asp:DropDownList ID="PageSizeDropDownList" SkinID="SearchDropDownList" runat="server">
                <asp:ListItem Selected="True" Value="5">[پیش فرض]</asp:ListItem>
                <asp:ListItem Value="5">5 رکورد</asp:ListItem>
                <asp:ListItem Value="10">10 رکورد</asp:ListItem>
                <asp:ListItem Value="15">15 رکورد</asp:ListItem>
                <asp:ListItem Value="20">20 رکورد</asp:ListItem>
                <asp:ListItem Value="25">25 رکورد</asp:ListItem>
                <asp:ListItem Value="1000000">تمام رکورد ها</asp:ListItem>
            </asp:DropDownList>
            <br />
            <div style="height: 450px !important; overflow: auto">
                <asp:GridView ID="TechnologyGridView"
                    runat="server"
                    AllowPaging="True"
                    AllowSorting="True"
                    DataKeyNames="Id"
                    DataSourceID="TechnologyEntityDataSource"
                    Width="90%"
                    AutoGenerateColumns="False"
                    OnSelectedIndexChanged="TechnologyGridView_SelectedIndexChanged"
                    PageSize="5">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="SelectImageButton" runat="server" CommandName="Select" SkinID="PanelSelectImageButton" />
                            </ItemTemplate>
                            <ItemStyle Width="25px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="PersianName" HeaderText="عنوان فارسی" SortExpression="PersianName">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EnglishName" HeaderText="عنوان انگلیسی" SortExpression="EnglishName">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:View>
        <asp:View runat="server" ID="EditView">
            <asp:FormView ID="TechnologyFormView"
                Width="90%"
                runat="server"
                DataSourceID="TechnologyEntityDataSource"
                DataKeyNames="Id"
                DefaultMode="Insert"
                OnItemDeleted="TechnologyFormView_ItemDeleted"
                OnItemCommand="TechnologyFormView_ItemCommand"
                OnDataBound="TechnologyFormView_DataBound">
                <EditItemTemplate>
                    <div style="height: 500px !important; overflow: auto">
                        <asp:Label ID="PersianNameLabel" runat="server" Text="نام فارسی:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("PersianName") %>' runat="server" ID="PersianNameTextBox" />
                        <asp:RequiredFieldValidator ID="PersianNameRequiredFieldValidator" runat="server" ControlToValidate="PersianNameTextBox"
                            Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator><br />

                        <asp:Label ID="EnglishNameLabel" runat="server" Text="نام انگلیسی:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("EnglishName") %>' runat="server" ID="EnglishNameTextBox" />
                        </br>

                        <asp:Label ID="LocationLabel" runat="server" Text="محل استقرار فعلی:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Location") %>' runat="server" ID="LocationTextBox" /><br />

                        <asp:Label ID="FieldsLabel" runat="server" Text="حوزه تحصصی محصول:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:CheckBoxList ID="FieldCheckBoxList" CssClass="checkListBox" DataSourceID="FieldEntityDataSource" runat="server" RepeatColumns="3" DataTextField="Name" DataValueField="Id"></asp:CheckBoxList>
                        <asp:HiddenField runat="server" ID="FieldsHiddenField" Value='<%# Eval("Fields") %>'/>

                        <asp:Label ID="InformationLabel" runat="server" Text="مشخصات کلی محصول:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Information") %>' runat="server" ID="InformationTextBox" /><br />

                        <asp:Label ID="DescriptionLabel" runat="server" Text="معرفی محصول:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" /><br />

                        <asp:Label ID="UsageLabel" runat="server" Text="کاربرد:" SkinID="Description" CssClass="lable"></asp:Label>

                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Usage") %>' runat="server" ID="UsageTextBox" /><br />

                        <asp:Label ID="InnovationLabel" runat="server" Text="جنبه های نوآوری:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Innovation") %>' runat="server" ID="InnovationTextBox" /><br />

                        <asp:Label ID="ProcessLabel" runat="server" Text="محصول در چه مرحله ای فرآیند توسعه قرار دارد؟:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:CustomValidator ID="rocessCustomValidator" runat="server" ClientValidationFunction="SelectItem"
                            ControlToValidate="ProcessDropDownList" Display="Dynamic" ErrorMessage="فرآیند توسعه اجباری است" ValidateEmptyText="true"
                            ValidationGroup="Update">*</asp:CustomValidator>

                        <asp:DropDownList ID="ProcessDropDownList" runat="server" DataSourceID="ProcessEntityDataSource"
                            DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("ProcessId") %>' SkinID="FormDropDownList">
                        </asp:DropDownList>
                        <br />

                        <asp:Label ID="FinanceLabel" runat="server" Text="میزان سرمایه گذاری طرح(میلیون ریال):" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Finance") %>' runat="server" ID="FinanceTextBox" /><br />

                        <asp:Label ID="ConstLabel" runat="server" Text="ثابت (میلیون ریال):" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Const") %>' runat="server" ID="ConstTextBox" /><br />

                        <asp:Label ID="VariableLabel" runat="server" Text="در گردش (میلیون ریال):" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Variable") %>' runat="server" ID="VariableTextBox" /><br />
                        <asp:Label ID="OwnerShipLabel" runat="server" Text="وضعیت مالکیت طرح:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:CustomValidator ID="OwnerShipCustomValidator" runat="server" ClientValidationFunction="SelectItem"
                            ControlToValidate="OwnerShipDropDownList" Display="Dynamic" ErrorMessage="وضعیت مالکیت طرح اجباری است" ValidateEmptyText="true"
                            ValidationGroup="Update">*</asp:CustomValidator>

                        <asp:DropDownList ID="OwnerShipDropDownList" runat="server" DataSourceID="OwnerShipEntityDataSource"
                            DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("OwnerShipId") %>' SkinID="FormDropDownList">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="TitleLabel" runat="server" Text="عنوان:" SkinID="Description" CssClass="lable"></asp:Label>

                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Title") %>' runat="server" ID="TitleTextBox" /><br />

                        <asp:Label ID="CountryLabel" runat="server" Text="کشور:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:CustomValidator ID="CountryCustomValidator" runat="server" ClientValidationFunction="SelectItem"
                            ControlToValidate="CountryDropDownList" Display="Dynamic" ErrorMessage="کشور اجباری است" ValidateEmptyText="true"
                            ValidationGroup="Update">*</asp:CustomValidator>
                        <asp:DropDownList ID="CountryDropDownList" runat="server" DataSourceID="CountryEntityDataSource"
                            DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("CountryId") %>' SkinID="FormDropDownList">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="FacilityLabel" runat="server" Text="درخواست تسهیلات بانکی-مبلغ (میلیون ریال):" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Facility") %>' runat="server" ID="FacilityTextBox" /><br />

                        <asp:Label ID="LandLabel" runat="server" Text="درخواست زمین برای اجرای طرح-محل درخواستی (متراژ):" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Land") %>' runat="server" ID="LandTextBox" /><br />

                        <asp:Label ID="SpecialServicesLabel" runat="server" Text="خدمات تخصصی مورد نیاز:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:CheckBoxList ID="SpecialServiceCheckBoxList" CssClass="checkListBox" DataSourceID="SpecialServiceEntityDataSource" runat="server" RepeatColumns="2" DataTextField="Name" DataValueField="Id"></asp:CheckBoxList>
                        <asp:HiddenField runat="server" ID="SpecialServicesHiddenField" Value='<%# Eval("SpecialServices") %>'/>

                        <div style="float: left; padding: 10px;">
                            <asp:Button ID="DeleteImageButton" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="حذف" OnClientClick="if (!confirm('آيا از حذف مطمئن هستيد؟')) return false;" />
                            <asp:Button ID="UpdateImageButton" runat="server" CommandName="Update" Text="ویرایش"
                                ValidationGroup="Update" OnClientClick="if (!confirm('آيا از اعمال تغییرات مطمئن هستيد؟')) return false;" />
                            <asp:Button ID="CancelImageButton" runat="server" CommandName="Cancel" Text="انصراف" />
                        </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div style="height: 500px !important; overflow: auto">
                        <asp:Label ID="PersianNameLabel" runat="server" Text="نام فارسی:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("PersianName") %>' runat="server" ID="PersianNameTextBox" />
                        <asp:RequiredFieldValidator ID="PersianNameRequiredFieldValidator" runat="server" ControlToValidate="PersianNameTextBox"
                            Display="Dynamic" ErrorMessage="*" ValidationGroup="Insert"></asp:RequiredFieldValidator><br />

                        <asp:Label ID="EnglishNameLabel" runat="server" Text="نام انگلیسی:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("EnglishName") %>' runat="server" ID="EnglishNameTextBox" />
                        </br>

                        <asp:Label ID="LocationLabel" runat="server" Text="محل استقرار فعلی:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Location") %>' runat="server" ID="LocationTextBox" /><br />

                        <asp:Label ID="FieldsLabel" runat="server" Text="حوزه تحصصی محصول:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:CheckBoxList ID="FieldCheckBoxList" CssClass="checkListBox" DataSourceID="FieldEntityDataSource" runat="server" RepeatColumns="3" DataTextField="Name" DataValueField="Id"></asp:CheckBoxList>
                        <asp:HiddenField runat="server" ID="FieldsHiddenField" Value='<%# Eval("Fields") %>'/>

                        <asp:Label ID="InformationLabel" runat="server" Text="مشخصات کلی محصول:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Information") %>' runat="server" ID="InformationTextBox" /><br />

                        <asp:Label ID="DescriptionLabel" runat="server" Text="معرفی محصول:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" /><br />

                        <asp:Label ID="UsageLabel" runat="server" Text="کاربرد:" SkinID="Description" CssClass="lable"></asp:Label>

                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Usage") %>' runat="server" ID="UsageTextBox" /><br />

                        <asp:Label ID="InnovationLabel" runat="server" Text="جنبه های نوآوری:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Innovation") %>' runat="server" ID="InnovationTextBox" /><br />

                        <asp:Label ID="ProcessLabel" runat="server" Text="محصول در چه مرحله ای فرآیند توسعه قرار دارد؟:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:CustomValidator ID="rocessCustomValidator" runat="server" ClientValidationFunction="SelectItem"
                            ControlToValidate="ProcessDropDownList" Display="Dynamic" ErrorMessage="فرآیند توسعه اجباری است" ValidateEmptyText="true"
                            ValidationGroup="Insert">*</asp:CustomValidator>

                        <asp:DropDownList ID="ProcessDropDownList" runat="server" DataSourceID="ProcessEntityDataSource"
                            DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("ProcessId") %>' SkinID="FormDropDownList">
                        </asp:DropDownList>
                        <br />

                        <asp:Label ID="FinanceLabel" runat="server" Text="میزان سرمایه گذاری طرح(میلیون ریال):" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Finance") %>' runat="server" ID="FinanceTextBox" /><br />

                        <asp:Label ID="ConstLabel" runat="server" Text="ثابت (میلیون ریال):" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Const") %>' runat="server" ID="ConstTextBox" /><br />

                        <asp:Label ID="VariableLabel" runat="server" Text="در گردش (میلیون ریال):" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Variable") %>' runat="server" ID="VariableTextBox" /><br />
                        <asp:Label ID="OwnerShipLabel" runat="server" Text="وضعیت مالکیت طرح:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:CustomValidator ID="OwnerShipCustomValidator" runat="server" ClientValidationFunction="SelectItem"
                            ControlToValidate="OwnerShipDropDownList" Display="Dynamic" ErrorMessage="وضعیت مالکیت طرح اجباری است" ValidateEmptyText="true"
                            ValidationGroup="Insert">*</asp:CustomValidator>

                        <asp:DropDownList ID="OwnerShipDropDownList" runat="server" DataSourceID="OwnerShipEntityDataSource"
                            DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("OwnerShipId") %>' SkinID="FormDropDownList">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="TitleLabel" runat="server" Text="عنوان:" SkinID="Description" CssClass="lable"></asp:Label>

                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Title") %>' runat="server" ID="TitleTextBox" /><br />

                        <asp:Label ID="CountryLabel" runat="server" Text="کشور:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:CustomValidator ID="CountryCustomValidator" runat="server" ClientValidationFunction="SelectItem"
                            ControlToValidate="CountryDropDownList" Display="Dynamic" ErrorMessage="کشور اجباری است" ValidateEmptyText="true"
                            ValidationGroup="Insert">*</asp:CustomValidator>
                        <asp:DropDownList ID="CountryDropDownList" runat="server" DataSourceID="CountryEntityDataSource"
                            DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("CountryId") %>' SkinID="FormDropDownList">
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="FacilityLabel" runat="server" Text="درخواست تسهیلات بانکی-مبلغ (میلیون ریال):" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Facility") %>' runat="server" ID="FacilityTextBox" /><br />

                        <asp:Label ID="LandLabel" runat="server" Text="درخواست زمین برای اجرای طرح-محل درخواستی (متراژ):" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:TextBox SkinID="TextBox300" Text='<%# Bind("Land") %>' runat="server" ID="LandTextBox" /><br />

                        <asp:Label ID="SpecialServicesLabel" runat="server" Text="خدمات تخصصی مورد نیاز:" SkinID="Description" CssClass="lable"></asp:Label>
                        <asp:CheckBoxList ID="SpecialServiceCheckBoxList" CssClass="checkListBox" DataSourceID="SpecialServiceEntityDataSource" runat="server" RepeatColumns="2" DataTextField="Name" DataValueField="Id"></asp:CheckBoxList>
                        <asp:HiddenField runat="server" ID="SpecialServicesHiddenField" Value='<%# Eval("SpecialServices") %>'/>

                        <div style="float: left; padding: 10px;">
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="ایجاد"
                                ValidationGroup="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="انصراف" />
                        </div>
                    </div>
                </InsertItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:EntityDataSource ID="TechnologyEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities" DefaultContainerName="DatabaseEntities"
        EnableFlattening="False"
        EntitySetName="Technologies"
        EnableDelete="True"
        EnableInsert="True"
        EnableUpdate="True"
        OnDeleted="TechnologyEntityDataSource_Command"
        OnInserted="TechnologyEntityDataSource_Command"
        OnUpdated="TechnologyEntityDataSource_Command"
        OnInserting="TechnologyEntityDataSource_InsertingFiles"
        OnUpdating="TechnologyEntityDataSource_InsertingFiles"
        Where="it.IsRequested = False and (it.ApplicantId = @ApplicantId ) And (@PersianName is null || it.PersianName LIKE '%' + @PersianName + '%') And (@EnglishName is null || it.EnglishName LIKE '%' + @EnglishName + '%')">
        <WhereParameters>
            <asp:ControlParameter ControlID="PersianNameTextBox" Name="PersianName" Type="String" />
            <asp:ControlParameter ControlID="EnglishNameTextBox" Name="EnglishName" Type="String" />
            <asp:ProfileParameter Name="ApplicantId" PropertyName="ApplicantId" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="ProcessEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities"
        EntitySetName="Processes"
        EnableFlattening="False">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="OwnerShipEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities"
        EntitySetName="OwnerShips"
        EnableFlattening="False">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="CountryEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities"
        EntitySetName="Countries"
        EnableFlattening="False">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="FieldEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities"
        EntitySetName="Fields"
        EnableFlattening="False">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="SpecialServiceEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities"
        EntitySetName="SpecialServices"
        EnableFlattening="False">
    </asp:EntityDataSource>
</asp:Content>

