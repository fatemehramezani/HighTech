<%@ Page Title="اخبار اطلاعیه رویدادها" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="Guest_News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    اخبار  اطلاعیه رویدادها
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="content">
        <div class="pages-content">
         
            <asp:Label ID="NameLabel" runat="server" Text="خبر:" SkinID="Caption" CssClass="lable"></asp:Label>
            <asp:TextBox ID="NewsTitleTextBox" runat="server" SkinID="TextBox"></asp:TextBox>
               <asp:ImageButton ID="SearchImageButton" runat="server" OnClick="SearchImageButton_Click"
                   SkinID="PanelSearchImageButton" />
            <asp:ImageButton ID="ClearImageButton" runat="server" OnClick="ClearImageButton_Click" SkinID="PanelClearImageButton" />
            <asp:ListView ID="NewsListView" runat="server" DataSourceID="NewsEntityDataSource" AllowPaging="True" >
                <LayoutTemplate>
                    <asp:ImageButton runat="server" ID="SortButton" Text="" CommandName="Sort"  SkinID="PanelSortImageButton" CommandArgument="Date" />
                    <table runat="server" id="table1">
                        <tr runat="server" id="itemPlaceholder">
                        </tr>
                    </table>
                    <asp:DataPager runat="server" ID="DataPager" PageSize="3">
                        <Fields>
                            <asp:NumericPagerField ButtonCount="20" NumericButtonCssClass="pagination_sq" NextPreviousButtonCssClass="pagination_sq" CurrentPageLabelCssClass="pagination_sq_active" PreviousPageText="<<" NextPageText=">>" />
                        </Fields>
                    </asp:DataPager>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="general-info-block">
                        <p>
                            <!--- <img src="../Files/News/img-2.jpg" class="pages-content-img2" width="250" height="168" alt="news" />-->
                           <img src="<%# string.Format("../Images/News/{0}",Eval("ImageUrl")) %>" class="pages-content-img2" width="250" height="168" alt="news" />
                        
                        </p>
                        <h2><%# Eval("NewsTitle") %></h2>
                        <br />
                        <br />
                        <p>
                            <%# Eval("Description") %>
                        </p>
                        <a href="<%# string.Format("../Files/News/{0}",Eval("FileUrl"))%>">
                            <img src="../App_Themes/Default/images/read-more.png" alt="ادامه مطلب" width="83" height="17" border="0" class="read-more" /></a>
                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <div class="RadListView RadListView_WebBlue">
                        <div class="rlvEmpty">
                            خبری موجود نمی باشد
                        </div>
                    </div>
                </EmptyDataTemplate>
            </asp:ListView>


        </div>
    </div>
    <asp:EntityDataSource ID="NewsEntityDataSource" 
        runat="server" 
        ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities" 
        EnableFlattening="False" 
        EntitySetName="News" 
        AutoGenerateOrderByClause="True"
        Where="(@NewsTitle is null || it.NewsTitle LIKE '%' + @NewsTitle + '%' || it.Description LIKE '%' + @NewsTitle + '%')">
        <WhereParameters>
            <asp:ControlParameter ControlID="NewsTitleTextBox" Name="NewsTitle" Type="String" />
        </WhereParameters>
        <OrderByParameters>
            <asp:ControlParameter ControlID="NewsListView" Name="OrderBy" PropertyName="SortExpression"
                Type="String" />
        </OrderByParameters>
    </asp:EntityDataSource>
</asp:Content>
