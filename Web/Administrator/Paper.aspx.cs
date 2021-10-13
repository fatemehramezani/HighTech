using System.IO;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;

public partial class Admin_Paper : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
    }
    protected void PaperFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        PaperFormView.DataBind();
    }
    protected void PaperFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "CANCEL")
            //PaperFormView.ChangeMode(FormViewMode.Insert);
            PaperMultiView.SetActiveView(ShowView);
    }
    protected void PaperGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        PaperFormView.PageIndex = (PaperGridView.PageSize * PaperGridView.PageIndex) + PaperGridView.SelectedIndex;
        PaperMultiView.SetActiveView(EditView);
        PaperFormView.ChangeMode(FormViewMode.Edit);
        PaperGridView.DataBind();
        PaperGridView.SelectedIndex = -1;
    }
    protected void ClearImageButton_Click(object sender, EventArgs e)
    {
        PaperTitleTextBox.Text = string.Empty;
        PaperFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";
    }
    protected void SearchImageButton_Click(object sender, EventArgs e)
    {
        PaperGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (PaperTitleTextBox.Text != string.Empty)
        {
            PaperFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
    protected void NewImageButton_Click(object sender, ImageClickEventArgs e)
    {
        PaperMultiView.SetActiveView(EditView);
        PaperFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton_Click(sender, e);
        PaperFormView.DataBind();
    }
    protected void PaperEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        PaperGridView.DataBind();
        //PaperFormView.ChangeMode(FormViewMode.Insert);
        PaperMultiView.SetActiveView(ShowView);
    }
    protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
       PaperGridView.PageSize = int.Parse(PageSizeDropDownList.SelectedValue);
    }
    protected void PaperEntityDataSource_InsertingFiles(object sender, EntityDataSourceChangingEventArgs e)
    {
        string picturePath = "~/Images/Paper";
        string filePath = "~/Files/Paper";

        bool isChanged = true;
        if ((CheckBox)PaperFormView.FindControl("PictureCheckBox") != null)
            isChanged = ((CheckBox)PaperFormView.FindControl("PictureCheckBox")).Checked;

        if (isChanged)
        {
            FileUpload pictureFileUpload = (FileUpload)PaperFormView.FindControl("PictureFileUpload");
            if (pictureFileUpload.HasFile)
            {
                string imgpath = Server.MapPath(picturePath);
                if (!Directory.Exists(imgpath))
                    Directory.CreateDirectory(imgpath);

                string imgFile = imgpath + "\\" + pictureFileUpload.FileName;
                pictureFileUpload.SaveAs(imgFile);
                ((Paper)e.Entity).ImageUrl = pictureFileUpload.FileName;
            }
        }

        if ((CheckBox)PaperFormView.FindControl("FileCheckBox") != null)
            isChanged = ((CheckBox)PaperFormView.FindControl("FileCheckBox")).Checked;

        if (isChanged)
        {
            FileUpload fileFileUpload = (FileUpload)PaperFormView.FindControl("FileFileUpload");
            if (fileFileUpload.HasFile)
            {
                string imgpath = Server.MapPath(filePath);
                if (!Directory.Exists(imgpath))
                    Directory.CreateDirectory(imgpath);

                string imgFile = imgpath + "\\" + fileFileUpload.FileName;
                fileFileUpload.SaveAs(imgFile);
                ((Paper)e.Entity).FileUrl = fileFileUpload.FileName;
            }
        }
    }
}