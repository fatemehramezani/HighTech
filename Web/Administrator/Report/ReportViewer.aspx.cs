using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Report_ReportViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Report.ReportFile = string.Format("~/Administrator/Report/{0}.frx", Request.QueryString["Name"] != null ? Request.QueryString["Name"]:"Product");
    }
}