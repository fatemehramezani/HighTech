using DataLayer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Guest_Service : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string control = @"<div class=""layer1"">";
        using (DatabaseEntities connection = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString()))
        {
            int counter = 0;
            foreach (Service service in connection.Services)
            {
                counter++;
                control += string.Format(@"<div class=""services-block""  {4}>
                                               <img src=""../Files/Service/{0}"" width=""211"" height=""141"" />
                                               <h6>{1}</h6>
                                                <div class=""services-block-p"">
                                                <p>{2}</p>
                                                </div>
                                                <div class=""readmore-2"">
                                                <a href=""../Files/Service/{3}"">
                                                <img src=""../App_Themes/Default/images/read-more.png"" alt=""ادامه مطلب"" width=""83"" height=""17"" border=""0"" /></a>
                                                </div>
                                            </div>", service.ImageUrl, service.ServiceTitle, service.Description, service.FileUrl, counter % 4 == 0 ? @"style=""margin-left: 0px !important;""" : "");
            }
            if (control != string.Empty)
            {
                HtmlGenericControl div = new HtmlGenericControl();
                div.ID = "containDiv";
                div.InnerHtml = control;
                serviceDiv.Controls.Add(div);
            }
        }
    }
}