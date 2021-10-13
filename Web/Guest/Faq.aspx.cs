using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using DataLayer;

public partial class Guest_Faq : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
        string control = @"<ul role=""tablist"" class=""services-list ui-accordion ui-widget ui-helper-reset ui-accordion-icons"">";
        using (DatabaseEntities connection = new DatabaseEntities(ConfigurationManager.ConnectionStrings["DatabaseEntities"].ToString()))
        {
            foreach (Faq Faq  in connection.Faqs)
            {
                control += string.Format(@"<li class=""ui-accordion-li-fix"">
                        <h2 tabindex=""-1"" aria-selected=""false"" aria-expanded=""false"" role=""tab"" class=""ui-accordion-header ui-helper-reset ui-state-default ui-corner-all""><span style=""left: 600px;"" class=""ui-icon ui-icon-triangle-1-e""></span>
                            <a tabindex=""-1"" href=""#"" title=""""> {1} </a>						</h2>
                        <div style=""display: none; overflow: visible; padding-top: 0px; padding-bottom: 0px;"" role=""tabpanel"" class=""ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom"">
                            <div class=""service-content"">
                                <div class=""service-info-text"" dir=""rtl"">
                                    <div class=""service-content"">
                                        <div class=""service-info-text"" dir=""rtl"">
                                            {0}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>  ",Faq.Answer,Faq.Context);
            }
          
        }


        control += "</ul>";
        if (control != string.Empty)
        {
            HtmlGenericControl div = new HtmlGenericControl();
            //div.ID = "containDiv";
            div.InnerHtml = control;
            FaqDiv.Controls.Add(div);
        }
    }
    protected void AskButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Ask.aspx");
    }
}