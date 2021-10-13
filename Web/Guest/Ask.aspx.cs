using System;
using System.Configuration;
using System.Net;
using System.Web.UI;
using System.Net.Mail;
using ClassLibrary;
using DataLayer;

public partial class Guest_Ask : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AcceptImageButton_Click(object sender, ImageClickEventArgs e)
    {
        DataLayer.Faq contact = new DataLayer.Faq();
        contact.FaqTitle = TitleTextBox.Text;
        contact.Context = ContextTextBox.Text;
        contact.Email = EmailTextBox.Text;
        contact.Name = NameTextBox.Text;
        contact.Time = DateTime.Now;
        DatabaseEntities connection = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString());

        connection.Faqs.Add(contact);
        connection.SaveChanges();
        //TODO: Send Email
        SendEmail(contact);
        AskMultiView.ActiveViewIndex = 1;
    }
    private void SendEmail(DataLayer.Faq Faq)
    {
        string strBody = "<html><body>" +
          " <b><font color=\"green\">بیمار گرامی</font></b> <br/>"
          + " سوال شما تحت عنوان "
           + Faq.Name
           + " به زودی پاسخ داده خواهد شد." +
          "<br/>"
          + "سوال شما با محتوای زیر دریافت شد. در اسرع وقت پاسخگوی شما خواهیم بود." +
          "<br/>"
          + Faq.Context +
          "</body></html>";
        GmailSender.SendMail(ConfigurationManager.AppSettings["EmailUserName"],
                             ConfigurationManager.AppSettings["EmailPassword"], Faq.Email, string.Format("دریافت ایمیل با عنوان {0}", Faq.FaqTitle), strBody, ConfigurationManager.AppSettings["SmtpServer"], Convert.ToInt32(ConfigurationManager.AppSettings["Port"]));

    }
    protected void ReturnButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Faq.aspx");
    }
}