using System.IO;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;

public partial class Admin_Help : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
    }
    protected void HelpFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        HelpFormView.DataBind();
    }
    protected void HelpFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "CANCEL")
            HelpFormView.ChangeMode(FormViewMode.Insert);
    }
    protected void HelpGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        HelpFormView.PageIndex = (HelpGridView.PageSize * HelpGridView.PageIndex) + HelpGridView.SelectedIndex;
        HelpFormView.ChangeMode(FormViewMode.Edit);
        HelpGridView.DataBind();
        HelpGridView.SelectedIndex = -1;
    }
    protected void ClearImageButton_Click(object sender, ImageClickEventArgs e)
    {
        HelpTitleTextBox.Text = string.Empty;
        HelpFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";
    }
    protected void SearchImageButton_Click(object sender, ImageClickEventArgs e)
    {
        HelpGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (HelpTitleTextBox.Text != string.Empty)
        {
            HelpFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
    protected void NewImageButton_Click(object sender, ImageClickEventArgs e)
    {
        HelpFormView.ChangeMode(FormViewMode.Insert);
        HelpFormView.DataBind();
    }
    protected void HelpEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        HelpGridView.DataBind();
        HelpFormView.ChangeMode(FormViewMode.Insert);
    }
    protected void HelpEntityDataSource_InsertingFiles(object sender, EntityDataSourceChangingEventArgs e)
    {
        string path = "~/Files/Help";

        bool isChanged = true;
        if ((CheckBox)HelpFormView.FindControl("PictureCheckBox") != null)
            isChanged = ((CheckBox)HelpFormView.FindControl("PictureCheckBox")).Checked;

        if (isChanged)
        {
            FileUpload pictureFileUpload = (FileUpload)HelpFormView.FindControl("PictureFileUpload");
            if (pictureFileUpload.HasFile)
            {
                string imgpath = Server.MapPath(path);
                if (!Directory.Exists(imgpath))
                    Directory.CreateDirectory(imgpath);

                string imgFile = imgpath + "\\" + pictureFileUpload.FileName;
                pictureFileUpload.SaveAs(imgFile);
                ((Help)e.Entity).ImageUrl = pictureFileUpload.FileName;
            }
        }

        if ((CheckBox)HelpFormView.FindControl("FileCheckBox") != null)
            isChanged = ((CheckBox)HelpFormView.FindControl("FileCheckBox")).Checked;

        if (isChanged)
        {
            FileUpload pictureFileUpload = (FileUpload)HelpFormView.FindControl("FileFileUpload");
            if (pictureFileUpload.HasFile)
            {
                string imgpath = Server.MapPath(path);
                if (!Directory.Exists(imgpath))
                    Directory.CreateDirectory(imgpath);

                string imgFile = imgpath + "\\" + pictureFileUpload.FileName;
                pictureFileUpload.SaveAs(imgFile);
                ((Help)e.Entity).FileUrl = pictureFileUpload.FileName;
            }
        }
    }
}