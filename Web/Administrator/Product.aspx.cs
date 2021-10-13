using DataLayer;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Administrator_Product : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
    }
    protected void ProductFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        ProductFormView.DataBind();
    }
    protected void ProductFormView_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName.ToUpper() == "CANCEL")
        {
            ProductMultiView.SetActiveView(ShowView);
            ProductFormView.ChangeMode(FormViewMode.Insert);
        }
    }
    protected void ProductGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        ProductFormView.PageIndex = (ProductGridView.PageSize * ProductGridView.PageIndex) + ProductGridView.SelectedIndex;
        ProductFormView.ChangeMode(FormViewMode.Edit);
        ProductMultiView.SetActiveView(EditView);
        ProductGridView.DataBind();
        ProductGridView.SelectedIndex = -1;
    }
    protected void ClearImageButton_Click(object sender, EventArgs e)
    {
        NameTextBox.Text = string.Empty;
        ProductFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton.OnClientClick = "return false;";
    }
    protected void SearchImageButton_Click(object sender, EventArgs e)
    {
        ProductGridView.PageSize = (PageSizeDropDownList.SelectedIndex == -1 || PageSizeDropDownList.SelectedValue == "0" ? 5 : Convert.ToInt32(PageSizeDropDownList.SelectedValue));
        if (NameTextBox.Text != string.Empty || DescriptionTextBox.Text != string.Empty)
        {
            ProductFormView.ChangeMode(FormViewMode.Insert);
            ClearImageButton.OnClientClick = string.Empty;
        }
        else
            ClearImageButton_Click(sender, e);
    }
    protected void NewImageButton_Click(object sender, ImageClickEventArgs e)
    {
        ProductMultiView.SetActiveView(EditView);
        ProductFormView.ChangeMode(FormViewMode.Insert);
        ClearImageButton_Click(sender, e);
        ProductFormView.DataBind();
    }
    protected void ProductEntityDataSource_Command(object sender, EntityDataSourceChangedEventArgs e)
    {
        ProductGridView.DataBind();
        ProductFormView.ChangeMode(FormViewMode.Insert);
        ProductMultiView.SetActiveView(ShowView);
    }
    protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
       ProductGridView.PageSize = int.Parse(PageSizeDropDownList.SelectedValue);
    }
    protected void ProductEntityDataSource_InsertingFiles(object sender, EntityDataSourceChangingEventArgs e)
    {
        ((Product)e.Entity).ApplicantId = Profile.ApplicantId;
        ((Product)e.Entity).IsRequested = false;
        bool isChanged = true;
        if ((CheckBox)ProductFormView.FindControl("PictureCheckBox") != null)
            isChanged = ((CheckBox)ProductFormView.FindControl("PictureCheckBox")).Checked;
        if (isChanged)
        {
            FileUpload pictureFileUpload = (FileUpload)ProductFormView.FindControl("PictureFileUpload");
            if (pictureFileUpload.PostedFile != null && pictureFileUpload.PostedFile.FileName != "")
            {
                byte[] myimage = new byte[pictureFileUpload.PostedFile.ContentLength];
                HttpPostedFile Image = pictureFileUpload.PostedFile;
                Image.InputStream.Read(myimage, 0, (int)pictureFileUpload.PostedFile.ContentLength);
                ((Product)e.Entity).Image = myimage;
            }
        }
    }
}