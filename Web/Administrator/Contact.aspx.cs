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

public partial class Admin_Contact : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void ContactFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        ContactFormView.DataBind();
    }
    protected void ContactFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "CANCEL")
            MultiView.SetActiveView(ShowView);
    }
    protected void ContactGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        ContactFormView.PageIndex = (ContactGridView.PageSize * ContactGridView.PageIndex) + ContactGridView.SelectedIndex;
        MultiView.SetActiveView(EditView);
        ContactFormView.ChangeMode(FormViewMode.Edit);
        ContactGridView.DataBind();
        ContactGridView.SelectedIndex = -1;
    }
    protected void ClearImageButton_Click(object sender, ImageClickEventArgs e)
    {
        ContactTitleTextBox.Text = NameTextBox.Text = string.Empty;
        ContactFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";
        ContactGridView.DataBind();
    }
    protected void SearchImageButton_Click(object sender, ImageClickEventArgs e)
    {
        ContactGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (ContactTitleTextBox.Text != string.Empty ||
            NameTextBox.Text != string.Empty)
            ClearImageButton.OnClientClick = string.Empty;
        else
            ClearImageButton_Click(sender, e);
    }    
    protected void ContactEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {        
        ContactGridView.DataBind();
        MultiView.SetActiveView(ShowView);
    }
    protected void ContactEntityDataSource_Updated(object sender, EntityDataSourceChangedEventArgs e)
    {
        //TODO: Send an email
        SendEmail((Contact)e.Entity);
        ContactGridView.DataBind();
        MultiView.SetActiveView(ShowView);
    }
    private void SendEmail(Contact contact)
    {
        string strBody = "<html><body>" +
   " <b><font color=\"green\">بیمار گرامی</font></b> <br/>"
   + contact.Name +
   "<br/>"
   + "ایمیل شما با محتوای زیر دریافت شده بود:" +
   "<br/>"
   + contact.Context +
   "<br/>"
   +"پاسخ شما به شرح ذیل است:"+
   "<br/>"
    +contact.Answer +
   "</body></html>";
        GmailSender.SendMail(ConfigurationManager.AppSettings["EmailUserName"],
                             ConfigurationManager.AppSettings["EmailPassword"], contact.Email, string.Format("پاسخ ایمیل با عنوان {0}", contact.Name), strBody, ConfigurationManager.AppSettings["SmtpServer"], Convert.ToInt32(ConfigurationManager.AppSettings["Port"]));
    
    }
}