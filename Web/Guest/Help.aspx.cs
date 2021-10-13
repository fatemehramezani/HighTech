using System;
using System.Configuration;
using System.Web.UI.HtmlControls;
using DataLayer;

public partial class Guest_Help : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string control = @"<div class=""layer1"">";
        //using (DatabaseEntities connection = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString()))
        //{
        //    foreach (Help help in connection.Helps)
        //    {
        //        control += string.Format(@"<p class=""heading"">{0}</p>", help.HelpTitle);
        //        control += string.Format(@"<div class=""content"">{0} <br/>{1} <br/>{2} </div>",
        //            help.ImageUrl == null ? "" : string.Format(@"<div align=""center""><img src=""{0}""  runat=""server"" id=""m"" width=""400"" height=""300""/> </div>", string.Format("../Images/Help/{0}", help.ImageUrl)),
        //            help.Description,
        //            help.FileUrl == null ? "" : string.Format(@"<a runat=""server"" id=""file"" href=""{0}"">بیشتر بدانید</a>", string.Format("../Files/Help/{0}", help.FileUrl))
        //            );
        //    }
        //    control += "</div>";
        //    if (control != string.Empty)
        //    {
        //        HtmlGenericControl div = new HtmlGenericControl();
        //        div.ID = "containDiv";
        //        div.InnerHtml = control;
        //        helpDiv.Controls.Add(div);
        //    }
        //}
    }
}