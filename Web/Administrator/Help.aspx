<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/UserMasterPage.master" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="Admin_Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    راهنمای پذیرش
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table style="width: 100%" title="راهنمای پذیرش">
        <tr>
            <td style="width: 90px">عنوان راهنمای پذیرش:
            </td>
            <td style="width: 250px">
                <asp:TextBox ID="HelpTitleTextBox" runat="server" Width="250px"></asp:TextBox>
            </td>
            <td style="width: 90px">سایز صفحه:
            </td>
            <td style="width: 100px">
                <asp:DropDownList ID="PageSizeDropDownList" SkinID="SearchDropDownList" runat="server">
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
                <asp:ImageButton ID="SearchImageButton" runat="server" OnClick="SearchImageButton_Click"
                    SkinID="SearchButton" />
                <asp:ImageButton ID="ClearImageButton" runat="server" OnClick="ClearImageButton_Click"
                    OnClientClick="return false;" SkinID="ClearButton" />
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <table>
                    <tr>
                        <td style="width: 353px;" valign="top">
                            <asp:GridView ID="HelpGridView" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="HelpID" DataSourceID="HelpEntityDataSource" HorizontalAlign="Center"
                                OnSelectedIndexChanged="HelpGridView_SelectedIndexChanged" PageSize="5" Width="300px" AllowSorting="True" AllowPaging="True">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="SelectImageButton" runat="server" CommandName="Select" SkinID="SelectButton" />
                                        </ItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="HelpID" Visible="False" />
                                    <asp:BoundField DataField="HelpTitle" HeaderText="عنوان راهنمای پذیرش" SortExpression="HelpTitle">
                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td style="width: 20px"></td>
                        <td valign="top" align="center">
                            <asp:FormView ID="HelpFormView" runat="server" DataSourceID="HelpEntityDataSource"
                                DataKeyNames="HelpID" DefaultMode="Insert" OnItemDeleted="HelpFormView_ItemDeleted"
                                OnItemCommand="HelpFormView_ItemCommand" Width="500px">
                                <EditItemTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 500px">
                                        <tr valign="middle">
                                            <td style="width: 80px" align="right">عنوان :
                                            </td>
                                            <td style="width: 370px" align="right">
                                                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("HelpTitle") %>' MaxLength="500"
                                                    Width="370px" />
                                                <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" runat="server" ControlToValidate="TitleTextBox"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr valign="middle">
                                            <td style="width: 80px" align="right">تصویر  :
                                            </td>
                                            <td style="width: 380px" align="right">
                                                <asp:FileUpload ID="PictureFileUpload" runat="server" Width="380px" />
                                                <br />
                                                <asp:CheckBox ID="PictureCheckBox" runat="server" Text="تغییر تصویر" />
                                            </td>
                                        </tr>
                                        <tr valign="middle">
                                            <td style="width: 80px" align="right">فایل  :
                                            </td>
                                            <td style="width: 380px" align="right">
                                                <asp:FileUpload ID="FileFileUpload" runat="server" Width="380px" />
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
                                                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>'
                                                    TextMode="MultiLine" MaxLength="2500" Height="100px" Width="480px" />
                                                <asp:RequiredFieldValidator ID="HelpRequiredFieldValidator" runat="server" ControlToValidate="DescriptionTextBox"
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
                                                            <asp:Button ID="UpdateImageButton" runat="server" CommandName="Update" 
                                                                ValidationGroup="Update" OnClientClick="if (!confirm('آيا از اعمال تغییرات مطمئن هستيد؟')) return false;" />
                                                        </td>
                                                        <td align="left" valign="top" style="width: 80px">
                                                            <asp:Button ID="CancelImageButton" runat="server" CommandName="Cancel"  />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 500px">
                                        <tr valign="middle">
                                            <td style="width: 80px" align="right">عنوان :
                                            </td>
                                            <td style="width: 370px" align="right">
                                                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("HelpTitle") %>' MaxLength="500"
                                                    Width="370px" />
                                                <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" runat="server" ControlToValidate="TitleTextBox"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr valign="middle">
                                            <td style="width: 80px" align="right">تصویر :
                                            </td>
                                            <td style="width: 380px" align="right">
                                                <asp:FileUpload ID="PictureFileUpload" runat="server" Width="380px" />
                                            </td>
                                        </tr>
                                        <tr valign="middle">
                                            <td style="width: 80px" align="right">فایل :
                                            </td>
                                            <td style="width: 380px" align="right">
                                                <asp:FileUpload ID="FileFileUpload" runat="server" Width="380px" />
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
                                                    TextMode="MultiLine" MaxLength="2500" Height="100px" Width="480px" />
                                                <asp:RequiredFieldValidator ID="HelpRequiredFieldValidator" runat="server" ControlToValidate="DescriptionTextBox"
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
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:EntityDataSource ID="HelpEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities" EntitySetName="Helps"
        Where="(@HelpTitle is null || it.HelpTitle LIKE '%' + @HelpTitle + '%')"
        EnableUpdate="True"
        EnableDelete="True"
        EnableInsert="True"
        EnableFlattening="False"
        OnDeleted="HelpEntityDataSource_Command"
        OnInserted="HelpEntityDataSource_Command"
        OnUpdated="HelpEntityDataSource_Command"
        OnInserting="HelpEntityDataSource_InsertingFiles"
        OnUpdating="HelpEntityDataSource_InsertingFiles"
        AutoGenerateOrderByClause="True">
        <WhereParameters>
            <asp:ControlParameter ControlID="HelpTitleTextBox" Name="HelpTitle" Type="String" />
        </WhereParameters>
        <OrderByParameters>
            <asp:ControlParameter ControlID="HelpGridView" Name="OrderBy" PropertyName="SortExpression"
                Type="String" />
        </OrderByParameters>
    </asp:EntityDataSource>
    <asp:HiddenField ID="HelpIDHiddenField" runat="server" />
</asp:Content>

