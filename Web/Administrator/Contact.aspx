<%@ Page Title="مدیریت تماس با ما" Language="C#" MasterPageFile="~/App_MasterPage/UserMasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Admin_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="Server">
    مدیریت تماس با ما
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="ShowView" runat="server">
            <table style="width: 800px" title="کاربر" align="center">
                <tr dir="rtl">
                    <td style="width: 120px; text-align: right;">عنوان:
                    </td>
                    <td style="width: 100px; text-align: right;">
                        <asp:TextBox ID="ContactTitleTextBox" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td style="width: 100px" align="right">نام و نام خانوادگی:
                    </td>
                    <td style="width: 100px">
                        <asp:TextBox ID="NameTextBox" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td style="width: 30px">
                        <asp:ImageButton ID="ClearImageButton" runat="server" OnClick="ClearImageButton_Click"
                            OnClientClick="return false;" SkinID="ClearButton" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 120px; text-align: right;">سایز صفحه:
                    </td>
                    <td style="width: 100px; text-align: right;">
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
                    <td align="right" style="width: 100px;"></td>
                    <td style="width: 100px" align="right"></td>
                    <td style="width: 30px">
                        <asp:ImageButton ID="SearchImageButton" runat="server" OnClick="SearchImageButton_Click"
                            SkinID="SearchButton" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <asp:GridView ID="ContactGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="ContactId" DataSourceID="ContactEntityDataSource" HorizontalAlign="Center"
                            OnSelectedIndexChanged="ContactGridView_SelectedIndexChanged" PageSize="5" Width="100%"
                            AllowSorting="True">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="SelectImageButton" runat="server" CommandName="Select" SkinID="SelectButton" />
                                    </ItemTemplate>
                                    <ItemStyle Width="25px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="ContactId" HeaderText="ContactId" ReadOnly="True" Visible="false"
                                    SortExpression="ContactId" />
                                <asp:BoundField DataField="ContactTitle" HeaderText="عنوان" SortExpression="ContactTitle">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Name" HeaderText="نام و نام خانوادگی" SortExpression="Name"></asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="آدرس الکترونیکی" SortExpression="Email"></asp:BoundField>
                                <asp:BoundField DataField="Time" HeaderText="تاریخ" SortExpression="Time"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="EditView" runat="server">
            <asp:FormView ID="ContactFormView" runat="server" DataSourceID="ContactEntityDataSource"
                DataKeyNames="ContactId" DefaultMode="Edit" OnItemDeleted="ContactFormView_ItemDeleted"
                OnItemCommand="ContactFormView_ItemCommand" Width="800px" HorizontalAlign="Center">
                <EditItemTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 800px" align="center">
                        <tr>
                            <td style="width: 80px" align="right">عنوان :
                            </td>
                            <td style="width: 160px" align="right">
                                <asp:TextBox ID="ContactTitleTextBox" runat="server" MaxLength="50" SkinID="TextBox"
                                    Text='<%# Bind("ContactTitle") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td style="width: 80px" align="right">نام و نام خانوادگی :
                            </td>
                            <td style="width: 160px" align="right">
                                <asp:TextBox ID="NameTextBox" runat="server" MaxLength="50" SkinID="TextBox"
                                    Text='<%# Bind("Name") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80px" align="right">آدرس الکترونیکی :
                            </td>
                            <td style="width: 160px" align="right">
                                <asp:TextBox ID="EmailTextBox" runat="server" MaxLength="50" SkinID="TextBox"
                                    Text='<%# Bind("Email") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td style="width: 80px" align="right">تاریخ:
                            </td>
                            <td style="width: 160px" align="right">
                                <asp:TextBox ID="TimeTextBox" runat="server" MaxLength="50" SkinID="TextBox"
                                    Text='<%# Bind("Time") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80px" align="right">متن :
                            </td>
                            <td align="right" colspan="3">
                                <asp:TextBox ID="ContextTextBox" runat="server" TextMode="MultiLine" SkinID="LongText"
                                    Text='<%# Bind("Context") %>' Width="90%" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80px" align="right">پاسخ :
                            </td>
                            <td align="right" colspan="3">
                                <asp:TextBox ID="AnswerTextBox" runat="server" MaxLength="256" SkinID="LongText"
                                    Text='<%# Bind("Answer") %>' TextMode="MultiLine" Width="90%"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequiredFieldValidator" runat="server" ControlToValidate="AnswerTextBox"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="left">
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
                                            <asp:Button ID="AnswerButtonButton" runat="server" CommandName="Update" 
                                                ValidationGroup="Update" OnClientClick="if (!confirm('آيا از ارسال پاسخ مطمئن هستيد؟')) return false;" />
                                        </td>
                                        <td align="left" valign="top" style="width: 80px">
                                            <asp:Button ID="CancelImageButton" runat="server" CommandName="Cancel" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:EntityDataSource ID="ContactEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities" EnableDelete="True" EnableInsert="True"
        EnableUpdate="True" EntitySetName="Contacts" OnDeleted="ContactEntityDataSource_Command"
        OnUpdated="ContactEntityDataSource_Updated"
        Where="(@Name is null || it.Name LIKE '%' + @Name + '%') and (@ContactTitle is null || it.ContactTitle LIKE '%' + @ContactTitle + '%')"
        CommandText="" EntityTypeFilter="" Select="" AutoGenerateOrderByClause="True">
        <WhereParameters>
            <asp:ControlParameter ControlID="NameTextBox" Name="Name" Type="String" />
            <asp:ControlParameter ControlID="ContactTitleTextBox" Name="ContactTitle" Type="String" />
        </WhereParameters>
        <OrderByParameters>
            <asp:ControlParameter ControlID="ContactGridView" Name="OrderBy" PropertyName="SortExpression"
                Type="String" />
        </OrderByParameters>
    </asp:EntityDataSource>
</asp:Content>

