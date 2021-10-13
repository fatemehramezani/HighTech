using System;
using System.Configuration;
using System.Net;
using System.Web.UI;
using System.Net.Mail;
using ClassLibrary;
using DataLayer;


public partial class Guest_Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ReturnButton_Click(object sender, EventArgs e)
    {
        ContactMultiView.SetActiveView(SendView);
    }

    protected void AcceptImageButton_Click(object sender, EventArgs e)
    {
        DataLayer.Contact contact = new DataLayer.Contact();
        contact.Context = comments.Text;
        contact.Email = email.Text;
        contact.Name = name.Text;
        contact.Time = DateTime.Now;
        DatabaseEntities connection = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString());
        connection.Contacts.Add(contact);
        connection.SaveChanges();
        SendEmail(contact);
        ContactMultiView.SetActiveView(FinishView);
    }
    private void SendEmail(DataLayer.Contact contact)
    {
        string strBody = "<html><body>" +
           " <b><font color=\"green\">متقاضی گرامی</font></b> <br/>"
           + contact.Name +
           "<br/>"
           + "ایمیل شما با محتوای زیر دریافت شد. در اسرع وقت پاسخگوی شما خواهیم بود." +
           "<br/>"
           + contact.Context +
           "</body></html>";
        GmailSender.SendMail(ConfigurationManager.AppSettings["EmailUserName"],
                             ConfigurationManager.AppSettings["EmailPassword"], contact.Email, string.Format("دریافت ایمیل با عنوان {0}", contact.Name), strBody, ConfigurationManager.AppSettings["SmtpServer"], Convert.ToInt32(ConfigurationManager.AppSettings["Port"]));
    }
}