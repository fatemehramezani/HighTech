using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.Configuration;
using System.Web.UI.HtmlControls;

public partial class Guest_Paper : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string control = string.Empty;
        using (DatabaseEntities connection = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString()))
        {
            List<Paper> papers = connection.Papers.ToList();
            int paperCount = papers.Count();
            PaperCountHiddenField.Value = paperCount.ToString();
            for (int i = 1; i <= paperCount; i++)
            {
                Paper paper = papers[i - 1];
                control += string.Format(@" 
                    <div class=""outer"" id=""tip_{0}"">
                        <div class=""tips-container"">
                            <p><strong>{1}</strong><br /> {2}</p>
                        </div>
                        <iframe class=""cover"" allowtransparency=""true""></iframe>
                    </div> ", i, paper.PaperTitle, paper.Description);
            }
            control += @"<div class=""content"">
                            <div class=""scroll"">
                                <div id=""content-5"" class=""sidebar"">
                                    <ul class=""article_ul"">";
            for (int i = 1; i <= paperCount; i++)
            {
                Paper paper = papers[i - 1];
                control += string.Format(@" <li class=""content-5-li"">
                            <a href=""#"" id=""tip__1"" data=""{0}"">
                                <textarea readonly border=""0"">{1}</textarea></a>
                        </li>", paper.FileUrl == null ? "" : string.Format(@"../Files/Paper/{0}", paper.FileUrl), paper.PaperTitle);
            }
            control += @"
                                    </ul>
                                </div>
                            </div>
                            <div class=""pdf-w"">
                                <object name=""window"" id=""window"" width=""590"" height=""800"" vspace=""0px"" type=""application/pdf"" data=""../Files/Paper/paper-2.pdf"">
                                    <embed src=""../Files/Paper/paper-2.pdf"" width=""590"" height=""800"" vspace=""0px"" name=""window""></embed>
                                    <p>Please update your browser to view PDF content!</p>
                                </object>
                            </div>
                        </div>";
            if (control != string.Empty)
                paperContainer.InnerHtml = control;
        }
    }
}