using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Sentence : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
    }
    protected void SentenceFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        SentenceFormView.DataBind();
    }
    protected void SentenceFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "CANCEL")
            SentenceFormView.ChangeMode(FormViewMode.Insert);
    }
    protected void SentenceGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        SentenceFormView.PageIndex = (SentenceGridView.PageSize * SentenceGridView.PageIndex) + SentenceGridView.SelectedIndex;
        SentenceFormView.ChangeMode(FormViewMode.Edit);
        SentenceGridView.DataBind();
        SentenceGridView.SelectedIndex = -1;
    }
    protected void ClearImageButton_Click(object sender, ImageClickEventArgs e)
    {
        SentenceTextTextBox.Text = string.Empty;
        SentenceFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";
    }
    protected void SearchImageButton_Click(object sender, ImageClickEventArgs e)
    {
        SentenceGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (SentenceTextTextBox.Text != string.Empty)
        {
            SentenceFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
    protected void NewImageButton_Click(object sender, ImageClickEventArgs e)
    {
        SentenceFormView.ChangeMode(FormViewMode.Insert);
        SentenceFormView.DataBind();
    }
    protected void SentenceEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        SentenceGridView.DataBind();
        SentenceFormView.ChangeMode(FormViewMode.Insert);
    }
}