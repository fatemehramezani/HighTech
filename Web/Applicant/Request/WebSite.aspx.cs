using DataLayer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Applicant_Request_WebSite : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void PresentationButton_Click(object sender, EventArgs e)
    {
        DatabaseEntities databaseEntities = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString());
        Applicant applicant = databaseEntities.Applicants.FirstOrDefault(item => item.Id == Profile.ApplicantId);
        if (applicant != null)
        {
            if (!applicant.IsWebSite)
            {
                applicant.IsWebSite = true;
                databaseEntities.SaveChanges();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", @"$('.fancybox').fancybox();simulateClick(""showAlert3"");", true);
                Response.Redirect("~/Applicant/Default.aspx");
            }
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", @"$('.fancybox').fancybox();simulateClick(""showAlert2"");", true);
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", @"$('.fancybox').fancybox();simulateClick(""showAlert1"");", true);
            Response.Redirect("~/Applicant/Default.aspx");
        }
    }
}