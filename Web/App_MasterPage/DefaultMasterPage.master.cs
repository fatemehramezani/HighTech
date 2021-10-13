using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;

public partial class App_MasterPage_DefaultMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["ExceptionHandler"] != null)
        //    Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "ExceptionHandler", string.Format("showModalDialog('{0}/Exception/ExceptionHandler.aspx','', 'dialogWidth:390px;dialogHeight:360px;center:yes;status:no;scroll:no', '');", Request.ApplicationPath), true);
        if(!Page.IsPostBack)
            UserSiteMapDataSource.SiteMapProvider = "DefaultMasterPage";
        //if (!Page.IsPostBack)
        //{
        //    DatabaseEntities connection = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString());
        //    if (connection.Sentences.Count(sentence => sentence.IsDefault) > 0)
        //        sentenceSpan.InnerText =
        //            connection.Sentences.Where(sentence => sentence.IsDefault).OrderByDescending(
        //                sentence => sentence.InsertDate).First().SentenceText;
        //    else
        //        sentenceSpan.InnerText = "بازدید کننده محترم به سایت دکتر کاظمی خوش آمدید";
        //}        
    }
}
