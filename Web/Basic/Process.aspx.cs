using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Basic_Process : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void SearchImageButton_Click(object sender, ImageClickEventArgs e)
    {
        ProcessGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (ProcessNameTextBox.Text != string.Empty)
        {
            ProcessFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
    protected void ClearImageButton_Click(object sender, ImageClickEventArgs e)
    {
        ProcessNameTextBox.Text = string.Empty;
        ProcessFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";        
    }
    protected void NewImageButton_Click(object sender, ImageClickEventArgs e)
    {
        ProcessFormView.ChangeMode(FormViewMode.Insert);
        ProcessFormView.DataBind();
    }
    protected void ProcessGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        ProcessFormView.PageIndex = (ProcessGridView.PageSize * ProcessGridView.PageIndex) + ProcessGridView.SelectedIndex;        
        ProcessFormView.ChangeMode(FormViewMode.Edit);        
        ProcessGridView.SelectedIndex = -1;
    }
    protected void ProcessEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        ProcessGridView.DataBind();
        ProcessFormView.ChangeMode(FormViewMode.Insert);
    }

    protected void ProcessFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        ProcessFormView.DataBind();
    }
}