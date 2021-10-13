<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/UserMasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Applicant_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../App_Themes/Default/css/Site.css" rel="stylesheet" />

    <style>
        table {
            margin: 35px;
        }

        tbody tr td {
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="DescriptionContent" runat="Server">
    متقاضی محترم از طریق این صفحه می توانید اطلاعات محصولات و طرح های خود را مدیریت نمایید.
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script language="jv" type="text/javascript">
        function SelectItem(sender, e) {
            e.IsValid = (e.Value != '0');
        }
    </script>
    <asp:MultiView runat="server" ID="ProductMultiView" ActiveViewIndex="0">
        <asp:View runat="server" ID="ShowView">
            <asp:ImageButton ID="NewImageButton" runat="server" OnClick="NewImageButton_Click" SkinID="PanelAddImageButton" />
            <asp:ImageButton ID="SearchImageButton" runat="server" OnClick="SearchImageButton_Click"
                SkinID="PanelSearchImageButton" />
            <asp:ImageButton ID="ClearImageButton" runat="server" OnClick="ClearImageButton_Click"
                OnClientClick="return false;" SkinID="PanelClearImageButton" />
            <br />
            <asp:Label ID="NameLabel" runat="server" Text="نام:" SkinID="Caption" CssClass="lable"></asp:Label>
            <asp:TextBox ID="NameTextBox" runat="server" SkinID="TextBox"></asp:TextBox>
            <asp:Label ID="DescriptionLabel" runat="server" Text="توضیحات:" SkinID="Caption" CssClass="lable"></asp:Label>
            <asp:TextBox ID="DescriptionTextBox" runat="server" SkinID="TextBox"></asp:TextBox>
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
                <asp:GridView ID="ProductGridView" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    DataKeyNames="Id" 
                    DataSourceID="ProductEntityDataSource"
                    Width="90%" 
                    AutoGenerateColumns="False" 
                    OnSelectedIndexChanged="ProductGridView_SelectedIndexChanged" 
                    PageSize="5">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="SelectImageButton" runat="server" CommandName="Select" SkinID="PanelSelectImageButton" />
                            </ItemTemplate>
                            <ItemStyle Width="25px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تصویر">
                            <ItemTemplate>
                                <asp:Image ID="Image" runat="server" Width="110px" Height="130px" ImageUrl='<%# "../Account/Handler.ashx?ProductId=" + Eval("Id")  %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="it.Name">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Description" HeaderText="توضیحات">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:View>
        <asp:View runat="server" ID="EditView">
            <asp:FormView ID="ProductFormView" Width="90%" runat="server" DataSourceID="ProductEntityDataSource" DataKeyNames="Id" DefaultMode="Insert"
                OnItemDeleted="ProductFormView_ItemDeleted"
                OnItemCommand="ProductFormView_ItemCommand">
                <EditItemTemplate>
                    <asp:Label ID="PictureLabel" runat="server" Text="تصویر:" SkinID="Caption" CssClass="lable"></asp:Label>
                    <asp:FileUpload ID="PictureFileUpload" runat="server" />
                    <asp:CheckBox ID="PictureCheckBox" runat="server" Text="تغییر تصویر" />
                    <br />
                    <asp:RadioButton ID="IsGoodsRadioButton" runat="server" Checked='<%# Bind("IsGoods") %>' Text="محصول" GroupName="Goods" />
                    <asp:RadioButton ID="IsNotGoodsRadioButton" runat="server" Text="طرح" GroupName="Goods" />
                    <br />
                    <asp:Label ID="NameLabel" runat="server" Text="نام:" SkinID="Caption" CssClass="lable"></asp:Label>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' Width="100%" />
                    <asp:RequiredFieldValidator ID="ProductNameRequiredFieldValidator" runat="server" ControlToValidate="NameTextBox"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="DescriptionLabel" runat="server" Text="نوضیحات:" SkinID="Caption" CssClass="lable"></asp:Label>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' Width="100%" TextMode="MultiLine" Rows="3" />
                    <asp:RequiredFieldValidator ID="DescriptionRequiredFieldValidator" runat="server" ControlToValidate="DescriptionTextBox"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Update">
                    </asp:RequiredFieldValidator>
                    <br />
                    <div style="float: left; padding: 10px;">
                        <asp:Button ID="DeleteImageButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="حذف" OnClientClick="if (!confirm('آيا از حذف مطمئن هستيد؟')) return false;" />
                        <asp:Button ID="UpdateImageButton" runat="server" CommandName="Update" Text="ویرایش"
                            ValidationGroup="Update" OnClientClick="if (!confirm('آيا از اعمال تغییرات مطمئن هستيد؟')) return false;" />
                        <asp:Button ID="CancelImageButton" runat="server" CommandName="Cancel" Text="انصراف" />
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Label ID="PictureLabel" runat="server" Text="تصویر:" SkinID="Caption" CssClass="lable"></asp:Label>
                    <asp:FileUpload ID="PictureFileUpload" runat="server" />
                    <br />
                    <asp:CheckBox ID="PictureCheckBox" runat="server" Text="تغییر تصویر" />
                    <asp:RadioButton ID="IsGoodsRadioButton" runat="server" Checked='<%# Bind("IsGoods") %>' Text="محصول" GroupName="Goods" />
                    <asp:RadioButton ID="IsNotGoodsRadioButton" runat="server" Text="طرح" Checked="False" GroupName="Goods" />
                    <br />
                    <asp:Label ID="NameLabel" runat="server" Text="نام:" SkinID="Caption" CssClass="lable"></asp:Label>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' Width="100%" />
                    <asp:RequiredFieldValidator ID="ProductNameRequiredFieldValidator" runat="server" ControlToValidate="NameTextBox"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="DescriptionLabel" runat="server" Text="نوضیحات:" SkinID="Caption" CssClass="lable"></asp:Label>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' Width="100%" TextMode="MultiLine" Rows="3" />
                    <asp:RequiredFieldValidator ID="DescriptionRequiredFieldValidator" runat="server" ControlToValidate="DescriptionTextBox"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="Insert">
                    </asp:RequiredFieldValidator>
                    <br />
                    <div style="float: left; padding: 10px;">
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="ایجاد"
                            ValidationGroup="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="انصراف" />
                    </div>
                </InsertItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:EntityDataSource ID="ProductEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities"
        EnableDelete="True"
        EnableFlattening="False"
        EnableInsert="True"
        EnableUpdate="True"
        EntitySetName="Products"
        OnDeleted="ProductEntityDataSource_Command"
        OnInserted="ProductEntityDataSource_Command"
        OnUpdated="ProductEntityDataSource_Command"
        OnInserting="ProductEntityDataSource_InsertingFiles"
        OnUpdating="ProductEntityDataSource_InsertingFiles"
        Where="it.IsRequested = False and (it.ApplicantId = @ApplicantId ) And (@Name is null || it.Name LIKE '%' + @Name + '%') And (@Description is null || it.Description LIKE '%' + @Description + '%')">
        <WhereParameters>
            <asp:ControlParameter ControlID="NameTextBox" Name="Name" Type="String" />
            <asp:ControlParameter ControlID="DescriptionTextBox" Name="Description" Type="String" />
            <asp:ProfileParameter Name="ApplicantId" PropertyName="ApplicantId" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>

