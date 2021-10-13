<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Faq.aspx.cs" Inherits="Guest_Faq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script>
        $(document).ready(function () {
            $(".signup-container").hide();
            $("#search-field").hide();
            $("#porsesh-form").hide();
            $("#porsesh").click(function () {
                $("#porsesh-form").animate({
                    width: "toggle",
                    opacity: "toggle"
                }, "medium");
            });
            //$(document).click(function() {
            //     $('#porsesh-form').fadeOut(300);
            //});
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    پرسش و  پاسخ
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
   <div class="content">
        <div class="services">
            <div class="acc-wrapper" runat="server" id="FaqDiv">
               
            </div>
        </div>
    </div>
    <asp:EntityDataSource runat="server" ID="FaqEntityDataSource" DefaultContainerName="DatabaseEntities" ConnectionString="name=DatabaseEntities" EnableFlattening="False" EntitySetName="Faqs"></asp:EntityDataSource>
    <asp:Button ID="AskButton" name="submit" runat="server" value="پرسش" Text="پرسش" OnClick="AskButton_Click" />
</asp:Content>
