using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Guest_GalleryIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string imagePath = "Gallery/Image";
        string thumbnailPath = "Gallery/Thumbnails";
        DirectoryInfo directory = new DirectoryInfo(Server.MapPath(imagePath));
        FileInfo[] files = directory.GetFiles();
        if (files.Length > 0)
            for (int i = 0; i < files.Length; i++)
                imagecontainer.InnerHtml += string.Format(@"<li><a href=""#""><img src=""{0}/{1}"" data-large=""{2}/{1}"" alt=""image{3}"" data-description=""تصویر شماره {3}"" /></a></li>", thumbnailPath, files[i].Name.ToString(), imagePath, i + 1);
    }
}



    