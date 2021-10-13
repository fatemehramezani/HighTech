using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Basic_Field : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void SearchImageButton_Click(object sender, ImageClickEventArgs e)
    {
        FieldGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (FieldNameTextBox.Text != string.Empty)
        {
            FieldFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
    protected void ClearImageButton_Click(object sender, ImageClickEventArgs e)
    {
        FieldNameTextBox.Text = string.Empty;
        FieldFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";        
    }
    protected void NewImageButton_Click(object sender, ImageClickEventArgs e)
    {
        FieldFormView.ChangeMode(FormViewMode.Insert);
        FieldFormView.DataBind();
    }
    protected void FieldGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        FieldFormView.PageIndex = (FieldGridView.PageSize * FieldGridView.PageIndex) + FieldGridView.SelectedIndex;        
        FieldFormView.ChangeMode(FormViewMode.Edit);        
        FieldGridView.SelectedIndex = -1;
    }
    protected void FieldEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        FieldGridView.DataBind();
        FieldFormView.ChangeMode(FormViewMode.Insert);
    }

    protected void FieldFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        FieldFormView.DataBind();
    }
}