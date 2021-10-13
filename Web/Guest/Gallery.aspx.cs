using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Guest_Gallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
//        string imagePath = "Gallery/Image";
//        string thumbnailPath = "Gallery/Thumbnails";
//        DirectoryInfo directory = new DirectoryInfo(Server.MapPath(imagePath));
//        FileInfo[] files = directory.GetFiles();
//        if (files.Length > 0)
//        {
//            for (int i = 0; i < files.Length; i++)
//            {
//                imagecontainer.InnerHtml += string.Format(@"<li><img class=""active"" src=""{0}/{1}"" title=""تصویر شماره {3}"" alt="""" width=""605"" height=""375"" onmouseover=""this.style.opacity=1;this.filters.alpha.opacity=100""
//                                    onmouseout=""this.style.opacity=0.4;this.filters.alpha.opacity=70"" />  </li>  ",
//                                                                                                            imagePath, files[i].Name.ToString(), imagePath, i + 1);
//            }
//        }
    }
    protected void LoginUser_LoggedIn(object sender, EventArgs e)
    {
        //if (Roles.IsUserInRole(LoginUser.UserName, "Administrator"))
        //    Response.Redirect("~/Administrator/Default.aspx");
        //else if (Roles.IsUserInRole(LoginUser.UserName, "Doctor"))
        //    Response.Redirect("~/Doctor/Default.aspx");
        //else if (Roles.IsUserInRole(LoginUser.UserName, "Nurse"))
        //    Response.Redirect("~/Nurse/Default.aspx");
        //else if (Roles.IsUserInRole(LoginUser.UserName, "Patient"))
        //    Response.Redirect("~/Patient/Default.aspx");
        //else
        //    Response.Redirect("~/Default.aspx");
    }
}