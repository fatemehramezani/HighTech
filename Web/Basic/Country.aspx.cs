using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Basic_Country : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void SearchImageButton_Click(object sender, ImageClickEventArgs e)
    {
        CountryGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (CountryNameTextBox.Text != string.Empty)
        {
            CountryFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
    protected void ClearImageButton_Click(object sender, ImageClickEventArgs e)
    {
        CountryNameTextBox.Text = string.Empty;
        CountryFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";        
    }
    protected void NewImageButton_Click(object sender, ImageClickEventArgs e)
    {
        CountryFormView.ChangeMode(FormViewMode.Insert);
        CountryFormView.DataBind();
    }
    protected void CountryGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        CountryFormView.PageIndex = (CountryGridView.PageSize * CountryGridView.PageIndex) + CountryGridView.SelectedIndex;        
        CountryFormView.ChangeMode(FormViewMode.Edit);        
        CountryGridView.SelectedIndex = -1;
    }
    protected void CountryEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        CountryGridView.DataBind();
        CountryFormView.ChangeMode(FormViewMode.Insert);
    }

    protected void CountryFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        CountryFormView.DataBind();
    }
}