using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {            
            UserSiteMapDataSource.SiteMapProvider = "Default";
            if (Profile.UserName != null)
            {
                string[] roles = Roles.GetRolesForUser(Profile.UserName);
                if (roles.Contains("Administrator"))
                    Response.Redirect("~/Administrator/Default.aspx");
                else if (roles.Contains("Applicant"))
                    Response.Redirect("~/Applicant/Default.aspx");
                else
                    Response.Redirect("~/UnauthorizedAccess.aspx");
            }
        }
    }
}