<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/UserMasterPage.master" AutoEventWireup="true" CodeFile="Process.aspx.cs" Inherits="Basic_Process" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TitleContent" runat="Server">
    فرآیند توسعه
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script lang="jv" type="text/javascript">
        function SelectItem(sender, e) {
            e.IsValid = (e.Value != '0');
        }
    </script>
    <table>
        <tr>
            <td>
                <asp:ImageButton ID="NewImageButton" runat="server" OnClick="NewImageButton_Click" SkinID="DatabaseAddButton" />
                <asp:ImageButton ID="SearchImageButton" runat="server" OnClick="SearchImageButton_Click"
                    SkinID="SearchButton" />
                <asp:ImageButton ID="ClearImageButton" runat="server" OnClick="ClearImageButton_Click"
                    OnClientClick="return false;" SkinID="ClearButton" />
                <br />
                <asp:Label ID="ProcessNameLabel" runat="server" Text="عنوان:" SkinID="Caption" CssClass="lable"></asp:Label>
                <asp:TextBox ID="ProcessNameTextBox" runat="server" SkinID="TextBox"></asp:TextBox>
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
            </td>
        </tr>
        <tr>
            <td>
                <div style="float: right; width: 300px; vertical-align: top;" dir="rtl" class="gvclass">
                    <asp:GridView ID="ProcessGridView" runat="server" AllowPaging="True" AllowSorting="True"
                        DataKeyNames="Id" DataSourceID="ProcessEntityDataSource"
                        Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="ProcessGridView_SelectedIndexChanged">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="SelectImageButton" runat="server" CommandName="Select" SkinID="SelectButton" />
                                </ItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="عنوان" SortExpression="Name">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div dir="rtl" style="padding-right: 20px; width: 300px; vertical-align: top; float: left;">
                    <asp:FormView ID="ProcessFormView" runat="server" DataSourceID="ProcessEntityDataSource" DataKeyNames="Id" DefaultMode="Insert">
                        <EditItemTemplate>
                            <div style="margin: 10px;">
                                <asp:Label ID="ProcessNameLabel" runat="server" Text="عنوان:" SkinID="Caption" CssClass="lable"></asp:Label>
                                <asp:TextBox ID="ProcessNameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                <asp:RequiredFieldValidator ID="ProcessNameRequiredFieldValidator" runat="server" ControlToValidate="ProcessNameTextBox"
                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                <br />
                                <div style="float: left; padding: 10px;">
                                    <asp:Button ID="DeleteImageButton" runat="server" CausesValidation="False" CommandName="Delete"
                                        Text="حذف" OnClientClick="if (!confirm('آيا از حذف مطمئن هستيد؟')) return false;" />
                                    <asp:Button ID="UpdateImageButton" runat="server" CommandName="Update" Text="ویرایش"
                                        ValidationGroup="Update" OnClientClick="if (!confirm('آيا از اعمال تغییرات مطمئن هستيد؟')) return false;" />
                                    <asp:Button ID="CancelImageButton" runat="server" CommandName="Cancel" Text="انصراف" />
                                </div>
                            </div>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div style="margin: 10px;">
                                <asp:Label ID="ProcessNameLabel" runat="server" Text="عنوان:" SkinID="Caption" CssClass="lable"></asp:Label>
                                <asp:TextBox ID="ProcessNameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                <asp:RequiredFieldValidator ID="ProcessNameRequiredFieldValidator" runat="server" ControlToValidate="ProcessNameTextBox"
                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                                <br />
                                <div style="float: left; padding: 10px;">
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="ایجاد"
                                        ValidationGroup="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="انصراف" />
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>
            </td>
        </tr>
    </table>
    <asp:EntityDataSource ID="ProcessEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities" DefaultContainerName="DatabaseEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Processes" OnDeleted="ProcessEntityDataSource_Command"
        OnInserted="ProcessEntityDataSource_Command" OnUpdated="ProcessEntityDataSource_Command"
        Where="(@Name is null || it.Name LIKE '%' + @Name + '%')" AutoGenerateOrderByClause="True">
        <WhereParameters>
            <asp:ControlParameter ControlID="ProcessNameTextBox" Name="Name" Type="String" />
        </WhereParameters>
        <OrderByParameters>
            <asp:ControlParameter ControlID="ProcessGridView" Name="OrderBy" PropertyName="SortExpression"
                Type="String" />
        </OrderByParameters>
    </asp:EntityDataSource>
</asp:Content>

