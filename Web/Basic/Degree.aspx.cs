using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Basic_Degree : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void SearchImageButton_Click(object sender, ImageClickEventArgs e)
    {
        DegreeGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (DegreeNameTextBox.Text != string.Empty)
        {
            DegreeFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
    protected void ClearImageButton_Click(object sender, ImageClickEventArgs e)
    {
        DegreeNameTextBox.Text = string.Empty;
        DegreeFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";        
    }
    protected void NewImageButton_Click(object sender, ImageClickEventArgs e)
    {
        DegreeFormView.ChangeMode(FormViewMode.Insert);
        DegreeFormView.DataBind();
    }
    protected void DegreeGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        DegreeFormView.PageIndex = (DegreeGridView.PageSize * DegreeGridView.PageIndex) + DegreeGridView.SelectedIndex;        
        DegreeFormView.ChangeMode(FormViewMode.Edit);        
        DegreeGridView.SelectedIndex = -1;
    }
    protected void DegreeEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        DegreeGridView.DataBind();
        DegreeFormView.ChangeMode(FormViewMode.Insert);
    }

    protected void DegreeFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        DegreeFormView.DataBind();
    }
}