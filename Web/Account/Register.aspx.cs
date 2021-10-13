using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
public partial class Account_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
    }
    protected void RegisterUser_CreatedUser(object sender, EventArgs e)
    {
        if (Request.QueryString["Roles"] == null)
            Roles.AddUserToRole(RegisterUser.UserName, "Applicant");
        else
        {
            //Convert.ToBase64String(System.Text.Encoding.ASCII.GetBytes(x))
            string[] roles = (System.Text.Encoding.ASCII.GetString(Convert.FromBase64String(Request.QueryString["Roles"]))).Split(';');
            Roles.AddUserToRoles(RegisterUser.UserName, roles.Where(role => role != string.Empty).ToArray());
        }
        FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false);
    }
    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        string continueUrl = RegisterUser.ContinueDestinationPageUrl;
        if (String.IsNullOrEmpty(continueUrl))
            continueUrl = "~/Account/Profile.aspx";
        Response.Redirect(continueUrl);
    }
}
