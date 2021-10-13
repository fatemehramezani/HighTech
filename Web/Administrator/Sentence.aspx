<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/UserMasterPage.master"
    AutoEventWireup="true" CodeFile="Sentence.aspx.cs" Inherits="Admin_Sentence" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="../App_Themes/Default/css/PickerStyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="Server">
    جمله روز
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table style="width: 100%" title="جمله روز">
        <tr>
            <td style="width: 90px">عنوان جمله روز:
            </td>
            <td style="width: 250px">
                <asp:TextBox ID="SentenceTextTextBox" runat="server" Width="250px"></asp:TextBox>
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
                        <td style="width: 353px">
                            <asp:GridView ID="SentenceGridView" runat="server" AutoGenerateColumns="False"
                                DataKeyNames="SentenceID" DataSourceID="SentenceEntityDataSource" HorizontalAlign="Center"
                                OnSelectedIndexChanged="SentenceGridView_SelectedIndexChanged" PageSize="5" Width="400px" AllowSorting="True" AllowPaging="True">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="SelectImageButton" runat="server" CommandName="Select" SkinID="SelectButton" />
                                        </ItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SentenceID" Visible="False" />
                                    <asp:BoundField DataField="SentenceText" HeaderText="جمله روز" SortExpression="SentenceText">
                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td style="width: 20px"></td>
                        <td valign="top" align="center">
                            <asp:FormView ID="SentenceFormView" runat="server" DataSourceID="SentenceEntityDataSource"
                                DataKeyNames="SentenceID" DefaultMode="Insert" OnItemDeleted="SentenceFormView_ItemDeleted"
                                OnItemCommand="SentenceFormView_ItemCommand" Width="450px">
                                <EditItemTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                        <tr valign="middle">
                                            <td style="width: 80px;" align="right">
                                                <asp:Label runat="server" Text="تاریخ:"></asp:Label>
                                            </td>
                                            <td>
                                                <pdc:PersianDateTextBox ID="StartPersianDateTextBox" runat="server" DateValue='<%# Bind("InsertDate") %>'
                                                    PickerDirection="ToRight" ShowPickerOnTop="True" Width="200px"></pdc:PersianDateTextBox>
                                                <asp:RequiredFieldValidator ID="StartPersianRequiredFieldValidator" runat="server" ControlToValidate="StartPersianDateTextBox"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                                <pdc:PersianDateValidator ID="StartPersianDateValidator" runat="server" ControlToValidate="StartPersianDateTextBox"
                                                    Display="Dynamic" ErrorMessage="تاریخ قابل پذیرش نیست" ValidationGroup="Update"></pdc:PersianDateValidator>
                                            </td>
                                        </tr>
                                        <tr valign="middle">
                                            <td style="width: 80px;" align="right">
                                                <asp:Label ID="Label1" runat="server" Text="متن:"></asp:Label>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr valign="middle">
                                            <td colspan="2" align="right" dir="rtl">
                                                <asp:TextBox ID="SentenceTextBox" runat="server" Text='<%# Bind("SentenceText") %>'
                                                    TextMode="MultiLine" MaxLength="512" Height="80px" Width="420px" />
                                                <asp:RequiredFieldValidator ID="SentenceRequiredFieldValidator" runat="server" ControlToValidate="SentenceTextBox"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 80px;" align="right">
                                                <asp:Label runat="server" Text="پیش فرض:"></asp:Label>
                                            </td>
                                            <td style="width: 160px" align="right">
                                                <asp:CheckBox ID="DefaultCheckBox" Checked='<%# Bind("IsDefault") %>' runat="server"
                                                    Text="جمله جاری" />
                                            </td>
                                            <td style="width: 80px;" align="right"></td>
                                            <td style="width: 160px" align="right"></td>
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
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                        <tr valign="middle">
                                            <td style="width: 80px;" align="right">
                                                <asp:Label runat="server" Text="تاریخ:"></asp:Label>
                                            </td>
                                            <td>
                                                <pdc:PersianDateTextBox ID="StartPersianDateTextBox" runat="server" DateValue='<%# Bind("InsertDate") %>'
                                                    PickerDirection="ToRight" ShowPickerOnTop="True" Width="200px"></pdc:PersianDateTextBox>
                                                <asp:RequiredFieldValidator ID="StartPersianRequiredFieldValidator" runat="server" ControlToValidate="StartPersianDateTextBox"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                                                <pdc:PersianDateValidator ID="StartPersianDateValidator" runat="server" ControlToValidate="StartPersianDateTextBox"
                                                    Display="Dynamic" ErrorMessage="تاریخ قابل پذیرش نیست" ValidationGroup="Insert"></pdc:PersianDateValidator>
                                            </td>
                                        </tr>
                                        <tr valign="middle">
                                            <td style="width: 80px;" align="right">
                                                <asp:Label runat="server" Text="متن:"></asp:Label>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr valign="middle">
                                            <td colspan="2" align="right" dir="rtl">
                                                <asp:TextBox ID="SentenceTextBox" runat="server" Text='<%# Bind("SentenceText") %>'
                                                    TextMode="MultiLine" MaxLength="512" Height="80px" Width="420px" />
                                                <asp:RequiredFieldValidator ID="SentenceRequiredFieldValidator" runat="server" ControlToValidate="SentenceTextBox"
                                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 80px;" align="right">
                                                <asp:Label runat="server" Text="پیش فرض:"></asp:Label>
                                            </td>
                                            <td style="width: 160px" align="right">
                                                <asp:CheckBox ID="DefaultCheckBox" Checked='<%# Bind("IsDefault") %>' runat="server"
                                                    Text="جمله جاری" />
                                            </td>
                                            <td style="width: 80px;" align="right"></td>
                                            <td style="width: 160px" align="right"></td>
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
    <asp:EntityDataSource ID="SentenceEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities" EntitySetName="Sentences"
        Where="(@SentenceText is null || it.SentenceText LIKE '%' + @SentenceText + '%')"
        EnableUpdate="True"
        EnableDelete="True"
        EnableInsert="True"
        EnableFlattening="False"
        OnDeleted="SentenceEntityDataSource_Command"
        OnInserted="SentenceEntityDataSource_Command"
        OnUpdated="SentenceEntityDataSource_Command"
        AutoGenerateOrderByClause="True">
        <WhereParameters>
            <asp:ControlParameter ControlID="SentenceTextTextBox" Name="SentenceText" Type="String" />
        </WhereParameters>
        <OrderByParameters>
            <asp:ControlParameter ControlID="SentenceGridView" Name="OrderBy" PropertyName="SortExpression"
                Type="String" />
        </OrderByParameters>
    </asp:EntityDataSource>
    <asp:HiddenField ID="SentenceIDHiddenField" runat="server" />
    <pdc:PersianDateScriptManager ID="PersianDateScriptManager" runat="server">
    </pdc:PersianDateScriptManager>
</asp:Content>

