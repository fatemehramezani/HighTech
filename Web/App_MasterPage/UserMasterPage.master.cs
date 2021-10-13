using System;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class App_MasterPage_UserMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Profile.UserName == null)
                Response.Redirect("~/Default.aspx");
            else
            {
                string[] roles = Roles.GetRolesForUser(Profile.UserName);
                if (roles.Contains("Administrator"))
                    UserSiteMapDataSource.SiteMapProvider = "Administrator";
                else if (roles.Contains("Applicant"))
                    UserSiteMapDataSource.SiteMapProvider = "Applicant";
                else
                    Response.Redirect("~/UnauthorizedAccess.aspx");
            }
        }        
    }
}
