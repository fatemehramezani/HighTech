using DataLayer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Guest_News : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
    protected void ClearImageButton_Click(object sender, EventArgs e)
    {
        NewsTitleTextBox.Text = string.Empty;
        // NewsFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";

    }
    protected void SearchImageButton_Click(object sender, EventArgs e)
    {
        // NewsGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (NewsTitleTextBox.Text != string.Empty)
        {
            //NewsFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
}