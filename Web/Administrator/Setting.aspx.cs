using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;

public partial class Admin_Setting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Interval.Text = ConfigurationManager.AppSettings["Interval"];
            VerificationSize.Text = ConfigurationManager.AppSettings["VerificationSize"];
            DateInterval.Text = ConfigurationManager.AppSettings["DateInterval"];
            Reminder.Text = ConfigurationManager.AppSettings["Reminder"];
        }
    }
    protected void ChangeButton_Click(object sender, EventArgs e)
    {
        Configuration myconf = WebConfigurationManager.OpenWebConfiguration("~");
        myconf.AppSettings.Settings["Interval"].Value = Interval.Text.Trim();
        myconf.AppSettings.Settings["VerificationSize"].Value = VerificationSize.Text;
        myconf.AppSettings.Settings["DateInterval"].Value = DateInterval.Text;
        myconf.AppSettings.Settings["Reminder"].Value = Reminder.Text;
        myconf.Save();
    }
}