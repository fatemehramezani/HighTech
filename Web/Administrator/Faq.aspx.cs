using System;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Web.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary;
using DataLayer;

using MailMessage = System.Net.Mail.MailMessage;

public partial class Admin_Faq : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void FaqFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        FaqFormView.DataBind();
    }
    protected void FaqFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "CANCEL")
            MultiView.SetActiveView(ShowView);
    }
    protected void FaqGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        FaqFormView.PageIndex = (FaqGridView.PageSize * FaqGridView.PageIndex) + FaqGridView.SelectedIndex;
        MultiView.SetActiveView(EditView);
        FaqFormView.ChangeMode(FormViewMode.Edit);
        FaqGridView.DataBind();
        FaqGridView.SelectedIndex = -1;
    }
    protected void ClearImageButton_Click(object sender, ImageClickEventArgs e)
    {
        FaqTitleTextBox.Text = NameTextBox.Text = string.Empty;
        FaqFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";
        FaqGridView.DataBind();
    }
    protected void SearchImageButton_Click(object sender, ImageClickEventArgs e)
    {
        FaqGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (FaqTitleTextBox.Text != string.Empty ||
            NameTextBox.Text != string.Empty)
            ClearImageButton.OnClientClick = string.Empty;
        else
            ClearImageButton_Click(sender, e);
    }
    protected void FaqEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        FaqGridView.DataBind();
        MultiView.SetActiveView(ShowView);
    }
    protected void FaqEntityDataSource_Updated(object sender, EntityDataSourceChangedEventArgs e)
    {
        //TODO: Send an email
        SendEmail((Faq)e.Entity);
        FaqGridView.DataBind();
        MultiView.SetActiveView(ShowView);
    }
    private void SendEmail(Faq Faq)
    {
        string strBody = "<html><body>" +
   " <b><font color=\"green\">بیمار گرامی</font></b> <br/>"
   + Faq.Name +
   "<br/>"
   + "سوال شما با محتوای زیر دریافت شده بود:" +
   "<br/>"
   + Faq.Context +
   "<br/>"
   + "پاسخ شما به شرح ذیل است:"+
   "<br/>"
    + Faq.Answer +
   "</body></html>";
        GmailSender.SendMail(ConfigurationManager.AppSettings["EmailUserName"],
                             ConfigurationManager.AppSettings["EmailPassword"], Faq.Email, string.Format("پاسخ سوال با عنوان {0}", Faq.FaqTitle), strBody, ConfigurationManager.AppSettings["SmtpServer"], Convert.ToInt32(ConfigurationManager.AppSettings["Port"]));
    
    }
}


