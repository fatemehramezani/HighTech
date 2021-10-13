<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Guest_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style>
        .label {
            color: rgb(118, 123, 124) !important;
            font-size: 13px !important;
            font-weight: normal !important;
        }

        .RadComboBox .rcbArrowCell a, .RadComboBoxDropDown .rcbList, .RadGrid_WebBlue .rgNumPart a, .RadGrid .rgInfoPart strong {
            font-family: "B Roya",'B Roya';
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    محصولات و فناوری های ارائه شده
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
        </Scripts>
    </telerik:RadScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
    </telerik:RadStyleSheetManager>

    <telerik:RadGrid ID="ProductRadGrid" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ProductEntityDataSource" Font-Names="Tahoma" Skin="WebBlue" AllowFilteringByColumn="True" ShowGroupPanel="True" AutoGenerateColumns="False" ShowStatusBar="True" Culture="fa-IR" >
        <SortingSettings SortedAscToolTip="صعودی" SortedDescToolTip="نزولی" SortToolTip="برای مرتب سازی اینجا رو انتخاب کنید" />
        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True" AllowDragToGroup="True">
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
        <GroupPanel Text="برای گروه بندی ستون را به اینجا بکشید">
        </GroupPanel>
        <MasterTableView DataKeyNames="Name,IsGoods" DataSourceID="ProductEntityDataSource" Dir="RTL">
            <CommandItemSettings ExportToPdfText="Export to PDF" ShowExportToCsvButton="True" ShowExportToWordButton="True" ShowExportToExcelButton="True" ShowExportToPdfButton="True"></CommandItemSettings>
            <RowIndicatorColumn Visible="False" FilterControlAltText="Filter RowIndicator column">
            </RowIndicatorColumn>
            <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column" Created="True">
            </ExpandCollapseColumn>
            <Columns>
                <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="عنوان" ReadOnly="True" SortExpression="Name" UniqueName="Name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Company" FilterControlAltText="Filter Company column" HeaderText="شرکت/موسسه" SortExpression="Company" UniqueName="Company" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Description" FilterControlAltText="Filter Description column" HeaderText="Description" SortExpression="Description" UniqueName="Description"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridCheckBoxColumn DataField="IsValid" DataType="System.Boolean" FilterControlAltText="Filter IsValid column" HeaderText="IsValid" SortExpression="IsValid" UniqueName="IsValid" Visible="False">
                </telerik:GridCheckBoxColumn>
                <telerik:GridBoundColumn DataField="IsGoods" FilterControlAltText="Filter IsGoods column" HeaderText="محصول/طرح" ReadOnly="True" SortExpression="IsGoods" UniqueName="IsGoods" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FullName" FilterControlAltText="Filter FullName column" HeaderText="صاحب محصول/مدیر عامل/نماینده قانونی" SortExpression="FullName" UniqueName="FullName" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FirstName" FilterControlAltText="Filter LastName column" HeaderText="LastName" SortExpression="FirstName" UniqueName="FirstName" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LastName" FilterControlAltText="Filter LastName column" HeaderText="LastName" SortExpression="LastName" UniqueName="LastName" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" Visible="False">
                </telerik:GridBoundColumn>           
                <telerik:GridBoundColumn DataField="WebSite" FilterControlAltText="Filter WebSite column" HeaderText="WebSite" SortExpression="WebSite" UniqueName="WebSite" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn GroupByExpression="Company"  HeaderText="شرکت/موسسه" SortExpression="IsGoods" ItemStyle-ForeColor="#990000" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="70" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <a href='<%# Eval("WebSite") %>'><%# Eval("Company")%></a>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="40px"></ItemStyle>
                </telerik:GridTemplateColumn>

            </Columns>

            <EditFormSettings>
                <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
            </EditFormSettings>

            <PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
        </MasterTableView>

        <FilterMenu EnableImageSprites="False"></FilterMenu>
    </telerik:RadGrid>
    <asp:EntityDataSource ID="ProductEntityDataSource" runat="server" ConnectionString="name=DatabaseEntities" DefaultContainerName="DatabaseEntities" EnableFlattening="False" 
        EntitySetName="ApplicantProducts"
        Where="it.IsRequested = False"></asp:EntityDataSource>
   

   
</asp:Content>

