<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/UserMasterPage.master" AutoEventWireup="true" CodeFile="Paper.aspx.cs" Inherits="Admin_Paper" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="Server">
    <style>
        
#toolbox_icon_1 {
    float: left;
    width: 19px;
    height: 19px;
    cursor: pointer;
    background-image: url(../App_Themes/Default/images/booking/toolbox-icon-1.png);
    background-repeat: no-repeat;
    background-position: 0px 0px;
    margin-right: 5px;
}
#toolbox_icon_1:hover {
	background-position: 0px -19px;
}
#toolbox_icon_2 {
    float: left;
    width: 19px;
    height: 19px;
    cursor: pointer;
    background-image: url(../App_Themes/Default/images/booking/toolbox-icon-2.png);
    background-repeat: no-repeat;
    background-position: 0px 0px;
    margin-right: 5px;
}
#toolbox_icon_2:hover {
	background-position: 0px -19px;
}
#toolbox_icon_3 {
	float:left;
	width:19px;
	height:19px;
	cursor:pointer;
	background-image: url(../App_Themes/Default/images/booking/toolbox-icon-3.png);
	background-repeat: no-repeat;
	background-position: 0px 0px;
	margin-right: 5px;
}
#toolbox_icon_3:hover {
	background-position: 0px -19px;
}
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="DescriptionContent" runat="Server">
    از طریق این صفحه می توانید محتویات و فایل مقالات به نمایش درآمده را مدیریت نمایید.
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    مقاله ها
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table style="width: 100%" title="مقاله">
        <tr>
            <td style="width: 90px">عنوان مقاله:
            </td>
            <td style="width: 250px">
                <asp:TextBox ID="PaperTitleTextBox" runat="server" Width="250px"></asp:TextBox>
            </td>
            <td style="width: 90px">سایز صفحه:
            </td>
            <td style="width: 100px">
                <asp:DropDownList ID="PageSizeDropDownList" SkinID="SearchDropDownList" runat="server" OnSelectedIndexChanged="PageSizeDropDownList_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Selected="True" Value="5">[پیش فرض]</asp:ListItem>
                    <asp:ListItem Value="5">5 رکورد</asp:ListItem>
                    <asp:ListItem Value="10">10 رکورد</asp:ListItem>
                    <asp:ListItem Value="15">15 رکورد</asp:ListItem>
                    <asp:ListItem Value="20">20 رکورد</asp:ListItem>
                    <asp:ListItem Value="25">25 رکورد</asp:ListItem>
                    <asp:ListItem Value="1000000">تمام رکورد ها</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="width: 80px">
                <asp:Button ID="SearchImageButton" runat="server" OnClick="SearchImageButton_Click"
                    SkinID="SearchButton" />
                <asp:Button ID="ClearImageButton" runat="server" OnClick="ClearImageButton_Click"
                    OnClientClick="return false;" SkinID="ClearButton" />
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:MultiView runat="server" ID="PaperMultiView" ActiveViewIndex="0">
                    <asp:View runat="server" ID="ShowView">
                        <asp:GridView ID="PaperGridView" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="PaperID" DataSourceID="PaperEntityDataSource" HorizontalAlign="Center"
                            OnSelectedIndexChanged="PaperGridView_SelectedIndexChanged" PageSize="5" Width="80%" AllowSorting="True" AllowPaging="True">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="SelectImageButton" runat="server" CommandName="Select" SkinID="SelectButton" />
                                    </ItemTemplate>
                                    <ItemStyle Width="25px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="PaperID" Visible="False" />
                                <asp:BoundField DataField="PaperTitle" HeaderText="عنوان مقاله" SortExpression="PaperTitle">
                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </asp:View>
                    <asp:View ID="EditView" runat="server">
                        <asp:FormView ID="PaperFormView" runat="server" DataSourceID="PaperEntityDataSource"
                            DataKeyNames="PaperID" DefaultMode="Insert" OnItemDeleted="PaperFormView_ItemDeleted"
                            OnItemCommand="PaperFormView_ItemCommand">
                            <EditItemTemplate>
                                <table border="0" cellpadding="5" cellspacing="5" style="margin: 20px;" width="600px;">
                                    <tr valign="middle">
                                        <td style="width: 80px" align="right">عنوان :
                                        </td>
                                        <td style="width: auto" align="right">
                                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("PaperTitle") %>' MaxLength="500" />
                                            <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" runat="server" ControlToValidate="TitleTextBox"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr valign="middle">
                                        <td style="width: 80px" align="right">تصویر  :
                                        </td>
                                        <td style="width: auto" align="right">
                                            <asp:FileUpload ID="PictureFileUpload" runat="server" />
                                            <br />
                                            <asp:CheckBox ID="PictureCheckBox" runat="server" Text="تغییر تصویر" />
                                        </td>
                                    </tr>
                                    <tr valign="middle">
                                        <td style="width: 80px" align="right">فایل  :
                                        </td>
                                        <td style="width: auto" align="right">
                                            <asp:FileUpload ID="FileFileUpload" runat="server" />
                                            <br />
                                            <asp:CheckBox ID="FileCheckBox" runat="server" Text="تغییر فایل" />
                                        </td>
                                    </tr>
                                    <tr valign="middle">
                                        <td style="width: 80px" align="right">متن  :
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr valign="middle">
                                        <td colspan="2" align="right" dir="rtl">
                                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" MaxLength="2500" Height="80px" Width="100%" />
                                            <asp:RequiredFieldValidator ID="PaperRequiredFieldValidator" runat="server" ControlToValidate="DescriptionTextBox"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="left">
                                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                                <tr>
                                                    <td style="height: 15px"></td>
                                                    <td align="left" valign="top" style="width: 80px;"></td>
                                                    <td align="left" valign="top" style="width: 80px;"></td>
                                                    <td align="left" valign="top" style="width: 80px;"></td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 15px">&nbsp;
                                                    </td>
                                                    <td align="left" valign="top" style="width: 80px">
                                                        <asp:Button ID="DeleteImageButton" runat="server" CausesValidation="False" CommandName="Delete"
                                                            Text="حذف" OnClientClick="if (!confirm('آيا از حذف مطمئن هستيد؟')) return false;" />
                                                    </td>
                                                    <td align="left" valign="top" style="width: 80px">
                                                        <asp:Button ID="UpdateImageButton" runat="server" CommandName="Update" Text="ویرایش"
                                                            ValidationGroup="Update" OnClientClick="if (!confirm('آيا از اعمال تغییرات مطمئن هستيد؟')) return false;" />
                                                    </td>
                                                    <td align="left" valign="top" style="width: 80px">
                                                        <asp:Button ID="CancelImageButton" runat="server" CommandName="Cancel" Text="انصراف" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <table border="0" cellpadding="5" cellspacing="5" style="margin: 20px;" width="600px;">
                                    <tr valign="middle">
                                        <td style="width: 80px" align="right">عنوان :
                                        </td>
                                        <td style="width: auto" align="right">
                                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("PaperTitle") %>' MaxLength="500" />
                                            <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" runat="server" ControlToValidate="TitleTextBox"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr valign="middle">
                                        <td style="width: 80px" align="right">تصویر :
                                        </td>
                                        <td style="width: auto" align="right">
                                            <asp:FileUpload ID="PictureFileUpload" runat="server" />
                                        </td>
                                    </tr>
                                    <tr valign="middle">
                                        <td style="width: 80px" align="right">فایل :
                                        </td>
                                        <td style="width: auto" align="right">
                                            <asp:FileUpload ID="FileFileUpload" runat="server" />
                                        </td>
                                    </tr>
                                    <tr valign="middle">
                                        <td style="width: 80px" align="right">متن :
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr valign="middle">
                                        <td colspan="2" align="right" dir="rtl">
                                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>'
                                                TextMode="MultiLine" MaxLength="2500" Height="80px" Width="100%" />
                                            <asp:RequiredFieldValidator ID="PaperRequiredFieldValidator" runat="server" ControlToValidate="DescriptionTextBox"
                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="left">
                                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                                <tr>
                                                    <td style="height: 15px">&nbsp;
                                                    </td>
                                                    <td align="left" valign="top" style="width: 80px;"></td>
                                                    <td align="left" valign="top" style="width: 80px;"></td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 15px">&nbsp;
                                                    </td>
                                                    <td align="left" valign="top" style="width: 80px;">
                                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="ایجاد"
                                                            ValidationGroup="Insert" />
                                                    </td>
                                                    <td align="left" valign="top" style="width: 80px;">
                                                        <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                                            Text="انصراف" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </InsertItemTemplate>
                        </asp:FormView>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
    <asp:EntityDataSource ID="PaperEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities" EntitySetName="Papers"
        Where="(@PaperTitle is null || it.PaperTitle LIKE '%' + @PaperTitle + '%')"
        EnableUpdate="True"
        EnableDelete="True"
        EnableInsert="True"
        EnableFlattening="False"
        OnDeleted="PaperEntityDataSource_Command"
        OnInserted="PaperEntityDataSource_Command"
        OnUpdated="PaperEntityDataSource_Command"
        OnInserting="PaperEntityDataSource_InsertingFiles"
        OnUpdating="PaperEntityDataSource_InsertingFiles"
        AutoGenerateOrderByClause="True">
        <WhereParameters>
            <asp:ControlParameter ControlID="PaperTitleTextBox" Name="PaperTitle" Type="String" />
        </WhereParameters>
        <OrderByParameters>
            <asp:ControlParameter ControlID="PaperGridView" Name="OrderBy" PropertyName="SortExpression"
                Type="String" />
        </OrderByParameters>
    </asp:EntityDataSource>
    <asp:HiddenField ID="PaperIDHiddenField" runat="server" />
</asp:Content>

