using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Basic_SpecialService : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void SearchImageButton_Click(object sender, ImageClickEventArgs e)
    {
        SpecialServiceGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (SpecialServiceNameTextBox.Text != string.Empty)
        {
            SpecialServiceFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
    protected void ClearImageButton_Click(object sender, ImageClickEventArgs e)
    {
        SpecialServiceNameTextBox.Text = string.Empty;
        SpecialServiceFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";        
    }
    protected void NewImageButton_Click(object sender, ImageClickEventArgs e)
    {
        SpecialServiceFormView.ChangeMode(FormViewMode.Insert);
        SpecialServiceFormView.DataBind();
    }
    protected void SpecialServiceGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        SpecialServiceFormView.PageIndex = (SpecialServiceGridView.PageSize * SpecialServiceGridView.PageIndex) + SpecialServiceGridView.SelectedIndex;        
        SpecialServiceFormView.ChangeMode(FormViewMode.Edit);        
        SpecialServiceGridView.SelectedIndex = -1;
    }
    protected void SpecialServiceEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        SpecialServiceGridView.DataBind();
        SpecialServiceFormView.ChangeMode(FormViewMode.Insert);
    }

    protected void SpecialServiceFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        SpecialServiceFormView.DataBind();
    }
}