<%@ Page Title="" Language="C#" MasterPageFile="~/App_MasterPage/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Schedular.aspx.cs" Inherits="Guest_Schedular" %>
<%@ OutputCache duration="10" varybyparam="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style>
        #time {
            font-family: "B Roya",'B Roya',Tahoma,Arial,Helvetica,sans-serif;
            width: 100%;
            border-collapse: collapse;
            text-align: right;
        }

            #time th {
                font-size: 1.4em;
                text-align: center;
                padding-top: 5px;
                padding-bottom: 4px;
                background-color: rgb(2, 180, 222);
                color: rgb(255, 255, 255);
            }

            #time td, #time th {
                font-size: 1.2em;
                border: 1px solid rgb(2, 180, 222);
                padding: 3px 7px 2px;
            }
            #time .alt {
                background-color: rgb(62, 215, 253);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="Server">
    زمانبندی نمایشگاه
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

        <strong>برنامه زمانی نمایشگاه به شرح ذیل است:
        </strong>
    <table id="time">
        <tbody>
            <tr>
                <th>عنوان</th>
                <th>برنامه زمانی</th>
                <th>روز</th>
            </tr>
            <tr>
                <td>حضور  معاون وزیر جهت بازدید از نمایشگاه</td>
                <td>از ساعت 15:00 تا ساعت 19:00</td>
                <td>1393/09/20</td>
            </tr>
            <tr class="alt">
               <td>حضور  معاون وزیر جهت بازدید از نمایشگاه</td>
                <td>از ساعت 15:00 تا ساعت 19:00</td>
                <td>1393/09/20</td>
            </tr>
            <tr>
                  <td>حضور  معاون وزیر جهت بازدید از نمایشگاه</td>
                <td>از ساعت 15:00 تا ساعت 19:00</td>
                <td>1393/09/20</td>
            </tr>
            <tr class="alt">
                  <td>حضور  معاون وزیر جهت بازدید از نمایشگاه</td>
                <td>از ساعت 15:00 تا ساعت 19:00</td>
                <td>1393/09/20</td>
            </tr>
            <tr>
                   <td>حضور  معاون وزیر جهت بازدید از نمایشگاه</td>
                <td>از ساعت 15:00 تا ساعت 19:00</td>
                <td>1393/09/20</td>
            </tr>
            <tr class="alt">
                <td>حضور  معاون وزیر جهت بازدید از نمایشگاه</td>
                <td>از ساعت 15:00 تا ساعت 19:00</td>
                <td>1393/09/20</td>
            </tr>
          <tr>
                <td>حضور  معاون وزیر جهت بازدید از نمایشگاه</td>
                <td>از ساعت 15:00 تا ساعت 19:00</td>
                <td>1393/09/20</td>
            </tr>
            <tr class="alt">
               <td>حضور  معاون وزیر جهت بازدید از نمایشگاه</td>
                <td>از ساعت 15:00 تا ساعت 19:00</td>
                <td>1393/09/20</td>
            </tr>
            <tr>
                  <td>حضور  معاون وزیر جهت بازدید از نمایشگاه</td>
                <td>از ساعت 15:00 تا ساعت 19:00</td>
                <td>1393/09/20</td>
            </tr>
            <tr class="alt">
                  <td>حضور  معاون وزیر جهت بازدید از نمایشگاه</td>
                <td>از ساعت 15:00 تا ساعت 19:00</td>
                <td>1393/09/20</td>
            </tr>
            <tr>
                   <td>حضور  معاون وزیر جهت بازدید از نمایشگاه</td>
                <td>از ساعت 15:00 تا ساعت 19:00</td>
                <td>1393/09/20</td>
            </tr>
            <tr class="alt">
                <td>حضور  معاون وزیر جهت بازدید از نمایشگاه</td>
                <td>از ساعت 15:00 تا ساعت 19:00</td>
                <td>1393/09/20</td>
            </tr>
        </tbody>
    </table>
</asp:Content>

